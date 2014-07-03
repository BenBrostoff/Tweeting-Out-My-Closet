# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__
set :views, Proc.new { File.join(root, "app/views")}

run Sinatra::Application
