ssl_verify_mode    :verify_none
chef_server_url "https://chef.kurento.org"
file_cache_path    "/var/cache/chef"
pid_file           "/var/run/chef/client.pid"
Mixlib::Log::Formatter.show_time = true
log_location       STDOUT
log_level          :info
node_name	"docker-kurento-dev-debian"
validation_client_name	"chef-validator"
validation_key	"/etc/chef/chef-validator.pem"


