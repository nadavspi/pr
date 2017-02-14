#!/bin/bash

function fn_count {
  echo "There are $(wc -l queue.txt | awk '{ printf $1 }') in line"
}

function fn_open {
  head -n 1 queue.txt | xargs open
}

function fn_add {
  for link in "${@:2}"; do
    echo "$link" >> queue.txt
  done
  echo -n "Added. "
  fn_count
}

function fn_done {
  echo "$(tail -n +2 queue.txt)" > queue.txt
  echo -n "Removed. "
  fn_count
}

if [ -z "$1" ]
then
  fn_open
  exit 1
fi

fn_$1 "${@:2}"
