# CPS 客户端公开发版 SOP

## 目标

用公开 GitHub Releases 替代微信群转发安装包。微信群只发送固定下载入口和本次变更摘要，安装包统一从 GitHub Release 下载。

## 仓库约定

- 仓库名：`cps-client-releases`
- 可见性：Public
- 内容边界：只放发版说明、脚本、模板；不放源码、不放密钥、不放内部配置
- 固定下载入口：`https://github.com/sixeq/cps-client-releases/releases/latest`

## 发版前检查

1. 确认客户端可公开下载。
2. 确认安装包不包含生产密钥、证书、内部 IP、调试后门。
3. 确认安装包为 `Release|x86`，优先兼容 Windows 7 / .NET Framework 4.7.2。
4. 确认版本号符合：`v主版本.次版本.修订号-test.N`、`v主版本.次版本.修订号-rc.N` 或正式 `v主版本.次版本.修订号`。
5. 在本地至少完成启动/安装包基本冒烟验证。

## 发版步骤

```bash
cd cps-client-releases
scripts/publish-release.sh v1.2.3-test.1 /path/to/CPSClient-Setup.exe sixeq/cps-client-releases
```

发布完成后打开：

```text
https://github.com/sixeq/cps-client-releases/releases/latest
```

确认 Assets 包含：

- `CPSClient-Setup-v版本.exe`
- `SHA256SUMS.txt`

## 微信群通知模板

```text
CPS 客户端新版已发布：v1.2.3-test.1
下载地址：https://github.com/sixeq/cps-client-releases/releases/latest
本次重点：xxx
测试重点：启动登录、打印任务接收、打印队列完成、异常诊断导出
如遇问题请反馈：版本号 + Windows 版本 + 打印机型号 + 截图/诊断包
```

## 回滚方式

进入历史版本页面下载上一个稳定版本：

```text
https://github.com/sixeq/cps-client-releases/releases
```

## 常见失败处理

- `gh: command not found`：安装 GitHub CLI，或改用 GitHub 网页手工创建 Release。
- `HTTP 401/403`：重新登录 `gh auth login`，确认账号有仓库写权限。
- 安装包上传错：删除错误 Release，重新创建同版本或递增测试版本。
- 测试人员下载慢：微信群保留 GitHub 链接，必要时临时加国内网盘镜像，但 GitHub Release 仍作为版本事实源。
