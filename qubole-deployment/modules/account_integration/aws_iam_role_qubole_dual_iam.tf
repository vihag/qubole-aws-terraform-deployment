data "template_file" "qubole_dual_role_trust_template" {
  template = file("${path.module}/policies/qubole_dual_role_trust_doc.json")
}

resource "aws_iam_role" "qubole_dual_role" {
  name = "qubole_dual_role"
  assume_role_policy = data.template_file.qubole_dual_role_trust_template.rendered
}

output "qubole_dual_role_arn" {
  value = aws_iam_role.qubole_dual_role.arn
}