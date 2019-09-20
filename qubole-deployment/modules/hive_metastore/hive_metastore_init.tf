data "external" "whatismyip" {
  program = ["${path.module}/scripts/shell/whatsmyip.sh"]
}

resource "aws_security_group_rule" "sg_rule_for_terraform_access_to_bastion" {
  from_port = 22
  protocol = "tcp"
  security_group_id = var.qubole_bastion_security_group
  to_port = 22
  type = "ingress"
  cidr_blocks = ["${data.external.whatismyip.result["internet_ip"]}/32"]
}

data "template_file" "hive_metastore_init_template" {
  template = file("${path.module}/scripts/shell/init_hive_metastore.sh")
  vars = {
    hive_user_name = var.hive_user_name
    hive_user_pass = var.hive_user_password
    hive_db_name = var.hive_db_name
    hive_db_host = aws_db_instance.hive_metastore_db_instance.address
  }
}

resource "null_resource" "hive_metastore_init_provisioner" {

  depends_on = [
    aws_db_instance.hive_metastore_db_instance,
    aws_vpc_peering_connection.qubole_vpc_hive_vpc_peering,
    aws_security_group_rule.sg_rule_for_terraform_access_to_bastion
  ]

  connection {
    type = "ssh"
    host = var.qubole_bastion_public_ip
    user = var.qubole_bastion_user
    port = 22
    agent = true
  }

  provisioner "file" {
    content = data.template_file.hive_metastore_init_template.rendered
    destination = "/tmp/initialize_hive_metastore.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/initialize_hive_metastore.sh",
      "sh /tmp/initialize_hive_metastore.sh > /tmp/init_hive_ms_log.log"
    ]
  }

}
