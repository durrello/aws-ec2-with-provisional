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


---

<div align="center">

### Built by

**Durrell Gemuh** - Founder @ NextGen Playground | DevOps & Cloud Infrastructure Engineer | AWS Community Builder

[![Portfolio](https://img.shields.io/badge/Portfolio-durrellgemuh.com-000?style=flat-square&logo=vercel)](https://durrellgemuh.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-durrello-0A66C2?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/durrello/)
[![Dev.to](https://img.shields.io/badge/Dev.to-durrello-0A0A0A?style=flat-square&logo=devdotto)](https://dev.to/durrello)
[![X](https://img.shields.io/badge/X-@durrelloo-000?style=flat-square&logo=x)](https://x.com/durrelloo)
[![GitHub](https://img.shields.io/badge/GitHub-durrello-181717?style=flat-square&logo=github)](https://github.com/durrello)
[![Email](https://img.shields.io/badge/Email-durrell.gemuh.a@gmail.com-EA4335?style=flat-square&logo=gmail)](mailto:durrell.gemuh.a@gmail.com)

---

⭐ **Star this repo** if you found it useful - it helps others discover it!

</div>
