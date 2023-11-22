﻿Pcap_DNSProxy
=====
Pcap_DNSProxy, a local DNS server based on WinPcap and LibPcap

Forked from [chengr28/Pcap_DNSProxy](https://github.com/chengr28/Pcap_DNSProxy) ([backup](https://github.com/Lyoko-Jeremie/Pcap_DNSProxy))

### Releases
[![GitHub release](https://img.shields.io/github/release/UjuiUjuMandan/Pcap_DNSProxy.svg)](https://github.com/UjuiUjuMandan/Pcap_DNSProxy/releases/latest)

### Usage

### Summary
Pcap_DNSProxy 是一个基于 WinPcap/LibPcap 用于过滤 DNS 投毒污染的工具，提供便捷和强大的包含正则表达式的修改 Hosts 的方法，以及对 DNSCurve/DNSCrypt 协议、并行和 TCP 协议请求的支持。多服务器并行请求功能，更可提高在恶劣网络环境下域名解析的可靠性：
* IPv4/IPv6 协议双栈支持，并可自定义多端口多地址监听和远程请求协议
* 服务器模式为其它设备提供解析服务，可限制请求范围
* 支持对 CNAME 记录和解析结果进行 Hosts 并同时支持 Local Hosts 境内 DNS 服务器解析，可提高对境内域名解析速度和服务器访问速度
* 主要/备用双服务器模式，境外服务器支持并行多次请求，提高 DNS 解析可靠性
* 独立 DNS 缓存、EDNS 标签、DNSSEC 请求功能以及完整的 DNSCurve/DNSCrypt 协议支持
* 原生 SOCKS 版本 4/4a/5 和 HTTP CONNECT 隧道协议包括 TLS/SSL 加密连接的支持
* 丰富的配置参数和选项以及错误报告功能
* 支持 ASCII 和 UTF-8(/BOM) 和 UTF-16(LE/BE) 和 UTF-32(LE/BE) 编码以及 Unicode 标准要求实现的所有空格/换行格式

### Platform
* Windows
  * **64位/x64版本：Windows Vista/2008 以及更新的版本**
  * **32位/x86版本：Windows XP SP3/2003 SP2 以及更新的版本**
* FreeBSD/Linux
  * 支持 编译所需依赖包 的 FreeBSD/Linux 版本
* macOS
  * **支持 64 位 Mac OS X 10.8(Mountain Lion) 以及更新的 macOS 版本**
* OpenWrt/LEDE
  * **参见 [openwrt-Pcap_DNSProxy 项目](https://github.com/wongsyrone/openwrt-Pcap_DNSProxy)**
  * 也请参阅 [OpenWrt/LEDE LuCI for Pcap-DNSProxy](https://github.com/muink/luci-app-pcap-dnsproxy/tree/master)
* 本工具**抓包模块**所支持的网络类型
  * 网络设备类型为 Ethernet 和 Apple IEEE 1394/FireWire 的网络
  * 原生 IPv4/PPPoE 和 IPv6/PPPoEv6 网络

### License
GNU General Public License/GNU GPL v2
