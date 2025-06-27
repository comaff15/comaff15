#!/bin/bash

readme_file="README.md"
email="zavarykingleb@gmail.com"
telegram="@comaff15"

if ! command -v figlet &>/dev/null; then
  echo " Требуется 'figlet'"
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
updated_time=$(date -u +"%Y-%m-%d %H:%M UTC")
ip_suffix=$((RANDOM % 100 + 10))

cat <<EOF > "$readme_file"
\`\`\`bash

Last login: $updated_time from 192.168.1.57
coma@vm:~$ clear

coma@vm:~$ ./ascii.sh
$ascii_phrase


coma@vm:~$ cat /home/comaff15/info.txt
=============================================
                   ABOUT
=============================================
3rd year student at UlSU
Actively involved in DevOps and system administration

=============================================
                   SKILLS
=============================================
Linux (Debian/Ubuntu, NixOS, Fedora)
Kubernetes (k3s, helm, kubectl)
Git, GitHub Actions
Bash, Python
Nginx
PostgreSQL

=============================================
Updated on: $updated_time



coma@vm:~$ echo "Mail"
           $email
coma@vm:~$ echo "Telegram"
           $telegram
\`\`\`
EOF
