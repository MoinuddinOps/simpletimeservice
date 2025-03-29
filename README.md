# SimpleTimeService⏳

> [!TIP]                                                    
> This project provides a lightweight microservice that returns the current timestamp and the visitor's IP address in JSON format. It is designed to be built and run easily using Docker.
                                                                                                                                                                                   
> [!NOTE]
>In this tutorial, you will deploy the **SimpleTimeService** on Docker and AWS infrastructure using Terraform for seamless automation.

> [!IMPORTANT]
> ## **Prerequisites**          
To follow this tutorial, you will need the following:
1. Ubuntu 24.04 LTS 🐧 [Ubuntu](https://ubuntu.com/download) is the world’s favourite Linux operating system. Run it on your laptop, workstation, server or IoT device
2. Docker 🐳 [Docker](https://www.docker.com/) is an application that simplifies the process of managing application processes in containers.
3. Python 3 🐍 [Python](https://www.python.org/) is a versatile language popular for scripting, automation, data analysis, machine learning, and back-end development.

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

**Step 2 - Setting Up Python 3**                                                                             

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


## Steps to run the app locally
**Step 1 - Clone the app to your system from the [Github public repository](https://github.com/MoinuddinOps/simpletimeservice.git).**                                                    

Open your terminal                                 
##
    git clone https://github.com/MoinuddinOps/simpletimeservice.git

change the directory to cloned folder
##
    cd simpletimeservice/app/                                                           #app folder contains the application code

**Step 2 - build the docker image**
It will build the image locally.
##
     docker build -t simpletimeservice .

To check the built image, run the below command and in the repository column you will found the image named **simpletimeservice**
##
     docker images

**Step 3 - Run the built docker image in the container by running the below command**   

-d (detached mode): Runs the container in the background, so the terminal is not blocked by container logs.                                                         
-p 5000:5000 (port mapping): Maps port 5000 of the container to port 5000 on the host machine, allowing external access to the service.                                                   

##
    docker run -d -p 5000:5000 simpletimeservice

To check the status of the running container, run the below command                                                                        
##
    docker ps
You will get the output of your container with random container id and the image name that we have built above, In our case image name should be **simpletimeservice**

**Step 4 - Open your browser and run the URL: http://127.0.0.1:5000/**
##
    http://127.0.0.1:5000/                                                                                
You will get the output in JSON format with current date and time, and the IP address of the visitor.                                                                                 

> [!NOTE]
> Have a look at the attached screenshot for expected output.

![image](https://github.com/user-attachments/assets/05cc1906-46c7-46d3-a904-56f419a7270a)











