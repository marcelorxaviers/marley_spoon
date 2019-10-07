#!/bin/bash

if [ ! -d tmp/pids ]; then
  mkdir -p tmp/pids;
fi
touch tmp/pids/server.pid
bundle install
NODE_ENV=production yarn install
RAILS_ENV=production bundle exec rake assets:precompile
NODE_ENV=production RAILS_ENV=production bin/webpack
