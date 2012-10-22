# = Class: logstash::service
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
class logstash::service {
  service {'logstash':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    require    => Class['logstash::packages']
  }
  File {
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
  file {'/etc/logstash/conf.d/logstash.conf':
    source  => 'puppet:///modules/logstash/etc/logstash/conf.d/logstash.conf'
  }
  file {'/etc/security/limits.d/elasticsearch-limits.conf':
    source => 'puppet:///modules/logstash/etc/security/limits.d/elasticsearch-limits.conf'
  }
}
