resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Infrastructure VPC"
  }
}

resource "aws_subnet" "external" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "External Subnet"
  }
}

resource "aws_subnet" "internal_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Internal Subnet"
  }
}

resource "aws_internet_gateway" "aig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Infrastructure Internet Gateway"
  }
}

resource "aws_route_table" "external_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.aig.id
  }

  tags = {
    Name = "External Route Table"
  }
}

resource "aws_route_table_association" "external_rt_1" {
  subnet_id      = aws_subnet.external.id
  route_table_id = aws_route_table.external_rt.id
}

#Security Group Resource to open port 80 and 22
resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key-name
  public_key = var.public_key
}

resource "aws_instance" "web_instance" {
  ami           = var.ami
  instance_type = "t2.nano"
  key_name      = var.key-name

  subnet_id                   = aws_subnet.external.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  user_data = "${file("ec2-user-data.sh")}"
  tags = {
    "Name" : "web_instance"
  }
}