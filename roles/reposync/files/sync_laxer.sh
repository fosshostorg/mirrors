#!/bin/sh

LAXER_ROOT=/srv/laxer

git -C "$LAXER_ROOT" fetch
git -C "$LAXER_ROOT" reset --hard origin/master

