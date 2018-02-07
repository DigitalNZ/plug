#!/usr/bin/env bash
set -e
# Code coverage
curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter
chmod +x ./cc-test-reporter
./cc-test-reporter before-build

# Update migrations
grep -rl "ActiveRecord::Migration$" db | xargs sed -i 's/ActiveRecord::Migration/ActiveRecord::Migration[4.2]/g' && \

# Run tests
RAILS_ENV=test bin/rails db:migrate && \
bundle exec rspec && \
bundle exec rubocop

# Report to Code Climate
./cc-test-reporter after-build --exit-code $TRAVIS_TEST_RESULT