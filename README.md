# SimpleTimeService⏳

> [!TIP]                                                    
> This project provides a lightweight microservice that returns the current timestamp and the visitor's IP address in JSON format. It is designed to be built and run easily using Docker.
                                                                                                                                                                                   
> [!NOTE]
>In this tutorial, you will deploy the **SimpleTimeService** on Docker and AWS infrastructure using Terraform for seamless automation.                   
> We break it down between Task 1 and Task 2.

> [!IMPORTANT]                         
> **Task 1**
> ## 📦 **Prerequisites**         
In this tutorial, you will run the app through Docker, you will need the following:
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

> [!IMPORTANT]                         
> **Task 2**                                 

> 📌 Overview                                             
This Terraform project provisions:                                
✅ A VPC with 2 public and 2 private subnets                                 
✅ An Application Load Balancer (ALB) in public subnets                                        
✅ An ECS Fargate Cluster with a service running in private subnets                                               
✅ A NAT Gateway to allow ECS tasks to pull images from Docker Hub                                                         
✅ IAM Roles & Policies to manage ECS permissions                                                
✅ CloudWatch Logs for monitoring ECS containers                                                                  


**Project Structure**                                                                          
terraform-ecs-project/                                                    
  │── **terraform.tfvars**        # Define input variables (e.g., AWS region, VPC CIDR)                                     
  │── **variables.tf**            # Declare variables used in Terraform                                                 
  │── **providers.tf**            # Define AWS provider & region                                                         
  │── **vpc.tf**                  # Define VPC, subnets, NAT gateway, and route tables                                                     
  │── **security.tf**             # Define security groups for ALB & ECS                                                        
  │── **alb.tf**                  # Define Application Load Balancer (ALB) & target group                                                     
  │── **ecs.tf**                  # Define ECS cluster, task definition, and service                                     
  │── **iam.tf**                  # Define IAM roles & policies for ECS                                                       
  │── **logs.tf**                 # Define CloudWatch log group for ECS logging                                                           
  │── **outputs.tf**              # Define output variables (e.g., ALB URL)                                                      
  │── **versions.tf**             # Lock Terraform & provider versions                                                          
  │── **backend.tf (optional)**   # Define remote backend (terraform cloud)                                                
│── **README.md**                 # Documentation on how to deploy the infrastructure                           
                                                                   
                                                                                               
> ## 📦 **Prerequisites**  
In this tutorial, you will run the app through Amazon ECS, you will need the following:
1. An AWS Account with required permissions (https://aws.amazon.com/resources/create-account)
2. Terraform (v1.4+ recommended) (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
3. AWS CLI

**🌍 Configure AWS Credentials**                                                                          
      Make sure your AWS credentials are set up:                                        
##
    aws configure
or set environment variables:                                    
##
    export AWS_ACCESS_KEY_ID="your-access-key"
    export AWS_SECRET_ACCESS_KEY="your-secret-key"
    export AWS_REGION="us-east-1"                                          

**🚀 Deployment Guide**                                                         
Step 1️⃣: Clone the Repository
##
    git clone https://github.com/MoinuddinOps/simpletimeservice.git
    cd simpletimeservice/terraform/                                                            
                                                                                            
Step 2️⃣: Initialize Terraform
##
    terraform init

Step 3️⃣: Preview Infrastructure Changes
##
    terraform plan

Step 4️⃣: Deploy the Infrastructure
##
    terraform apply -auto-approve

Step 5️⃣: Get the ALB URL
##
    terraform output alb_dns_name
    📌 Open in browser: http://<alb-dns-name>:5000                                       

🚀 Destroying the Infrastructure                                                   
    To remove all resources created by Terraform:
##
    terraform destroy -auto-approve                        

> [!IMPORTANT]                         
> **Task 2 (sub-task)**  
🚀 **Terraform Setup for ALB + Lambda Container in a Private VPC**                               
This Terraform project provisions an AWS VPC with public and private subnets, an ALB (Application Load Balancer), and a Lambda function running inside a container. The ALB listens on port 5000 and forwards traffic to the Lambda function.

📌 Project Overview
✅ VPC: 2 public & 2 private subnets                     
✅ NAT Gateway: Allows private subnets to access the internet (for ECR image pull)                                         
✅ Security Groups: Configured to allow traffic on port 5000                                
✅ ALB (Application Load Balancer): Listens on port 5000 and forwards requests to Lambda                                 
✅ Lambda Function: Runs a containerized application from ECR                             
✅ ECR (Elastic Container Registry): Stores the Docker image                                                                                     


> [!IMPORTANT]                         
> ## 📦 **Prerequisites**                                           
Ensure you have the following installed:                                
1. Terraform (>= 1.0)                                  
2. AWS CLI (configured with aws configure)                                  
3. A pre-built Docker image pushed to AWS ECR

⚙️ How to Deploy

1️⃣ Clone the Repository
##
    git clone https://github.com/MoinuddinOps/simpletimeservice.git
    cd terraform-serverless         

2️⃣ Initialize Terraform   
##
    terraform init                     
    
3️⃣ Review the Plan
##
    terraform plan

4️⃣ Apply the Configuration
##
    terraform apply -auto-approve


🔍 How to Access the Lambda Function
##
    terraform output       

    
You should see an output like:
##
    alb_dns_name = "lambda-alb-123456789.us-east-1.elb.amazonaws.com"


Test the Lambda Function
Now, access the Lambda function via ALB
##
    curl http://lambda-alb-123456789.us-east-1.elb.amazonaws.com:5000
    





                              





    











