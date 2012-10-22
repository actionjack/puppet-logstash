# = Class: logstash::packages
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
class logstash::packages {
  $packagelist = ['logstash']
  package { $packagelist: ensure => installed }
}
