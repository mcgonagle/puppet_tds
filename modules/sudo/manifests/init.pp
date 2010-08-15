# Class: sudo
#
# Manages apache sudo system
# Include it to install and run sudo with default settings
#
# Usage:
# include sudo


##import "defines/*.pp"
##import "classes/*.pp"

class sudo {
    
    require sudo::params

    File{
    	owner  => 'root',
    	group  => 'root',
    	mode   => '640',
  	}
    # temporary file to sync with remote copy
    file{'/etc/sudoers.check':
    	source => "puppet:///modules/sudo/sudoers",
  	}

    # copy it to the tmp location if required
    exec{'cp-sudo':
    	path        => '/bin:/usr/sbin:/usr/bin',
    	subscribe   => File['/etc/sudoers.check'],
    	logoutput   => on_failure,
    	# check file validity and rather or not the copies are different
    	onlyif      => 'visudo -c -f /etc/sudoers.check',
    	unless      => 'diff /etc/sudoers.check /etc/sudoers',
    	# this is dirty, but cp is usually aliased to cp -i
    	command     => '/bin/cp /etc/sudoers.check /etc/sudoers'
  	}

    # if a local user changes sudoers.tmp, then this will break
    file {'/etc/sudoers':
    	require => Exec['cp-sudo'],
    	mode    => '0440',
  	}
}
