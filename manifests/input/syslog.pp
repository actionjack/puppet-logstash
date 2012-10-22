# = Class: logstash::input::syslog
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
class logstash::input::syslog {
  file {'/etc/logstash/conf.d/input-syslog.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/logstash/etc/logstash/conf.d/input-syslog.conf',
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}
