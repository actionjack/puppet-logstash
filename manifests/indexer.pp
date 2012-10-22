# = Class: logstash::indexer
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
class logstash::indexer inherits logstash::params {
  file {'/etc/logstash/conf.d/indexer.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('logstash/indexer.conf.erb'),
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}

