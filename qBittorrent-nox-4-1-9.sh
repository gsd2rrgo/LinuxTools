apt-get update

apt-get install build-essential pkg-config automake libtool git libgeoip-dev python3 python3-dev -y

apt-get install libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev libssl-dev -y

apt-get install qtbase5-dev qttools5-dev-tools libqt5svg5-dev zlib1g-dev -y

wget https://github.com/arvidn/libtorrent/releases/download/libtorrent-1_1_13/libtorrent-rasterbar-1.1.13.tar.gz

tar xf libtorrent-rasterbar-1.1.13.tar.gz

cd libtorrent-rasterbar-1.1.13

./configure --disable-debug --enable-encryption --with-libgeoip=system

make -j$(nproc)

make install

ldconfig

cd
wget https://github.com/qbittorrent/qBittorrent/archive/release-4.1.9.tar.gz
tar xf release-4.1.9.tar.gz
cd qBittorrent-release-4.1.9
./configure --disable-gui --disable-debug
make -j$(nproc)
make install