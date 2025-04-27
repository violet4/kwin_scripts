if [ -z "$1" ]; then
  echo must specify path to directory containing script
  exit 1
fi
kpackagetool6 --type=KWin/Script -i "$1"

