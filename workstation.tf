resource "aws_instance" "web" {
  ami           = data.aws_ami.rhel9.id #devops-practice
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_eksctl.id] # this means list
   user_data = file("docker.sh")
  tags = {
    Name = "HelloTerraform"
  }
}



resource "aws_security_group" "allow_eksctl" {
 name        = "allow_eksctl"
 description = "Allow for eksctl"
 vpc_id      = data.aws_vpc.default.id

ingress {
   description = "HTTPS ingress"
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}