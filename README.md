# Jenkins installation using Chef
This repository contains Chef cookbooks to install Jenkins and Java 8 on system with bare OS.
It contains a script which will bootstrap by installing Chef Development Kit and then will proceed to install
Jenkins required dependencies followed by actual Jenkins installation.
Currently cookbooks support plain vanilla installation of Jenkins server and support for Jenkins plugins will be 
added subsequently.

## Development Environment
Cookbooks are tested on CentOS 7 version by using Vagrant Virtualbox provisioner but should work on any system
with CentOS 7 installed. For ease of development and testing Vagrantfile is provided which will download and
create CentOS 7 VM in virtualbox.

### Pre-requisite ######

1. Make sure you have installed Vagrant version 1.9.0 from <a href="https://releases.hashicorp.com/vagrant/1.9.0/">here</a>.
2. Also install latest Virtualbox and it's extension pack from <a href="https://www.virtualbox.org/wiki/Downloads">here</a>.
Or
System with Platform: CentOS-7.2

## Getting Started

-	For Vagrant Installation
These instructions will get you a copy of CentOS 7 VM with Jenkins running in virtualbox.


##Usage

### Using Vagrant ######
To test the scripts on development environment with Vagrant execute following steps:


* If you are do using Vagrant box then execute following steps:

1.	Make sure you have installed Vagrant and Virtualbox on your system as mentioned in pre-requisite section.

2.  From terminal or command prompt execute command below from any location

		vagrant box add bento/centos-7.2 --provider=virtualbox

3.	Checkout this git repository

4.	Navigate to the folder where you have checked out repository and then run command below to
	initialize Vagrant Box using virtualbox provider.

	vagrant up

5.	Once vagrant finishes creating the box instance, Login to it using 	
   
   	vagrant ssh

6.	Change directory to vagrant as follows :
		cd /vagrant

7.	Now run the script chefInstall.sh to start the installation
 	sudo ./chefInstall.sh 	(non-root User)
		./chefInstall.sh 		(root User)

### For Non-Vagrant Installation ######

If you are not using vagrant box then 

1. Clone the git repository
	
	git clone https://github.com/CognologixDevops/Devops.git
	cd Devops

5. And run the installation script such as
		
		sudo ./chefInstall.sh 	(non-root User)
		./chefInstall.sh 		(root User)

In either case installation will take place in following order:

		4.1.It starts installation of chef development kit 1.5.0 after successful installtion of ChefDK 

		4.2.It starts installtion of openjdk version "1.8.0_131" i.e. Java 8 and atlast

		4.3.It start installation of Jenkins 2.4.1

Upon successful execution of the above steps, jenkins web will be available on the host OS at http://localhost:8080.
First time Jenkins will require  generated admin password which can be found at "/var/lib/jenkins/secrets/initialAdminPassword"
on the CentOS guest. You can get the admin password by running 

sudo cat /var/lib/jenkins/secrets/initialAdminPassword