aws_region  = "us-east-1"
project     = "roboshop"
environment = "dev"

vpc_cidr                   = "10.10.0.0/16"
azs                        = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs        = ["10.10.1.0/24", "10.10.2.0/24"]
private_nginx_subnet_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]
private_app_subnet_cidrs   = ["10.10.21.0/24", "10.10.22.0/24"]
private_db_subnet_cidrs    = ["10.10.31.0/24", "10.10.32.0/24"]

my_ip_cidr = ["110.235.236.116/32"]

# Controller/Bastion AMI + sizing
bastion_ami_id        = "ami-0f3caa1cf4417e51b"
bastion_instance_type = "t2.micro"

# # Where to launch the controller
# bastion_subnet_id = "aws_subnet.public[0].id"

# # SG for controller (bastion/controller SG)
# bastion_sg_id = "aws_security_group.bastion.id"
