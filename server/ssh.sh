#/usr/bin/env bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# echo 'ssh-ed25519 AAAA...your-public-key...' >> ~/.ssh/authorized_keys
# /etc/ssh/sshd_config.d/ -> PermitRootLogin no -> sudo sshd -t -> sudo systemctl reload sshd/ssh
