#!/bin/sh

# https://docs.docker.com/install/linux/docker-ce/fedora/
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
newgrp $USER


# Maybe minikube is not too good for slow laptop

# https://kubernetes.io/docs/tasks/tools/install-minikube/
# https://kubernetes.io/docs/tasks/tools/install-kubectl/
# https://medium.com/@nieldw/running-minikube-with-vm-driver-none-47de91eab84c?email=antti18%2Bmedium%40kaihola.fi&g-recaptcha-response
sudo sh -c "cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF"
sudo dnf install -y kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
      && chmod +x minikube
sudo cp minikube /usr/local/bin && rm minikube
sudo minikube start --vm-driver=none --apiserver-ips 127.0.0.1 --apiserver-name localhost

# https://github.com/kubernetes/minikube/blob/master/docs/vmdriver-none.md
export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECONFIG=$HOME/.kube/config

mkdir -p $HOME/.kube $HOME/.minikube
touch $KUBECONFIG

sudo -E minikube start --vm-driver=none

# https://helm.sh/docs/using_helm/#installing-helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash
helm init


# mickok8s requires snap
# https://docs.snapcraft.io/installing-snap-on-fedora/6755
# https://codefresh.io/kubernetes-tutorial/local-kubernetes-linux-minikube-vs-microk8s/
# https://microk8s.io/
# https://webcloudpower.com/use-kubernetics-locally-with-microk8s

sudo dnf install snapd
snap install microk8s --classic
snap install kubectl
snap install helm

# Errors
#$ helm ls
#Error: forwarding ports: error upgrading connection: error dialing backend: dial tcp: lookup rocket on 8.8.8.8:53: no such host
# add your hostname to /etc/hosts
# 127.0.0.1 <hostname>

#$ helm ls
#E0330 01:01:40.354954   20140 portforward.go:391] an error occurred forwarding 37311 -> 44134: error forwarding port 44134 to pod e9ea2731066684b3f0f6967b46afdd38a5ddce5b1c62376bc118dd1e6257fcb0, uid : failed to execute portforward in network namespace "/var/run/netns/cni-5a351f2a-da9b-39fc-7221-e688e368abd6": socat command returns error: exit status 127, stderr: "/snap/microk8s/492/usr/bin/socat: error while loading shared libraries: libnsl.so.1: cannot open shared object file: No such file or directory\n"
# sudo dnf install libnsl

# https://microk8s.io/docs/
# https://webcloudpower.com/use-kubernetics-locally-with-microk8s
# https://docs.bitnami.com/kubernetes/how-to/create-your-first-helm-chart/

