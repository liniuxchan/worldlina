# xRDPとバックエンドをインストール

dnf install epel-release -y
dnf install tigervnc-server -y
dnf install xrdp -y
sudo dnf groupinstall "Xfce" "Xfce Desktop" -y
# xRDPとバックエンドを直接、クリーン

pkill vnc
pkill xrdp
pkill dbus
pkill xfce
tracker3 reset --filesystem
tracker3 reset --hard
gsettings set org.freedesktop.Tracker3.Miner.Files index-recursive-directories "[]"
gsettings set org.freedesktop.Tracker3.Miner.Files ignored-directories "['/root']"

# xRDPとバックエンドを直接、起動

vncserver :1
export $(dbus-launch)
startxfce4 :1&
xrdp-sesman
sed -i '/port=-1/a exec=nothing' /etc/xrdp/xrdp.ini
sed -i 's/port=-1/port=5901/' /etc/xrdp/xrdp.ini
xrdp





