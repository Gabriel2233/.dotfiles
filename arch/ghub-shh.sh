#!/bin/sh

echo "Your email: "
read email

echo $email

ssh-keygen -t ed25519 -C $email

echo "Start ssh-agent"
eval "$(ssh-agent -s)"

ssh-add -K ~/.ssh/id_ed25519

xclip -sel clip ~/.ssh/id_ed25519.pub

echo "Public key is copied, add it to your gh account"

echo -e "Run ssh -T git@github.com\nMatch the keys with diff:
SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8 (RSA)
SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM (ECDSA)
SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU (Ed25519)

diff <(echo <KEY>) <(echo <PROMPT-KEY>) -s
"
