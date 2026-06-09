# CPS 客户端下载

这是 CPS 客户端公开安装包发版仓库，仅用于发布 Windows 客户端安装包和版本说明，不包含服务端或客户端源代码。

## 最新版本下载


## 当前测试包直链

- 首个测试包：<https://github.com/errtry/cps-client-releases/raw/main/downloads/v0.1.0-test.1/CPSClient-Setup-v0.1.0-test.1.exe>
- 校验文件：<https://github.com/errtry/cps-client-releases/raw/main/downloads/v0.1.0-test.1/SHA256SUMS.txt>

- 最新版入口：<https://github.com/errtry/cps-client-releases/releases/latest>
- 历史版本：<https://github.com/errtry/cps-client-releases/releases>

> 测试人员优先下载 `Latest` 标记的版本。若新版出现异常，可从历史版本页面回退到上一个稳定版本。

## 支持环境

- 操作系统：Windows 7 SP1 及以上
- 运行时：.NET Framework 4.7.2
- 架构：优先使用 x86 安装包，兼容老机器和 32 位打印驱动
- 权限：安装时可能需要管理员权限

## 下载与安装

1. 打开最新版入口。
2. 在 `Assets` 区域下载 `CPSClient-Setup-版本号.exe`。
3. 下载同版本的 `SHA256SUMS.txt`，需要校验时对比安装包哈希。
4. 关闭正在运行的 CPS 客户端。
5. 双击安装包，按提示完成安装。
6. 启动 CPS 客户端并完成登录/打印测试。

## 测试反馈格式

反馈问题时请尽量带上以下信息：

- 客户端版本：例如 `v1.2.3-test.1`
- Windows 版本：例如 `Windows 7 SP1` / `Windows 10`
- 打印机型号：例如 `HP LaserJet ...`
- 操作步骤：从打开客户端到出现问题的完整步骤
- 异常截图：错误弹窗、任务状态、打印队列截图
- 日志/诊断包：如客户端支持导出诊断，请一并发送

## 常见问题

### Windows 7 无法启动

请确认系统已安装 `.NET Framework 4.7.2`。如未安装，先安装运行时后再启动客户端。

### 安装包被杀毒软件拦截

公开测试包可能未做代码签名或签名尚未完成。请先确认安装包来自本仓库 Release 页面，并核对 SHA256 后再继续。

### 覆盖安装失败

请先退出正在运行的 CPS 客户端，再重新运行安装包。如仍失败，重启电脑后再安装。

### 需要回退版本

进入历史版本页面，下载上一个可用版本的安装包重新安装。

## 安全说明

- 本仓库只发布客户端安装包，不包含源码、生产密钥、证书或内部配置。
- 不要从微信群二次转发文件中安装来源不明的包；请优先使用本仓库 Release 下载。
- 如发现安装包哈希与 `SHA256SUMS.txt` 不一致，请不要安装，并立即反馈。
