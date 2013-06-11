default_environment["PATH"] = "/usr/local/rbenv/versions:/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

set :application, "web"
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

namespace :deploy do desc "restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :upload do
    run "ln -s #{shared_path}/public/system #{current_path}/public/system"
  end
end

desc "Create database.yml and asset packages for production"
after("deploy:update_code") do
  db_config = "#{shared_path}/config/database.yml.production"
  run "cp #{db_config} #{release_path}/config/database.yml"
end