resource "aws_iam_role_policy_attachment" "qubole-cross-account-ca-attach" {
  role = aws_iam_role.qubole_cross_account_role.name
  policy_arn = aws_iam_policy.qubole_cross_account_policy.arn
}