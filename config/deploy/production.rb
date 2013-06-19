default_environment["PATH"] = "/usr/local/rbenv/versions:/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"

set :domain, "ec2-54-249-211-156.ap-northeast-1.compute.amazonaws.com"
set :repository, "git@github.com:aizr/web.git"

set :scm, :git
set :branch, "master"

set :user, "apps"
set :group, "apps"

set :deploy_to, "/home/apps/web"
set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"

set :scm_verbose, true
set :use_sudo, false


role :app, "#{domain}"
role :web, "#{domain}"
role :db, "#{domain}", :primary => true

namespace :deploy do

  task :symlink_db_yml do
    db_config = "#{shared_path}/config/database.yml.production"
    run "ln -s #{db_config} #{release_path}/config/database.yml"
  end
end

before "bundle:install", "deploy:symlink_db_yml"
after "deploy:restart", "unicorn:restart"