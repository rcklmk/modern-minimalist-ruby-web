# [procs]
server: bundle exec rackup -p 3000 -o 0.0.0.0
devserver: bundle exec rerun --pattern '{config.ru,app/**/*.rb,app/**/*.yml}' 'bundle exec rackup -p 3000 -o 0.0.0.0'

# [ubuntu/debian-specific setup]
# sudo sysctl fs.inotify.max_user_watches=524288
# sudo sysctl -p
