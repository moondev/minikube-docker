FROM centos/systemd

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

ENV CHANGE_MINIKUBE_NONE_USER true

CMD ["minikube", "start", "--vm-driver=none", "--use-vendored-driver"]