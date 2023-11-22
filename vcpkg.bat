cd vcpkg
.\vcpkg install libevent libpcap libsodium openssl
.\vcpkg remove libpcap
.\vcpkg install winpcap
.\vcpkg install libevent:x86-windows libpcap:x86-windows libsodium:x86-windows openssl:x86-windows
.\vcpkg remove libpcap:x86-windows
.\vcpkg install winpcap:x86-windows
