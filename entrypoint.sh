#!/bin/bash

if [[ -z "$DIFF" ]]; then
  echo "diff is empty"
else
  bin/aagent $DIFF
fi


