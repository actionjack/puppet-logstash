# = Class: logstash::input::mongo
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
class logstash::input::mongo (
 $mongodblogpath
)  inherits logstash::params {
  file {'/etc/logstash/conf.d/input-mongo.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('logstash/input-mongo.conf.erb'),
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}
