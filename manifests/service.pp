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

class logstash::service::syslog {
  file {'/etc/logstash/conf.d/input-syslog.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/logstash/etc/logstash/conf.d/input-syslog.conf',
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}

class logstash::service::syslogreplay {
  file {'/etc/logstash/conf.d/input-syslog-replay.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/logstash/etc/logstash/conf.d/input-syslog-replay.conf',
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}

class logstash::service::secure {
  file {'/etc/logstash/conf.d/input-secure.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/logstash/etc/logstash/conf.d/input-secure.conf',
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}

class logstash::service::indexer {
  file {'/etc/logstash/conf.d/indexer.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('logstash/indexer.conf.erb'),
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}

class logstash::service::shipper {
  file {'/etc/logstash/conf.d/shipper.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('logstash/shipper.conf.erb'),
    notify  => Service['logstash'],
    require => Class['logstash::packages']
  }
}

