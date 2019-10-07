#!/bin/bash

if [ ! -d tmp/pids ]; then
  mkdir -p tmp/pids;
fi
touch tmp/pids/server.pid
bundle install
yarn install
