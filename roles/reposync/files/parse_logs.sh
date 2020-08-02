#!/bin/sh

zcat -f /var/log/nginx/access.* |\
goaccess \
  --agent-list \
  --no-query-string \
  --output=/srv/mirror/.stats/index.html \
  --log-format=COMBINED -

