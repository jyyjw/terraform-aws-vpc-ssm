# Terraform AWS VPC + EC2 (SSM Access Only)

This is a small AWS infrastructure project I built while practicing Terraform and studying for the AWS Solutions Architect Associate.

The goal was simple: create a secure EC2 setup without exposing SSH to the internet.

## What This Does

- Creates a custom VPC
- Sets up networking (subnet, route table, internet gateway)
- Provisions an Ubuntu EC2 instance
- Attaches an IAM role for Systems Manager
- Allows access through AWS SSM Session Manager
- Keeps port 22 closed (no SSH access)

Instead of using SSH keys, I connect to the instance through SSM.  
This removes the need to open inbound ports and reduces the attack surface.

## Why I Built It This Way

I wanted to get comfortable with:

- Writing modular Terraform files
- Designing basic AWS networking
- Using IAM roles properly
- Accessing EC2 securely without traditional SSH

This is intentionally simple infrastructure, but built with security in mind.

## How To Run

```bash
terraform init
terraform plan
terraform apply
