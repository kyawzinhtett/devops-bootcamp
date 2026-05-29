# Trust policy that allows EC2 instances to assume this IAM role.
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_ssm" {
  name               = var.ec2_role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

# Attach the managed policy required by the instance. For this bootcamp stack,
# AmazonSSMManagedInstanceCore enables SSM Session Manager access without SSH.
resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ec2_ssm.name
  policy_arn = var.policy_name
}

# Instance profiles are the bridge between IAM roles and EC2 instances.
resource "aws_iam_instance_profile" "ec2_ssm" {
  name = var.ec2_instance_profile_name
  role = aws_iam_role.ec2_ssm.name
}
