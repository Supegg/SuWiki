# Window中TCP连接端口耗尽问题

通信端口是一个双字节的整型，其中0~0x03ff分配给系统或其他基础服务。

短时间创建过多连接时，会耗尽端口，无法创建新连接。通常，使用长连接减少端口使用，或修改注册表`TcpTimedWaitDelay`加快端口释放。


```bat
netsh interface ipv4 show tcpstats # 查看tcp连接状态统计

netsh int ipv4 show dynamicport tcp # 查看动态端口范围

# 分配动态端口，Windows 10 默认从1024到65535
netsh int ipv4 set dynamicport tcp start=1024 num=64511

# HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Services/Tcpip/Parameters
# TcpTimedWaitDelay, default 30 in Windows 10
```