#!/bin/bash

readme_file="README.md"
username="comaff15"
email="zavarykingleb@gmail.com"
telegram="@comaff15"

if ! command -v figlet &>/dev/null; then
  echo "Требуется figlet"
  exit 1
fi

phrases=(
  "Automate everything"
  "Use CI/CD, not hope"
  "Backups before deploys"
  "Set -e saves lives"
  "Logs never lie"
  "SSH is not a deployment strategy"
  "YAML hates you too"
)

random_index=$((RANDOM % ${#phrases[@]}))
selected_phrase="${phrases[$random_index]}"
ascii_phrase=$(figlet -f slant "$selected_phrase")

cat <<EOF > $readme_file
!/bin/bash

cat /home/comaff15/MOTTO.TXT
$ascii_phrase
ASCII

cat /home/comaff15/INFO.TXT
=============================================
                    ABOUT
=============================================
- 3rd year student at UlSU
- actively involved in devops and system administration

=============================================
                    SKILLS
=============================================
- Linux (Debian\Ubuntu, NixOS, Fedora)
- Kubernetes (k3s, helm, kubectl)
- Git, GitHub Actions
- Bash, Python
- Nginx
- PostgreSQL

=============================================
Updated on: $(date -u +"%Y-%m-%d %H:%M UTC")

echo "$email"
echo "Telegram: $telegram"
EOF
