resource "aws_instance" "this" {
  ami           = "ami-020cba7c55df1f615"  # Replace with appropriate AMI
  instance_type = "t2.micro"
  key_name               = var.instance_keypair
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data     = var.user_data
  tags = {
    Name = var.name
  }
}

resource "aws_eip" "instance_eip" {
  depends_on = [ aws_instance.this, var.vpc_depend_on ]
  instance = aws_instance.this.id
  vpc      = true
  tags     = {
    Name = var.name
  }
}

output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_eip.instance_eip.public_ip
}

output "ec2_depends_on" {
  value = aws_instance.this
}

output "ec2_instance_tags" {
  value = aws_instance.this.tags_all
}