# Capfile
require "capistrano/setup"
require "capistrano/deploy"

# rbenv integration
require "capistrano/rbenv"
set :rbenv_type, :user
set :rbenv_ruby, "3.2.2"

# Bundler
require "capistrano/bundler"

# Rails migrations
require "capistrano/rails/migrations"

# Git SCM
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

