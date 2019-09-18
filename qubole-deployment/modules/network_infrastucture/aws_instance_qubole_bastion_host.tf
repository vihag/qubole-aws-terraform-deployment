data "template_file" "qubole_bastion_ssh_bootstrap" {
  template = file("${path.module}/scripts/qubole_bastion_startup.sh")
  vars = {
    public_ssh_key = var.public_ssh_key
    qubole_public_key = var.qubole_public_key
  }
}

resource "aws_instance" "qubole_bastion_host" {
  ami = "qubole-bastion-hvm-amzn-linux"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.bastion_security_group.id]
  subnet_id = aws_subnet.qubole_vpc_public_subnetwork.id

  provisioner "file" {
    source = data.template_file.qubole_bastion_ssh_bootstrap.rendered
    destination = "/tmp/qubole_bastion_startup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/qubole_bastion_startup.sh",
      "/tmp/qubole_bastion_startup"
    ]
  }

}