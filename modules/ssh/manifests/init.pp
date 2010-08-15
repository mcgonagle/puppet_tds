# Class: ssh
#
# Manages ssh J2EE server.
# Include it to install and run ssh with default settings
#
# Usage:
# include ssh


import "defines/*.pp"
import "classes/*.pp"

class ssh {
    
    require ssh::params

    package{
    	'openssh-clients': ensure => latest;
    	'openssh-server': ensure => absent;
    }

    file{'/etc/ssh/ssh_config':
    	owner   => root,
    	group   => root,
    	mode    => 0664,
    	ensure  => file,
    	require => Package['openssh-clients']
    }
}
