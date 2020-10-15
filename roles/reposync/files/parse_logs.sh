#!/bin/sh

LOCKFILE=/tmp/goaccess.lock

parselogs() {
    zcat -f /var/log/nginx/access.* |\
    goaccess \
      --agent-list \
      --no-query-string \
      --output=/srv/mirror/.stats/index.html \
      --log-format=COMBINED -
}

if [ ! -e "$LOCKFILE" ]
then
    printf %s "$$" >"$LOCKFILE"
    parselogs
else
    PID=$(cat "$LOCKFILE")
    if kill -0 "$PID" >&/dev/null
    then
        printf "goaccess still running\n"
        exit 0
    else
        printf %s "$$" >"$LOCKFILE"
        printf "warning: previous goaccess appears to not have finished correctly\n"
        parselogs
    fi
fi

rm -f "$LOCKFILE"

