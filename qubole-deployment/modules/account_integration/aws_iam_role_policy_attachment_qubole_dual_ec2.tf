resource "aws_iam_role_policy_attachment" "qubole-dual-ec2-attach" {
  role = aws_iam_role.qubole_dual_role.name
  policy_arn = aws_iam_policy.qubole_dual_ec2_policy.arn
}