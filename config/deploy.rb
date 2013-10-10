# Pretty capistrano config.
# Deployment process:
# cap deploy:setup (on first deploy)
# cap deploy
# cap db:seed (on first deploy)

require 'bundler/capistrano'
require 'sidekiq/capistrano'

# Common settings
set :application,   'blogger'
set :repository,    'git@github.com:tanraya/blogger.git'
set :scm,           :git
set :deploy_via,    :remote_cache
set :branch,        'master'
set :scm_username,  'tanraya'
set :scm_verbose,   true
set :user,          'blogger'
set :use_sudo,      false
set :keep_releases, 2
set :deploy_to,     "/home/#{user}"

# SSH settings
ssh_options[:forward_agent] = true
default_run_options[:pty]   = false

load 'config/deploy/production.rb'
load 'config/deploy/unicorn.rb'
load 'config/deploy/database.rb'

after "bundle:install", "deploy:migrate"
after "deploy",         "deploy:cleanup"

# Sidekiq options
set(:sidekiq_cmd) { "bundle exec sidekiq" }
set(:sidekiqctl_cmd) { "bundle exec sidekiqctl" }
set(:sidekiq_timeout) { 10 }
set(:sidekiq_role) { :app }
set(:sidekiq_pid) { "#{current_path}/tmp/pids/sidekiq.pid" }
set(:sidekiq_processes) { 1 }
