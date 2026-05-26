#!/bin/bash
# Simple stub for qnxsoftwarecenter_clt used for local testing inside the repo.
# It looks for the -destination <dir> argument and creates that directory.
set -e
DEST=""
ARG_NEXT=0
for a in "$@"; do
  if [ "$ARG_NEXT" -eq 1 ]; then
    DEST="$a"
    ARG_NEXT=0
    continue
  fi
  case "$a" in
    -destination)
      ARG_NEXT=1
      ;;
  esac
done
if [ -z "$DEST" ]; then
  echo "qnxsoftwarecenter_clt stub: no -destination provided, nothing to do" >&2
  exit 0
fi
mkdir -p "$DEST"
# Create a small marker to indicate stub run
echo "QNX SDP stub installed at $(date -u) by qnxsoftwarecenter_clt stub" > "$DEST/INSTALLED_BY_QNX_SOFTWARE_CENTER_STUB"
exit 0
