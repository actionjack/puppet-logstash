# = Class: logstash
#
# This class installs and configures the logstash service.
#
# == Parameters:
#
# Check params.pp to configure
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# == Actions:
#   Installs and configures the logstash service.
#
# == Requires:
#   - Package["logstash"] in your local repo
#   - Package["java>=1.6.0"] in your local repo
#
# == Sample Usage:
#
# site.pp:
#    import "logstash" (optional since it's in autoload format)
#
# nodes.pp:
#    class logstash-client{
#        include logstash
#      # If you want to add additional functionality:
#      # include logstash::service::shipper # enable shipping to amqp.
#      # include logstash::service::indexer # enable indexer to elasticsearch.
#    }
#
class logstash (
  $amqp_host,
  $amqp_queue_name,
  $amqp_exchange_name,
  $amqp_virtual_host,
  $amqp_username,
  $amqp_userpassword,
  $elasticsearch_host,
) inherits logstash::params {
  include logstash::packages
  include logstash::service
  include logstash::input::syslog
  include logstash::input::secure
}
