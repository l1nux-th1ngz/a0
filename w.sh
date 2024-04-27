#!/bin/bash

# Define the URLs of the packages to be downloaded
declare -a urls=(
"https://cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.3.tar.gz"
"https://nodejs.org/dist/v21.7.3/node-v21.7.3-linux-x64.tar.xz"
"https://www.php.net/distributions/php-8.3.4.tar.gz"
"https://go.dev/dl/go1.22.2.linux-amd64.tar.gz"
"https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
"https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb"
"https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz"
"https://github.com/oracle/visualvm/releases/download/2.1.8/visualvm_218.zip"
"https://download.geany.org/geany-2.0.tar.gz"
"https://plugins.geany.org/geany-plugins/geany-plugins-2.0.tar.gz"
"https://download.geany.org/colombanw-pubkey.txt"
"https://www.apache.org/dyn/closer.lua/netbeans/netbeans-installers/21/apache-netbeans_21-1_all.deb"
"https://go.microsoft.com/fwlink/?LinkID=760868"
"https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
"https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-x64.tar.xz"
"https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tar.xz"
)

# Download, extract, and install each package
for url in "${urls[@]}"; do
    filename=$(basename "$url")
    wget "$url"
    case "$filename" in
        *.tar.gz) tar -xzf "$filename" ;;
        *.tar.xz) tar -xf "$filename" ;;
        *.deb) dpkg -i "$filename" ;;
        *.zip) unzip "$filename" ;;
        *.txt) echo "Skipping text file $filename" ;;
        *) echo "Unknown file type $filename" ;;
    esac
    rm "$filename"
done
