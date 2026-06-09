# CPS 客户端 VERSION

## 下载

请在本页面底部 `Assets` 下载：

- `CPSClient-Setup-VERSION.exe`
- `SHA256SUMS.txt`

## 本次变更

- 

## 测试重点

- 启动与登录
- 打印机识别/绑定
- 接收打印任务
- 打印队列完成状态
- 异常提示与诊断导出
- 覆盖安装/卸载后重装

## 兼容性

- Windows 7 SP1 及以上
- .NET Framework 4.7.2
- Release x86 安装包

## 已知问题

- 暂无

## 校验方式

Windows PowerShell：

```powershell
Get-FileHash .\CPSClient-Setup-VERSION.exe -Algorithm SHA256
```

将输出值与 `SHA256SUMS.txt` 中的值对比，一致后再安装。
