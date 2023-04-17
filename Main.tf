provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.region}"
    }
resource "aws_instance" "os" {
  ami = "ami-0e5e4bbcbd7349cac"
  instance_type = "t2.micro"                               
  associate_public_ip_address = "false"                   
  availability_zone= "us-west-1a"                        
  key_name = "TerraPract"
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  subnet_id= "subnet-0e1381571788855e8"
  tags = {
     Name = "ec2_name"
  }
  count = "1"
  user_data = "${file("Test")}"
  # root disk
  root_block_device {
    volume_size           = "8"
    volume_type           = "gp3"
    encrypted             = "false"
    delete_on_termination = "true"
 }
 # data disk
  ebs_block_device {
    device_name           = "/dev/sdh"
    volume_size           = "10"
    volume_type           = "gp3"
    encrypted             = "false"
    delete_on_termination = "false"
 }
}
