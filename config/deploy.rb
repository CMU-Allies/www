require "bundler/capistrano"
require "rvm/capistrano"

set :application, "alliesweb"
set :domain, "allies.andrew.cmu.edu"
set :repository,  "https://github.com/CMU-Allies/www.git"
set :branch, "master"
set :deploy_to, "/srv/rails/alliesweb"
set :user, ''
set :rails_env, "production"
set :rvm_type, :system
set :rvm_bin_path, '/usr/local/rvm/bin'
set :rvm_ruby_string, "2.2.1"
set :rvm_autolibs_flag, 'packages'
set :rvm_install_type, :head
default_run_options[:pty] = true

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  desc "Symlink shared config files"
  task :symlink_config_files do
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ release_path }/config/database.yml"
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/secrets.yml #{ release_path }/config/secrets.yml"
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/devise.rb #{ release_path }/config/initializers/devise.rb"
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/pi.yml #{ release_path }/config/pi.yml"
  end
end

after "deploy:finalize_update", "deploy:symlink_config_files"

set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

require "rvm/capistrano/alias_and_wrapp"
before 'deploy', 'rvm:create_alias'
before 'deploy', 'rvm:create_wrappers'
