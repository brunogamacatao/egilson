root = "/root/apps/egilson/current"
working_directory root
pid "#{root}/tmp/pids/unicorn_egilson.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.egilson.sock"
worker_processes 2
timeout 30
