# SimpleTimeService⏳
**Introduction**                                                                                                                                                                               
This project provides a lightweight microservice that returns the current timestamp and the visitor's IP address in JSON format. It is designed to be built and run easily using Docker.

**Note**                                                                                                                                                                                       
In this tutorial, you will deploy the **SimpleTimeService** on Docker and AWS infrastructure using Terraform for seamless automation.

**Prerequisites**          
To follow this tutorial, you will need the following:
1. Ubuntu 24.04 LTS 🐧 [Ubuntu](https://ubuntu.com/download) is the world’s favourite Linux operating system. Run it on your laptop, workstation, server or IoT device
2. Docker 🐳 [Docker](https://www.docker.com/) is an application that simplifies the process of managing application processes in containers.
3. Python 3 🐍 [Python](https://www.python.org/) is a versatile language popular for scripting, automation, data analysis, machine learning, and back-end development.
4. Pip (Python Package Manager)


**Step 1 - Installing Docker**           

First, open your terminal 💻 and update your existing list of packages by running the below command:                 
##
    sudo apt update
Next, Enable snaps on Ubuntu and install docker, To install a snapd:                                                 
##
    sudo apt install snapd                                                                                 
then, install docker by running the below command:                               
##
    sudo snap install docker

**Step 2 - Setting Up Python 3 & Install pip (Python Package Manager)**                                                                             

Ubuntu 24.04 LTS and other versions of Debian Linux ship with Python 3 pre-installed. To make sure that our versions are up-to-date, update your local package index:
##
    sudo apt update

Below command will upgrade packages and also handles dependency changes. The -y flag will confirm that we are agreeing for all items to be installed, but depending on your version of Linux, you may need to confirm additional prompts as your system updates and upgrades.
##
    sudo apt dist-upgrade -y

Once the process is complete, we can check the version of Python 3 that is installed in the system by typing:
##
    python3 -V

If the python 3 is not installed in your system, run the following command to install it.
##
    sudo apt update && sudo apt install python3 -y

Install pip
##
    sudo apt install python3-pip -y






