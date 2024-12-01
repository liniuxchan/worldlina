echo "Google Chromeをインストール中..."

# 必要な依存パッケージをインストール
sudo dnf install -y wget

# リポジトリを追加
sudo tee /etc/yum.repos.d/google-chrome.repo > /dev/null << '_REPO_'
[google-chrome]
name=google-chrome
baseurl=https://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
_REPO_

# Google Chromeをインストール
sudo dnf install -y google-chrome-stable

# インストール確認
echo "インストール完了！"
google-chrome --version
EOF

tee launch-chrome-root.sh > /dev/null << 'EOF'
#!/bin/bash
echo "Google Chromeを--no-sandboxモードで起動しています（非推奨）..."
google-chrome-stable --display :1 --no-sandbox&
