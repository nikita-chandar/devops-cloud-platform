resource "aws_eip" "devops_eip" {

  instance = aws_instance.devops_server.id

  tags = {
    Name = "devops-elstic-ip"
  }

}
