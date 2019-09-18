resource "aws_iam_role_policy_attachment" "qubole-cross-account-s3-attach" {
  role = aws_iam_role.qubole_cross_account_role.name
  policy_arn = aws_iam_policy.qubole_ca_s3_policy.arn
}