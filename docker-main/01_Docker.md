# Docker - Practise 1


## What is Docker?

Docker is a software platform that allows to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run.


## What is a container?

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

Container images become containers at runtime and in the case of Docker containers - images become containers when they run on Docker Engine. Available for both Linux and Windows-based applications, containerized software will always run the same, regardless of the infrastructure. Containers isolate software from its environment and ensure that it works uniformly despite differences for instance between development and staging.

Docker containers that run on Docker Engine:
* Standard: Docker created the industry standard for containers, so they could be portable anywhere
* Lightweight: Containers share the machine’s OS system kernel and therefore do not require an OS per application, driving higher server efficiencies and reducing server and licensing costs
* Secure: Applications are safer in containers and Docker provides the strongest default isolation capabilities in the industry

Virtual machines (VMs) are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each VM includes a full copy of an operating system, the application, necessary binaries and libraries - taking up tens of GBs. VMs can also be slow to boot.

Containers are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), can handle more applications and require fewer VMs and Operating systems.


### Install Docker on `Amazon Linux 2` (or Red Hat compatible system)
```bash
sudo yum upgrade -y
sudo amazon-linux-extras install docker -y
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker.service
systemctl start docker.service
```


### Install Docker on `Ubuntu Linux 20.04` (compatible Debian)
```bash
sudo apt dist-upgrade -y
sudo apt autoremove -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update -y
sudo apt install -y docker-ce
sudo usermod -a -G docker ubuntu
sudo systemctl enable docker.service
systemctl start docker.service
```


### Install Docker on `Ubuntu Linux 22.04` (compatible Debian)
```bash
sudo apt update
sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg less inxi nano vim
sudo apt upgrade -y

# Install various packages needed for a new system
sudo apt install -y \
	wget \
	jq \
	telnet \
	unzip \
	tmux \
	git \
    tree \
	ansiweather \
	neofetch

curl -fsSL https://download.docker.com/linux/ubuntu/gpg |
    gpg --dearmor --yes -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
```


### Install Docker on `MacOSX` with Brew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew cask install docker
```


### Install Docker Desktop (only Mac and Windows)
1) Windows: https://docs.docker.com/desktop/windows/install/
2) MacOSX: https://docs.docker.com/desktop/mac/install/


### First Docker commands
Docker has two informative commands to check version installed (`docker --version`) and a more detailed output with information (`docker info`):
```bash
docker --version
docker info
docker container run --rm -it hello-world
docker container run --rm -it ubuntu /bin/bash
hostname
exit
hostname
docker images
docker rmi hello-world
docker images
docker pull arm64v8/alpine
docker container run --rm -it arm64v8/alpine /bin/sh
docker rmi arm64v8/alpine
```
