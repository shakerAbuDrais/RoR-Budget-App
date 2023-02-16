# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :heroku do
  desc "Run database migrations on Heroku"
  task migrate: :environment do
    system "heroku run rake db:migrate"
  end
end
