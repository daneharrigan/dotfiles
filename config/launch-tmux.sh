#!/bin/sh

tmux list-sessions 2>&1 > /dev/null
if [ $? -eq 0 ]; then
  tmux attach
else
  tmux
fi
