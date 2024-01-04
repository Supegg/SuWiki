# Windows 10 本地局域网时间同步

在无法连接公网的情况下，以本地服务器时间为基准时间，利用NTP (Network time Protocol)服务进行时间同步。

## 服务器开启NTP服务

* 输入`regedit`，打开注册表编辑器，找到 `计算机\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time`
  * `TimeProviders\NtpServer\Enabled` 置 1
  * `Config\AnnounceFlags` 置 5
* 输入`services.msc`，打开服务 `Windows Time` 设为自动
* 手动开关服务
  * `net start w32time`
  * `net stop w32time`
* 本机测试 `w32tm /stripchart /computer:127.0.0.1`

## 客户端配置

* 打开时间设置，启用“自动设置时间”
* 添加不同时区的时钟
  * Internet 时间，更改设置，指向时间服务器
* Windows 默认的时间同步频率32768s，通过注册表改之
  * `计算机\HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\W32Time\TimeProviders\NtpClient\SpecialPollInterval`，单位秒
  
## 注意事项

* NTP对时默认在`123`端口使用UDP协议，注意防火墙
* 如果时间相差太大，先进行手动调整，再自动对时
