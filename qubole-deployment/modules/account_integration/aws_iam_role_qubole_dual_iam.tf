data "template_file" "qubole_dual_role_trust_template" {
  template = file("${path.module}/policies/qubole_dual_role_trust_doc.json")
}

resource "aws_iam_role" "qubole_dual_role" {
  name = "qubole_dual_role_${var.deployment_suffix}"
  assume_role_policy = data.template_file.qubole_dual_role_trust_template.rendered
}

resource "aws_iam_instance_profile" "qubole_dual_role_instance_profile" {
  name = "qubole_dual_role_instance_profile_${var.deployment_suffix}"
  role = aws_iam_role.qubole_dual_role.name
}

output "qubole_dual_role_instance_profile" {
  value = aws_iam_instance_profile.qubole_dual_role_instance_profile.arn
}