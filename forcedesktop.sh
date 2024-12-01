# xRDPとバックエンドをインストール

dnf install epel-release -y
dnf install tigervnc-server -y
dnf install xrdp -y
dnf install xfce4 -y

# xRDPとバックエンドを直接、クリーン

pkill vnc
pkill xrdp
pkill xfce

# xRDPとバックエンドを直接、起動

vncserver :1
startxfce4 :1&
xrdp-sesman
sed -i '/port=-1/a exec=nothing' /etc/xrdp/xrdp.ini
sed -i 's/port=-1/port=5901/' /etc/xrdp/xrdp.ini
xrdp





