# = Class: logstash::input::syslogreplay
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
class logstash::input::syslogreplay {
  file {'/etc/logstash/conf.d/input-syslog-replay.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/logstash/etc/logstash/conf.d/input-syslog-replay.conf',
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}
