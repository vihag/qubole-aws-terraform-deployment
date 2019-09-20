data "template_file" "qubole_cross_account_role_trust_template" {
  template = file("${path.module}/policies/qubole_ca_role_trust_doc.json")
  vars = {
    qubole-aws-account-id = var.qubole-aws-account-id
    qubole-external-id = var.qubole-external-id
  }
}

resource "aws_iam_role" "qubole_cross_account_role" {
  name = "qubole_cross_account_role_${var.deployment_suffix}"
  assume_role_policy = data.template_file.qubole_cross_account_role_trust_template.rendered
}

output "qubole_cross_account_role_arn" {
  value = aws_iam_role.qubole_cross_account_role.arn
}