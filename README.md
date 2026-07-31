# 🚀 GitHub Actions CI/CD Project - Deploy HTML Website Using Docker on AWS EC2

## 📌 Project Overview

This project demonstrates how to build a simple CI/CD pipeline using **GitHub Actions**, **Docker**, and **AWS EC2**.

The application is a static website consisting of:

* `index.html`
* `style.css`

Whenever code is pushed to the **master** (or **main**) branch, GitHub Actions connects to the EC2 instance over SSH, updates the latest source code, builds a Docker image, and deploys the updated website.

---

# 🏗️ Architecture

```
Developer
    │
    │ git push
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    │ SSH
    ▼
AWS EC2
    │
    ├── git pull
    ├── docker build
    ├── docker stop
    ├── docker rm
    └── docker run
    │
    ▼
Website Running on Port 80
```

---

# 📁 Project Structure

```
GithubAction/

├── index.html
├── style.css
├── Dockerfile
├── README.md
└── .github
    └── workflows
        └── deploy.yml
```

---

# Prerequisites

Before starting, make sure you have:

* AWS Account
* GitHub Account
* Docker Installed (Local)
* Git Installed
* VS Code
* Amazon Linux or Ubuntu EC2 Instance
* SSH Key Pair (.pem)

---

# Step 1 - Create GitHub Repository

Create a repository named:

```
GithubAction
```

Clone it to your local machine.

---

# Step 2 - Create Website

Create the following files.

```
index.html
```

```
style.css
```

Verify the website works by opening `index.html` in your browser.

---

# Step 3 - Create Dockerfile

Create a Dockerfile.

Requirements:

* Use the official Nginx image.
* Copy the website files into the Nginx web root.
* Expose port 80.

Build the image locally.

Verify that it builds successfully.

---

# Step 4 - Test Docker Locally

Build the Docker image.

Run the container.

Map container port 80 to your local machine.

Open your browser.

Verify the website is accessible.

---

# Step 5 - Push Project to GitHub

Initialize Git.

Commit your project.

Push it to GitHub.

Verify all files are available in the repository.

---

# Step 6 - Launch AWS EC2

Launch an EC2 instance.

Recommended configuration:

* Amazon Linux 2023 or Ubuntu
* t2.micro
* 8 GB Storage

Security Group:

* SSH (22)
* HTTP (80)

---

# Step 7 - Connect to EC2

SSH into the server.

Example:

```
ssh -i your-key.pem ec2-user@<EC2_PUBLIC_IP>
```

or

```
ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>
```

depending on the operating system.

---

# Step 8 - Install Docker

Update packages.

Install Docker.

Start Docker.

Enable Docker at boot.

Verify Docker installation.

---

# Step 9 - Clone Repository on EC2 (One-Time Setup)

Move to your home directory.

Example:

```
cd /home/ec2-user
```

Clone the repository:

```
git clone https://github.com/<username>/GithubAction.git
```

Verify the project exists:

```
/home/ec2-user/GithubAction
```

> **Important:** This step is performed **only once**. Future deployments will use `git pull`.

---

# Step 10 - Test Deployment Manually

Navigate to the repository.

Run:

1. Pull the latest code.
2. Build the Docker image.
3. Stop the old container (if running).
4. Remove the old container.
5. Run a new container.

Verify the website using:

```
http://<EC2_PUBLIC_IP>
```

---

# Step 11 - Create GitHub Secrets

Open:

```
Repository
    ↓
Settings
    ↓
Secrets and Variables
    ↓
Actions
```

Create the following secrets:

```
SSH_HOST
SSH_KEY
```

If required, also create:

```
SSH_USERNAME
```

---

# Step 12 - Create GitHub Actions Workflow

Create:

```
.github/workflows/deploy.yml
```

Configure the workflow to trigger on:

```
push
```

to your deployment branch.

The workflow should:

1. Connect to EC2 using SSH.
2. Navigate to the project directory.
3. Pull the latest code.
4. Build the Docker image.
5. Stop the existing container.
6. Remove the old container.
7. Run the new container.

---

# Step 13 - Deploy Automatically

Modify your HTML page.

Commit the changes.

Push to GitHub.

Observe the Actions tab.

After the workflow completes, refresh your browser.

The latest version of the website should be live.

---

# Deployment Flow

```
Local Development
        │
        ▼
git add
        │
git commit
        │
git push
        │
        ▼
GitHub Repository
        │
        ▼
GitHub Actions
        │
        ▼
SSH Connection
        │
        ▼
EC2 Instance
        │
git pull
        │
docker build
        │
docker stop
        │
docker rm
        │
docker run
        │
        ▼
Updated Website
```

---

# Common Issues

## 1. `fatal: not a git repository`

Cause:

* You are not inside the cloned repository.

Solution:

Navigate to the repository before running `git pull`.

---

## 2. `No such file or directory`

Cause:

* Incorrect project path.

Solution:

Verify the project location using:

```
pwd
ls -la
```

---

## 3. SSH Authentication Failed

Cause:

* Incorrect private key.
* Wrong username.
* Port 22 blocked.

Solution:

Verify:

* SSH key
* Security Group
* Correct EC2 username (`ec2-user` or `ubuntu`)

---

## 4. Docker Container Already Exists

Cause:

Container with the same name is already running.

Solution:

Stop and remove the existing container before starting a new one.

---

# Final Outcome

After completing this project, you will understand:

* GitHub Actions workflows
* SSH-based deployment
* Git operations (`clone` and `pull`)
* Docker image creation
* Docker container management
* Automated deployments on AWS EC2
* End-to-end CI/CD using GitHub Actions
