#!/bin/bash

# パスワードを入力させる
echo "パスワードを入力してください: "
read -s password

# 入力されたパスワードを表示（テスト用、実際には表示しない方が良い）
echo "入力されたパスワード: $password"


dnf install tigervnc-server -y
pkill vnc
vncserver :1