resource "aws_iam_role_policy_attachment" "qubole-cross-account-ec2-attach" {
  role = aws_iam_role.qubole_cross_account_role.name
  policy_arn = aws_iam_policy.qubole_ca_ec2_policy.arn
}