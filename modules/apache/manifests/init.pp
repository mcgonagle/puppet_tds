# Class: apache
#
# Manages apache.
# Include it to install and run apache with default settings
#
# Usage:
# include apache


##import the defines and classes subdirectories
import "defines/*.pp"
import "classes/*.pp"

#class apache
class apache {
    
    #require - evaluates one or more classes, adding the 
    #required class as a dependency. 
    #Note require only works with clients >.25
    #http://docs.puppetlabs.com/references/latest/function.html    
    require apache::params

    #package definition, which installs httpd
    #via the yum repository manager. 
    package { apache:
        name   => "${apache::params::packagename}",
        ensure => present,
    }
    
    #service definition 
    service { apache:
        name   => "${apache::params::servicename}",
        ensure => running,
        enable => true,
        pattern => "${apache::params::servicepattern}",
        hasrestart => true,
        hasstatus => true,
        require => Package["apache"],
    }
 
   #apache::config_def{"${hostname}":
   #	require => Package["apache"],
   #	before => Service["apache"],
   #} # end of apache::config_def call
	

    if $backup == "yes" { include apache::backup }
    if $monitor == "yes" { include apache::monitor }
    if $firewall == "yes" { include apache::firewall }

}#end of apache clas

