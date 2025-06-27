#!/bin/bash

readme_file="README.md"
username="comaff15"
email="zavarykingleb@gmail.com"
telegram="@comaff15"

if ! command -v figlet &>/dev/null; then
  echo "Требуется figlet. Установи через: sudo apt install figlet"
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

hostname="github-actions"
uptime_info=$(uptime -p || echo "n/a")
load_avg=$(awk '{print $1, $2, $3}' /proc/loadavg)
last_commit=$(git log -1 --pretty=format:'%h %s (%cr)' 2>/dev/null || echo "n/a")

cat <<EOF > $readme_file
#!/bin/bash
# =============================================
#              DevOps / SysAdmin
# =============================================

## === MOTTO ===
cat <<'ASCII'
$ascii_phrase
ASCII

## === TECH STACK ===
echo "Linux (Debian\Ubuntu, NixOS, Fedora)"
echo "Docker, containered"
echo "Kubernetes (k3s, helm, kubectl)"
echo "Git, GitHub Actions"
echo "Bash, Python"
echo "Nginx"
echo "PostgreSQL"

Updated on: $(date -u +"%Y-%m-%d %H:%M UTC")

## === STATUS ===
echo "Uptime: $uptime_info"
echo "Load Avg: $load_avg"
echo "Last Commit: $last_commit"


## === LINKS ===
echo "$email"
echo "Telegram: $telegram"
echo "GitHub: https://github.com/$username"
EOF
