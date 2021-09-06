FROM centos
RUN yum install openssh-server -y && yum -y install nginx
RUN echo root:Docker! | chpasswd
COPY sshd_config /etc/ssh/
COPY startup.sh /bin/
RUN chmod +x /bin/startup.sh
RUN ssh-keygen -A
EXPOSE 2222 80
CMD ["/bin/startup.sh"]
