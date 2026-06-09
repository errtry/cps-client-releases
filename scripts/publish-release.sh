#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
用法:
  scripts/publish-release.sh <version> <installer_path> [repo]

示例:
  scripts/publish-release.sh v1.2.3-test.1 /mnt/d/Repos/cp_client/dist/CPSClient-Setup-v1.2.3-test.1.exe sixeq/cps-client-releases

要求:
  - 已安装并登录 gh CLI，或设置 GITHUB_TOKEN 且安装 gh
  - version 建议格式: v1.2.3-test.1 / v1.2.3-rc.1 / v1.2.3
USAGE
}

if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
  usage
  exit 1
fi

VERSION="$1"
INSTALLER="$2"
REPO="${3:-sixeq/cps-client-releases}"

if [[ ! "$VERSION" =~ ^v[0-9]+\.[0-9]+\.[0-9]+(-[A-Za-z0-9.]+)?$ ]]; then
  echo "版本号格式不规范: $VERSION" >&2
  exit 2
fi

if [ ! -f "$INSTALLER" ]; then
  echo "安装包不存在: $INSTALLER" >&2
  exit 3
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "缺少 gh CLI。请先安装 GitHub CLI 并登录。" >&2
  exit 4
fi

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

INSTALLER_NAME="CPSClient-Setup-${VERSION}.exe"
cp "$INSTALLER" "$WORKDIR/$INSTALLER_NAME"
(
  cd "$WORKDIR"
  sha256sum "$INSTALLER_NAME" > SHA256SUMS.txt
)

NOTES_FILE="$WORKDIR/release-notes.md"
if [ -f ".github/release-template/cps-client-release.md" ]; then
  sed "s/VERSION/$VERSION/g" .github/release-template/cps-client-release.md > "$NOTES_FILE"
else
  cat > "$NOTES_FILE" <<NOTES
# CPS 客户端 $VERSION

请在 Assets 下载安装包和 SHA256SUMS.txt。
NOTES
fi

gh release create "$VERSION" \
  "$WORKDIR/$INSTALLER_NAME" \
  "$WORKDIR/SHA256SUMS.txt" \
  --repo "$REPO" \
  --title "CPS 客户端 $VERSION" \
  --notes-file "$NOTES_FILE" \
  --prerelease

echo "发布完成: https://github.com/$REPO/releases/tag/$VERSION"
echo "最新版入口: https://github.com/$REPO/releases/latest"
