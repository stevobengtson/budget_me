#!/bin/bash

echo 'checking Gemfile for changes'
bundle check || bundle install

echo 'cleaning up server pids if they are present'
if [[ -e "tmp/pids/server.pid" ]]; then
  SERVER_PID=`cat tmp/pids/server.pid | rev | cut -c 1- | rev`
  if ps $SERVER_PID | grep $SERVER_PID; then
    # force stop rails server
    echo "Force killing existing rails server of pid $SERVER_PID"
    kill -9 $SERVER_PID
  fi
  rm -f tmp/pids/server.pid
fi

echo 'startup rails server'
# bundle exec rails s -p 3000 -b '0.0.0.0'
forman start
