# config/deploy.rb

set :application, "task3_cap_app"
set :repo_url,  "git@github.com:m-abumhana/task3_cap_app.git"

# Deploy to the user's home directory
set :deploy_to, "/home/ec2-user/rails7_apps/#{fetch(:application)}"

set :rbenv_type, :user
set :rbenv_ruby, '3.2.2'
set :pty, true
set :format, :airbrussh

set :branch, 'main'

append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :keep_releases, 5

