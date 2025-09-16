USER=$(whoami)
HOSTNAME=$(hostname)
OS=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
UPTIME=$(uptime -p | sed 's/up //')
PKGS=$(pacman -Qq | wc -l)
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')

echo "$USER@$HOSTNAME"
echo "os      $OS"
echo "host    $(cat /sys/devices/virtual/dmi/id/product_name)"
echo "kernel  $KERNEL"
echo "uptime  $UPTIME"
echo "pkgs    $PKGS"
echo "memory  ${MEM_USED}M / ${MEM_TOTAL}M"