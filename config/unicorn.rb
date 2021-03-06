worker_processes 1

listen "/home/apps/web/shared/sockets/unicorn.sock"

project_dir = "/home/apps/web/current"
working_directory project_dir

stderr_path "#{project_dir}/log/unicorn_error.log"
stdout_path "#{project_dir}/log/unicorn.log"
pid "#{project_dir}/tmp/pids/unicorn.pid"

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
