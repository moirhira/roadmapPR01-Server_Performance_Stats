#bin/sh

echo "Total CPU usage"
top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8 "%%"}'
free | awk '/Mem:/ {printf "Memory Usage: %.2f%%\n", $3/$2 * 100}'
free | awk '/Mem:/ {printf "Memory Free: %.2f%%\n", $4/$2 * 100}'
df -h / | awk 'NR==2 { printf "Total: %s\nUsed: %s (%s)\nFree: %s\n", $2, $3, $5, $4}'
echo "Top 5 processes by CPU usage"
ps -eo pid,user,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo "Top 5 processes by Memory usage"
ps -eo pid,user,comm,%cpu,%mem --sort=-%mem | head -n 6

