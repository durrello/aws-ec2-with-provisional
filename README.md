# aws-ec2-with-provisional

Terraform examples demonstrating **provisioners** on AWS EC2 — `user_data`, `local-exec`,
`remote-exec`, and `file` — for bootstrapping and running commands on an instance after it's
created. A learning sandbox for understanding when (and when not) to reach for provisioners.

## Contents

- `main.tf` — a single EC2 instance using `user_data` to write a file at boot, plus a `local-exec`
  provisioner that echoes the instance's public IP.
- `main1.tf` — a richer example using `remote-exec` (SSH in and run commands), `file` (copy a file
  to the instance), an IAM group, and a key pair.

## What this demonstrates

- The difference between `user_data` (cloud-init at boot) and Terraform provisioners
- `local-exec` vs `remote-exec` vs `file` provisioners
- SSH `connection` blocks for `remote-exec`

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- AWS credentials configured
- For the `remote-exec`/`file` examples: a valid key pair and `.pem` file (never commit the `.pem`)

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Notes

- This is a hands-on learning repo. Before reuse, replace the placeholder `ami` value, supply a real
  key pair, and confirm the security group allows SSH from your IP.
- Provisioners are a last resort in Terraform — prefer `user_data`, cloud-init, or configuration
  management (Ansible) for repeatable bootstrapping.
- Private keys (`*.pem`) are gitignored and must never be committed.

## License

MIT
