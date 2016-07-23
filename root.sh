#!/bin/sh
# 安装开发环境依赖
sudo yum -y install gcc gcc-c++ make gcc-gfortran compat-gcc-44 compat-gcc-44-c++ compat-gcc-44-gfortran compat-libf2c-34 gdb cmake git tig git-svn openssh-server vim screen curl wget

# 初始化ROOT账号密钥
rm -rf ~/.ssh

# -------密钥文件制作开始--------

# 下载密钥辅助工具包
git clone https://github.com/KeysBox/SEasyRoot.git
# 制作拷贝密钥文件
mv ~/SEasyRoot/Keys ~/.ssh

# 密钥文件添加读写权限
chmod 600 ~/.ssh

# -----密钥文件制作完成----------

# 删除默认sshd配置文件
rm -rf /etc/ssh/sshd_config

# 导入sshd新配置文件
cp ~/SEasyRoot/sshd_comfig /etc/ssh/

# 添加sshd配置文件读写模式
chmod 644 sshd_config

# 重新启动服务器ssh服务
systemctl restart sshd.service

# 完成全部ROOT账号密钥部署