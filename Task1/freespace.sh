#!/bin/bash

# Variables
timeout_hours=48
recursive=0

# Parse options
while getopts "rt:" opt; do
  case $opt in
    r) recursive=1 ;;  # recursive mode
    t) timeout_hours="$OPTARG" ;; # set timeout
    *) echo "Usage: freespace [-r] [-t ###] file [file...]"; exit 1 ;;
  esac
done
shift $((OPTIND -1))
# convert timeout to seconds
timeout_minutes=$((timeout_hours * 60))

# Check if file compressed
is_compressed() {
  local filetype
  filetype=$(file --brief --mime-type "$1")
  [[ "$filetype" =~ application/(gzip|x-bzip2|zip|x-compress|x-tar) ]]
}

# Process file
process_file() {
  local file="$1"
  # if file is a directory
  if [ -d "$file" ]; then
    for entry in "$file"/*; do
      [ -f "$entry" ] && process_file "$entry"  # process each file in it
      [ -d "$entry" ] && [ $recursive -eq 1 ] && process_file "$entry"  # recursive mode
    done
  elif [[ "$(basename $file)" =~ ^fc-.* ]]; then
    # if file called "fc-..." and is older than 48 hours
    if [ $(find "$file" -mmin +$timeout_minutes) ]; then
      rm "$file"
    fi
  elif is_compressed "$file"; then
    # if file compressed 
    mv "$file" "$(dirname "$file")/fc-$(basename "$file")"
    touch "$(dirname "$file")/fc-$(basename "$file")"
  else
    # if file is not compressed
    zip "$(dirname "$file")/fc-$(basename "$file").zip" "$file" && rm "$file"
  fi
}

# Process each file
for target in "$@"; do
  process_file "$target"
done
