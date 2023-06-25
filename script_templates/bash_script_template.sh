#!/usr/bin/env bash

set -Euo pipefail
#set e #fail immediately on error
trap cleanup SIGINT SIGTERM ERR EXIT

#script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

help() {
  cat << EOF

Usage: $(basename "${BASH_SOURCE[0]}") [-h] -b -u [-v]

<Script Title/Purpose>

Available options:
------------------------------------------------
-<param_char>  --<param_string>     <param_expected_description>
-h  --help                  help menu
-v  --verbose               verbose output

EOF
  exit
}

show_debug_info() {
  msg "Script debug info :"
  msg "-------------------"
  msg "Parameters read: :"
  msg "- <param1_char>: ${<param1_var_name>}"
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
}

msg() {
  echo >&2 -e "${1-}"
}

quit() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  <param1_var_name>=''

  while :; do
    case "${1-}" in
    -h | --help) help ;;
    -v | --verbose) set -x ;;
    -<param1_char> | --<param1_string>)
      <param1_var_name>="${2-}"
      shift
      ;;
    -?*) quit "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  # check required params
  [[ -z "${<param1_var_name>}" ]] && { echo "{\"message\": \"failure\", \"response\": \"Missing required parameter: -<param1_char) (<param1_var_description>)\" }" | jq; exit 2; }

  return 0
}

# get args
args=("$@")
parse_params "${args[@]}"

#show_debug_info

# script code
# ...
