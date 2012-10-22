# = Class: logstash::shipper
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
class logstash::shipper inherits logstash::params {
  file {'/etc/logstash/conf.d/shipper.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('logstash/shipper.conf.erb'),
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}

