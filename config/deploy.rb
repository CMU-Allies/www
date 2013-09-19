set :application, "alliesweb"
set :repository,  "https://github.com/CMU-Allies/www.git"
set :deploy_to, "/srv/rails/www"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "allies.andrew.cmu.edu"    # Your HTTP server, Apache/etc
role :app, "allies.andrew.cmu.edu"    # This may be the same as your `Web` server
role :db,  "allies.andrew.cmu.edu", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :seed do
    run "cd #{deploy_to}/current && rake db:seed RAILS_ENV=production"
  end
end
