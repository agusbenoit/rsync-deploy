# 🚀 Rsync Deploy Action

GitHub Action to deploy files to a remote server using `rsync` + `ssh`.

## 📦 Inputs

| Variable         | Description                              | Required |
|------------------|------------------------------------------|----------|
| ssh_private_key  | SSH private key                          | ✅       |
| ssh_host         | IP or FQDN of the remote server          | ✅       |
| ssh_user         | Remote SSH user                          | ✅       |
| remote_path      | Destination path on the remote server    | ✅       |
| source           | Local path to sync (default: `./`)       | ❌       |
| ssh_port         | SSH port (default: `22`)                 | ❌       |

## 🧪 Usage Example

```yaml
- name: Deploy usando rsync-deploy-action
  uses: agustinbenoit/rsync-deploy-action@v1
  with:
    ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
    ssh_host: ${{ secrets.SSH_HOST }}
    ssh_user: ${{ secrets.SSH_USER }}
    remote_path: /var/www/html/myapp
    ssh_port: '2222'

