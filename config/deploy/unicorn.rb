set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid,  "#{deploy_to}/shared/pids/unicorn.pid"

namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; \
    then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && \
    bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end

  task :start do
    run "bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
  end

  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; \
    then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

  desc 'Precache assets'
  task :precache_assets, :roles => :app do
    run "cd #{current_release} && rm -rf #{current_release}/public/assets/* && \
    bundle exec rake assets:precompile RAILS_ENV=#{rails_env}"
  end
end