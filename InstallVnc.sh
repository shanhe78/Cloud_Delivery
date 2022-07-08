echo -e "\033[35m 安装VNC&远程桌面组件 by HUAWEI-CDN \033[0m"
echo -e "\033[35m 步骤1.安装x11 \033[0m"

yum install xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps -y

echo -e "\033[35m 步骤2.安装java组件 \033[0m"

yum install java-1.8.0-openjdk* -y

echo -e "\033[35m 步骤3.安装java图形依赖组件 \033[0m"

yum install lixXtst.x86_64 libXt.x86_64 libXp.x86_64 -y

echo -e "\033[35m 步骤4.安装GNOME桌面 \033[0m"

yum -y groupinstall "X Window System"
yum -y groupinstall "GNOME Desktop"

echo -e "\033[35m 步骤5.安装VNC \033[0m"

yum -y install tigervnc-server

echo -e "\033[35m 步骤6.配置VNC并验证是否开启成功，观察是否有监听5902端口 \033[0m"

echo -e "\033[37m 请输出远程登陆密码，并再次输入 \033[0m"
vncpasswd

echo "VNCSERVER="2:root"" >> /etc/sysconfig/vncservers
echo "VNCSERVERARGS[2]="-GEOMETRY 1024x768"" >> /etc/sysconfig/vncservers

vncserver :2

netstat -nap | grep vnc

echo -e "\033[35m 步骤7.安装XRDP \033[0m"
yum -y install epel-release
yum -y install xrdp
sed -i 's/port=-1/port=5902/g' /etc/xrdp/xrdp.ini
systemctl start xrdp
systemctl enable xrdp

echo -e "\033[35m 安装完成 \033[0m"

