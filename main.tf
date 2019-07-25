terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "ubuntu" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"

  tags {
    Name = "${var.name}"
  }

resource "aws_elb" "matts-elb" {
    name = "matts_loadbalancer"
    connection_draining = true
    connection_draining_timeout = 400
    subnets = "${var.subnets}"

    listener {
        instance_port = 8200
        instance_protocol = "tcp"
        lb_port = 8200
        lb_protocol = "tcp"
    }

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 3
        timeout = 5
        target = "${var.health_check}"
        interval = 15
    }

}

}
