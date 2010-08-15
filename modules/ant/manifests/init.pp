# Class: ant
#
# Manages ant build server 
# Include it to install and run ant with default settings
#
# Usage:
# include ant


#import "defines/*.pp"
import "classes/*.pp"

class ant {
    
    require ant::params

    common::unarchive::tar-gz{"${ant::params::packagename}":
        file => "${ant::params::packagename}",
        untared_file => "${ant::params::untared_packagename}",
        module_url => "${ant::params::file_url}",
        destination => "${ant::params::file_destination}",
    }#end of common::unarchive::tar-gz

    #package{"${ant::params::packagename}":
    #	ensure => installed,
    #    before => File['ant.sh'],
    #	} 

   #symbolic link to /usr/share/tomcat
   file { "${ant::params::file_destination}/ant":
         ensure => "${ant::params::file_destination}/${ant::params::untared_packagename}"
        }
   file {"/etc/profile.d/ant.sh":
        source => "puppet:///modules/ant/ant.sh",
 	owner => "root", group => "root", mode => 0755,
	}

}
