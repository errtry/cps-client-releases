# CPS 客户端 v0.1.0-test.3

## 下载

- 安装包：CPSClient-Setup-v0.1.0-test.3.exe
- 校验文件：SHA256SUMS.txt

## 本次修复

- 修复打印历史仍写入 Program Files 导致访问被拒绝的问题，改为写入 %LOCALAPPDATA%\PrinterApp\temp\history。
- 修复安装包缺少 pdfium.dll 导致 PDF 打印失败的问题。
- 修复安装包缺少音频资源、离线告警找 error.mp3 的问题。
- 保留 v0.1.0-test.2 的打印机页去 AI 化界面改造。

## 兼容性

- Windows 7 SP1 及以上
- .NET Framework 4.7.2
- Release x86 安装包
- 当前签名：NotSigned

## SHA256

```
acc56ad6f0cda377696717f5d1a96293550bcc582dfa3d591308c85d5e0614ff  CPSClient-Setup-v0.1.0-test.3.exe
```
