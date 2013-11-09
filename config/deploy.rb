require "bundler/capistrano"

set :application, "ALLIES@CMU"
set :repository, "https://github.com/CMU-Allies/www"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "allies-03.andrew.cmu.edu", :web, :app, :db, :primary => true
set :user, "allies"
set :keep_releases, 5
set :rails_env, "production"
set :deploy_to, "/srv/rails/www"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

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
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/secret_token.rb #{ release_path }/config/initializers/secret_token.rb"
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/devise.rb #{ release_path }/config/initializers/devise.rb"
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/google_drive.yml #{ release_path }/config/google_drive.yml"
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/mailer.rb #{ release_path }/config/initializers/mailer.rb"
  end
end

after "deploy:finalize_update", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
