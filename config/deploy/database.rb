set(:database_username)   { user }
set(:production_database) { "#{application}_production" }
set(:staging_database)    { "#{application}_staging" }

namespace :db do
  # To populate your database with seeds run 'cap <environment> db:seed'
  desc "Populates the #{rails_env} database"
  task :seed do
    puts "\n\n=== Populating the #{rails_env} database! ===\n\n"
    run "cd #{current_path} && bundle exec rake db:seed --trace RAILS_ENV=#{rails_env}"
  end

  # This asks for database password while deploy and creates database.yml
  desc "Create database yaml in shared path"
  task :configure do
    set :database_password do
      Capistrano::CLI.password_prompt "Enter #{rails_env.capitalize} database Password: "
    end

    db_config = <<-CONFIG.gsub(/^ {6}/, '')
      common: &common
        adapter: postgresql
        encoding: unicode
        host: localhost
        pool: 5
        username: #{database_username}
        password: #{database_password}

      production:
        <<: *common
        database: #{production_database}

      staging:
        <<: *common
        database: #{staging_database}
    CONFIG

    run "mkdir -p #{shared_path}/config"
    put db_config, "#{shared_path}/config/database.yml"
  end

  # This makes symlink from shared config to release config
  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

before "deploy:setup",   "db:configure"
before "bundle:install", "db:symlink"