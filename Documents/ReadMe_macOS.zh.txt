安装方法（使用已编译好的二进制可执行文件）：

1.打开下载的二进制可执行文件包，将 macOS 目录解压到磁盘的任意位置
2.编辑 pcap_dnsproxy.service.plist 文件
  * 清空 <string>/usr/local/opt/pcap_dnsproxy/bin/Pcap_DNSProxy</string> 标签内的内容
  * 改为 "<string>程序所在的完整路径/程序名称</string>"（不含引号）
  * 清空 <string>/usr/local/etc/pcap_dnsproxy</string> 标签内的内容
  * 改为 "<string>程序所在的完整路径</string>"（不含引号）
3.打开终端，使用 sudo -i 获得 root 权限并进入 macOS 目录内：
  * 使用 cd 切换回程序所在目录
  * 使用 chmod 755 macOS_Install.sh 使服务安装脚本获得可执行权限
  * 使用 ./macOS_Install.sh 执行服务安装脚本
  * 脚本所进行的操作：
    * 设置程序、脚本以及 plist 配置文件的基本读写执行权限
    * 装载并启动守护进程服务
    * 每次开机在登录前守护进程服务都将自动启动
4.请按照下文 正常工作查看方法 一节，先对程序是否在正常工作进行测试再修改网络配置！
5.打开 "系统偏好设置" 窗口
  * 进入 "网络" 部分
  * 选中使用的网络适配器，点击 "高级" 按钮
  * 切换到 "DNS" 选项卡，并点击 "DNS 服务器" 下的 "+" 号
  * 输入 127.0.0.1(IPv4)/::1(IPv6)
    * 请务必确保只填入这两个地址，填入其它地址可能会导致系统选择其它 DNS 服务器绕过程序的代理
  * 按 "好" 再按 "应用" 即可


-------------------------------------------------------------------------------


安装方法（编译二进制可执行文件）：

1.准备程序编译环境
  * 完整的第三方依赖列表：
    * CMake
    * LibEvent
    * LibPcap
      * 本依赖可根据编译参数剥离
    * LibSodium
      * 本依赖可根据编译参数剥离
    * OpenSSL
      * 本依赖可根据编译参数剥离

2.编译 Pcap_DNSProxy 程序并配置程序属性
  * 使用终端进入 Source/Auxiliary/Scripts 目录，使用 chmod 755 CMake_Build.sh 使脚本获得执行权限
  * 使用 ./CMake_Build.sh 执行编译程序
    * 脚本所进行的操作：
      * CMake 将编译并在 Release 目录生成 Pcap_DNSProxy 程序
      * 从 ExampleConfig 目录和 Scripts 目录复制所需的脚本和默认配置文件到 Release 目录，并设置基本读写可执行权限
  * 使用 ./CMake_Build.sh 脚本时可提供的参数：
    * 执行时使用 ./CMake_Build.sh --disable-libpcap --disable-libsodium --disable-tls 可剥离对对应库的依赖，不建议使用
    * 剥离后编译时将不再需要该库的支持，但同时将完全失去使用该库所支持的功能，且运行时将不会产生任何提示，慎用！

3.按照安装方法（使用已编译好的二进制可执行文件）中第 3 步的操作继续进行即可


-------------------------------------------------------------------------------


有关 OpenSSL 库的特别说明：
默认情况下 OpenSSL 库没有附带任何的可信任根证书库，首次使用时需要用户自行添加：

* 打开实用工具 - 钥匙串访问 - 系统根证书，选中列表中所有的证书以 cert.pem 的 PEM 格式导出到任何位置
* 打开终端，使用 sudo -i 获得 root 权限并进入刚才导出位置的目录内
* 使用 mv cert.pem 证书目标目录/cert.pem 移动该系统根证书储存文件到 OpenSSL 的证书目录中
* 此处的证书目标目录，位于上文提到的 Found OpenSSL 指示的 CMake 找到的 OpenSSL 库部署目录附近，该目录内应该存在名为 certs 的子目录
* 例如 mv cert.pem /usr/local/ssl


-------------------------------------------------------------------------------


重启服务方法：
1.打开终端，使用 sudo -i 获得 root 权限并进入 /Library/LaunchDaemons 目录内
2.使用 launchctl unload pcap_dnsproxy.service.plist 停止服务，稍等一段时间
3.使用 launchctl load pcap_dnsproxy.service.plist 启动服务即可


小更新的方法（需要以管理员身份进行，如果配置文件的 Version 有更新需要进行大更新）：
1.打开终端，使用 sudo -i 获得 root 权限并进入 /Library/LaunchDaemons 目录内
2.使用 launchctl unload pcap_dnsproxy.service.plist 停止服务
3.将 macOS 目录内的所有可执行文件删除
4.将新版本的 Pcap_DNSProxy 的所有可执行文件解压到相同位置
5.使用 launchctl load pcap_dnsproxy.service.plist 启动服务即可


大更新的方法（需要以管理员身份进行，切勿直接覆盖，否则可能会造成不可预料的错误）：
1.打开终端，使用 sudo -i 获得 root 权限并进入 macOS 目录内
2.使用 ./macOS_Uninstall.sh 执行服务卸载脚本
3.备份所有配置文件，删除所有 Pcap_DNSProxy 相关文件
  * 进行第 4 步前先将备份的配置文件还原到 macOS 目录内
4.按照安装方法重新部署 Pcap_DNSProxy
  * Config.conf 文件建议按照备份的配置文件重新设置，如直接覆盖可能会导致没有新功能的选项


卸载方法：
1.还原系统网络配置
2.打开终端，使用 sudo -i 获得 root 权限并进入 macOS 目录内
3.使用 ./macOS_Uninstall.sh 执行服务卸载脚本
  * 脚本所进行的操作：停止并卸载守护进程服务，删除 plist 配置文件
4.删除所有 Pcap_DNSProxy 相关文件


-------------------------------------------------------------------------------


正常工作查看方法：

1.打开终端
2.输入 dig @127.0.0.1 www.google.com 或者 dig @::1 www.google.com 并回车
3.运行结果应类似：

   >dig www.google.com
   ; (1 server found)
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: ..
   ;; flags: ..; QUERY: .., ANSWER: .., AUTHORITY: .., ADDITIONAL: ..

   ;; QUESTION SECTION:
   ;www.google.com.            IN    A

   ;; ANSWER SECTION:
   ..

   ;; Query time: .. msec
   ;; SERVER: ::1#53(::1)（视所在网络环境而定，本地监听协议为 IPv4 时为 127.0.0.1）
   ;; WHEN: ..
   ;; MSG SIZE  rcvd: ..

4.如非以上结果，请移步 macOS 版 FAQ 文档中 运行结果分析 一节
