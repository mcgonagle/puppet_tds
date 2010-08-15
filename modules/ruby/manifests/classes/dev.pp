# Class: ruby::dev
#
# This class installs Ruby development libraries
#
# Parameters:
#
# Actions:
#   - Install RDoc, IRB, Rake and development libraries
#
# Requires:
#
# Sample Usage:
#
class ruby::dev inherits ruby {
  require ruby::params

  package { "${ruby::params::ruby_dev}":
    ensure => installed,
  }
}
