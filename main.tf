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
}
<<<<<<< HEAD

=======
>>>>>>> 5702cdd9a1464379c2e6fa98bc609bea67b1ccbc


