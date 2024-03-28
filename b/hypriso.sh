#!/bin/bash

# Define variables
DISISO="$HOME/Downloads/debian-12.5.0-amd64-netinst.iso"
DOWNLOADS="$HOME/Downloads"
WORK_DIR="$DOWNLOADS/livecdtmp"
ISO_NAME="REMASTER.iso"

# Create necessary directories
mkdir -p "$WORK_DIR/extract-cd" "$WORK_DIR/mnt"

# Mount the ISO
sudo mount -o loop "$DISISO" "$WORK_DIR/mnt"

# Extract the ISO contents
sudo rsync --exclude=/casper/filesystem.squashfs -a "$WORK_DIR/mnt/" "$WORK_DIR/extract-cd"
sudo unsquashfs "$WORK_DIR/mnt/casper/filesystem.squashfs"
sudo mv squashfs-root "$WORK_DIR/edit"
sudo cp /etc/resolv.conf "$WORK_DIR/edit/etc/"

# Bind mount essential system directories
sudo mount --bind /dev/ "$WORK_DIR/edit/dev"
sudo mount -t devpts devpts "$WORK_DIR/edit/dev/pts"
sudo mount -t proc proc "$WORK_DIR/edit/proc"
sudo mount -t sysfs sysfs "$WORK_DIR/edit/sys"

# Enter the chroot environment
sudo chroot "$WORK_DIR/edit" bash <<EOF

# Install additional packages
apt-get update
apt-get install -y \
    xcb cmake gcc libgtk-3-dev ninja-build libgtkmm-3.0-dev \
    libxcb-randr0 libxcb-randr0-dev libxcb-util-dev libxcb-util0-dev \
    libxcb-util1 libxcb-ewmh-dev libxcb-xinerama0 libxcb-xinerama0-dev \
    libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-cursor-dev libxcb-shape0-dev \
    build-essential git

# Clone and build Hypr
cd /root
git clone https://github.com/vaxerski/Hypr
cd Hypr
make clear && make release

# Clean up
apt-get clean
apt-get autoremove
rm -rf /tmp/* ~/.bash_history

EOF

# Exit the chroot environment
sudo umount "$WORK_DIR/edit/proc/sys/fs/binfmt_misc"
sudo umount "$WORK_DIR/edit/proc"
sudo umount "$WORK_DIR/edit/sys"
sudo umount "$WORK_DIR/edit/dev/pts"
sudo umount "$WORK_DIR/edit/dev"

# Unmount the ISO
sudo umount "$WORK_DIR/mnt"

# Create the new ISO
echo "Creating ISO..."
sleep 3
sudo rm "$WORK_DIR/extract-cd/casper/filesystem.squashfs"
cd "$WORK_DIR"
sudo mksquashfs edit "$WORK_DIR/extract-cd/casper/filesystem.squashfs"
sudo vim "$WORK_DIR/extract-cd/README.diskdefines"
cd "$WORK_DIR/extract-cd"
sudo rm MD5SUMS
find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee MD5SUMS
sudo genisoimage -l -r -J -V "REMASTER" -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -c isolinux/boot.cat -o "$DOWNLOADS/$ISO_NAME"

# Change permissions
sudo chmod 777 "$DOWNLOADS/$ISO_NAME"

echo "ISO creation complete: $DOWNLOADS/$ISO_NAME"
