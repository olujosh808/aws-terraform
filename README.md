# create a IAM user with right access to manage resources
provide the credential to terraform as described in [Terraform docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)

in testing we used:
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"

# Remote State
S3 was created manually for tfstate file.

# sshkey pair
sshkey-gen was used to generate the sskey local and the public key was provided as public_key variable to config in variable.tf