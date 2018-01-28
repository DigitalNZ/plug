#!/usr/bin/env bash
set -e

grep -rl "ActiveRecord::Migration$" db | xargs sed -i 's/ActiveRecord::Migration/ActiveRecord::Migration[4.2]/g' && \
RAILS_ENV=test bin/rails db:migrate && \
bundle exec rspec