# = Class: logstash::input::tomcat
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
class logstash::input::tomcat {
  file {'/etc/logstash/conf.d/input-tomcat.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/logstash/etc/logstash/conf.d/input-tomcat.conf',
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}
