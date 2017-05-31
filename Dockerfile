#FROM centos:7
FROM centos:7


# ENV container docker
# RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
# systemd-tmpfiles-setup.service ] || rm -f $i; done); \
# rm -f /lib/systemd/system/multi-user.target.wants/*;\
# rm -f /etc/systemd/system/*.wants/*;\
# rm -f /lib/systemd/system/local-fs.target.wants/*; \
# rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
# rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
# rm -f /lib/systemd/system/basic.target.wants/*;\
# rm -f /lib/systemd/system/anaconda.target.wants/*;
#VOLUME [ "/sys/fs/cgroup" ]



#RUN apt-get update; apt-get install -y curl

RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.19.1/minikube-linux-amd64 && chmod +x minikube && mv minikube /usr/local/bin/

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

RUN yum -y install sudo

RUN chmod u+w /etc/sudoers

RUN echo "%root  ALL=(ALL)       ALL" > /etc/sudoers

RUN chmod u-w /etc/sudoers

RUN yum -y install openssh-server openssh-clients

ENV CHANGE_MINIKUBE_NONE_USER root

COPY start.sh /start.sh

#CMD ["/start.sh"]

CMD ["/usr/sbin/init"]