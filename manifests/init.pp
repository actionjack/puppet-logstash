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
  $amqp_host          = undef,
  $amqp_queue_name    = undef,
  $amqp_exchange_name = undef,
  $amqp_virtual_host  = undef,
  $amqp_username      = undef,
  $amqp_userpassword  = undef,
  $elasticsearch_host = undef
) inherits logstash::params {

  include logstash::packages
  include logstash::service
  include logstash::input::syslog
}
