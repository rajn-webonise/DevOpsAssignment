# config valid only for current version of Capistrano
lock '3.6.1'


#server "localhost", :app, :web, :db, :primary => true
#set :stage, :production


set :application, 'JurgenMaxMeal'
set :repo_url, 'git@github.com:rajn-webonise/JurgenMaxMeal.git'


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "capify"

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
set :deploy_to, "/home/webonise/raj/JMMCapify"

#set :user,            'webonise'
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true }

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :staging do
    set :rails_env, 'staging'
    role :app, "localhost"
    role :web, "localhost"
    role :db,  "localhost", :primary => true
  end

end


# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
