resource "aws_instance" "devops_server" {

  ami = "ami-001cd62bb054b9d79"

  instance_type = "t3.micro"

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [

    aws_security_group.devops_sg.id
  ]

  associate_public_ip_address = true


  tags = {
    Name = "devops-server"
  }
}
