#!/usr/bin/env bash
set -e

SC_VER="0.2-beta"

msg_info() {
  echo -e "\e[0;34m[i]\e[0m $1"
}

show_info() {
  echo -e "\n~~~~~~                               ~~~~~~"
  echo "~~~~                                   ~~~~"
  echo "~~    Image Data URI Generator Script    ~~"
  echo -e "~~~     \e[0;91mOzan Sazak\e[0m (aka \e[0;96m@bassman\e[0m)       ~~~"
  echo "~~~~                                   ~~~~"
  echo -e "~~~~~~                               ~~~~~~\n"
  msg_info "Version: \e[41m$SC_VER\e[0m"
  msg_info "Lang   : Bash Script\n"
}

show_usage() {
  echo -e "\e[4;37mUsage\e[0m: ./`basename $0` <file> [outfile]"
  echo -e "\n\e[4;37mArguments:\e[0m"
  echo -e "  file:    Image file which data URI will be generated"
  echo -e "  outfile: Output file which URI will be written to\n"
}

show_info

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  show_usage
  exit
fi

if [[ "$#" -eq 2 ]]; then
  echo "data:`file -bN --mime-type $1`;base64,`base64 -w0 < $1`" > "$2"
else
  echo -e "data:`file -bN --mime-type $1`;base64,`base64 -w0 < $1`\n"
fi

msg_info "Done. Bye!\n"
