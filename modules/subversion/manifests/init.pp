# Class: subversion
#
# Manages subversion 
# Include it to install and run subversion with default settings
#
# Usage:
# include subversion


#import "defines/*.pp"
import "classes/*.pp"

class subversion {
    
    require subversion::params

    package{"${subversion::params::packagename}":
	ensure => installed,
   	} 
    
}
