rake db:drop
rake db:create
rake db:migrate --trace
rake db:test:prepare
rake db:seed --trace