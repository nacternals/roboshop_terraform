resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.project}-${var.environment}-vpc"
    Project     = var.project
    Environment = var.environment
  }
}


resource "aws_subnet" "public" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project}-${var.environment}-public-subnet-${var.azs[count.index]}"
    Project     = var.project
    Environment = var.environment
  }
}


resource "aws_subnet" "private_nginx" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_nginx_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name        = "${var.project}-${var.environment}-private-nginx-${var.azs[count.index]}"
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_subnet" "private_app" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_app_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name        = "${var.project}-${var.environment}-private-app-${var.azs[count.index]}"
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_subnet" "private_db" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_db_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name        = "${var.project}-${var.environment}-private-db-${var.azs[count.index]}"
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name    = "${var.project}-${var.environment}-igw"
    Project = var.project
    Environment     = var.environment
  }
}







