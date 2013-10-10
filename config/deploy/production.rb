desc "Run tasks in production enviroment."
task :production do
  # Prompt to make really sure we want to deploy into prouction
  puts "\n\e[0;31m   ######################################################################"
  puts "   #\n   #       Are you REALLY sure you want to deploy to production?"
  puts "   #\n   #               Enter y/N + enter to continue\n   #"
  puts "   ######################################################################\e[0m\n"
  proceed = STDIN.gets[0..0] rescue nil
  exit unless proceed == 'y' || proceed == 'Y'


  server 'rocketscience.it', :app, :web, :db, :primary => true

  set :stage, "production"
  set :rails_env, "production"
end
