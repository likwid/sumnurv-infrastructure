This requires a weird ansible setup. We want to use external IPs for ssh access since we are running in a completely different region/VPC than our normal ansible stuff.

```
EC2_INI_PATH=.inventory/external-ec2.ini ap playbooks/nomad-example/playbook.yml -u ubuntu
```
