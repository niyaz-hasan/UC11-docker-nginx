# Create a Null Resource and Provisioners
resource "null_resource" "ssh_check" {
  depends_on = [var.ec2_depends_on]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type     = "ssh"
    host     = var.public_ip     
    user     = "ubuntu"
    password = ""
    private_key = file("private-key/self-hosting.pem")
  }  

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
#  provisioner "file" {
#    source      = "private-key/eks-terraform-key.pem"
#    destination = "/tmp/eks-terraform-key.pem"
#  }

## Remote Exec Provisioner: Using remote-exec provisioner on instance 
  provisioner "remote-exec" {
    inline = [
      "docker ps"
    ]
  }
}