#!/bin/bash

Xvfb :99 &
export DISPLAY=:99

echo '/run-services.sh'

for entry in /services/*.sh
do
  echo "$entry"
  if [[ -f "$entry" ]]; then
      [[ ! -x "$entry" ]] && (chmod +x "$entry"; sync)
      "$entry"
  fi
done

echo '/run-agent.sh'
exec '/run-agent.sh'
