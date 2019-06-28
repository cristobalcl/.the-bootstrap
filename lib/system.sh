OS_INFO=/etc/os-release

OS_NAME=unknown

if [ -f $OS_INFO ]; then
  source $OS_INFO
  OS_NAME=$ID
elif [ "$(uname -s)" == "Darwin" ]; then
  OS_NAME=darwin
fi

echo "==> System detected: $OS_NAME"
