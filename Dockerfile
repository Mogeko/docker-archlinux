FROM archlinux/base
MAINTAINER mogeko
EXPOSE 22
RUN pacman -Syu sudo openssh --noconfirm --needed \
 && pacman -Scc --noconfirm \
 && rm -f /etc/ssh/ssh_*_key \
 && ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key \
 && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key \
 && ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
 && ssh-keygen -A \
 && sed -i "s/#*UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
 && sed -i "s/#*UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config \
 && sed -i "s/#*PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
CMD ["/usr/bin/sshd", "-D"]

