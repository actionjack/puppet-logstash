# = Class: logstash::params
#
#   class description goes here.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class logstash::params {
  if $amqp_host == undef {
    $amqp_host          = hiera('amqp_host'),
  }
  if $amqp_queue_name == undef {
    $amqp_queue_name    = hiera('amqp_queue_name'),
  }
  if $amqp_exchange_name == undef {
    $amqp_exchange_name = hiera('amqp_exchange_name'),
  }
  if $amqp_virtual_host == undef { 
    $amqp_virtual_host  = hiera('amqp_virtual_host'),
  }
  if $amqp_username == undef {
    $amqp_username      = hiera('amqp_username'),
  }
  if $amqp_userpassword == undef {
    $amqp_userpassword  = hiera('amqp_userpassword'),
  }
  if $elasticsearch_host == undef {
    $elasticsearch_host = hiera('elasticsearch_host'),
  }
}
