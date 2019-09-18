resource "aws_iam_role_policy_attachment" "qubole-dual-s3-attach" {
  role = aws_iam_role.qubole_dual_role.name
  policy_arn = aws_iam_policy.qubole_dual_s3_policy.arn
}