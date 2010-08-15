# Class: java
#
# Manages java J2EE server.
# Include it to install and run java with default settings
#
# Usage:
# include java


#import "defines/*.pp"
import "classes/*.pp"

class java {
    
    require java::params

    package{"${java::params::packagename}":
	ensure => installed,
        before => File['java.sh'],
   	} 
    
    file {"/etc/profile.d/java.sh":
	source => "puppet:///modules/java/java.sh",
	ensure => present,
	alias  => "java.sh",
	}

}
