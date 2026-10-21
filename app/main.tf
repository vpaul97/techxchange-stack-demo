terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.al2023.id
  instance_type = "m5.4xlarge"
}

resource "aws_ebs_volume" "demo" {
  availability_zone = "${var.region}a"
  size              = 8
  encrypted         = false
}

resource "aws_db_instance" "demo" {
  identifier                  = "techxchange-stack-demo"
  engine                      = "postgres"
  instance_class              = "db.t3.micro"
  allocated_storage           = 20
  db_name                     = "demo"
  username                    = "demoadmin"
  manage_master_user_password = true
  storage_encrypted           = false
  skip_final_snapshot         = true
}

variable "region" {
  type = string
}
