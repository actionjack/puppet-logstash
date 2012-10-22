# = Class: logstash::input::secure
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
class logstash::input::secure {
  file {'/etc/logstash/conf.d/input-secure.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/logstash/etc/logstash/conf.d/input-secure.conf',
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}
