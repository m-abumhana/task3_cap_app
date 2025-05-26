# config/deploy.rb
lock "~> 3.17.0"

set :application, "task3_cap_app"
set :repo_url,  "git@github.com:m-abumhana/task3_cap_app.git"
set :deploy_to, "/var/www/#{fetch(:application)}"

append :linked_files,  "config/master.key", "config/credentials.yml.enc"
append :linked_dirs,   "log", "tmp/pids", "tmp/cache", "tmp/sockets"

set :keep_releases, 5

