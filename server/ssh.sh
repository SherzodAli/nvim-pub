#/usr/bin/env bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# echo 'ssh-ed25519 AAAA...your-public-key...' >> ~/.ssh/authorized_keys

# sudo nano /etc/ssh/sshd_config (/etc/ssh/sshd_config.d/* - check if not overwritten)
# sudo sshd -t -> sudo systemctl reload sshd/ssh
PubkeyAuthentication yes
PasswordAuthentication no
KbdInteractiveAuthentication no
ChallengeResponseAuthentication no
UsePAM yes
