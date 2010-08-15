# Class: tomcat
#
# Manages tomcat J2EE server.
# Include it to install and run tomcat with default settings
#
# Usage:
# include tomcat


#import "defines/*.pp"
#import "classes/*.pp"

class tomcat {
    
    require tomcat::params

    common::unarchive::tar-gz{"${tomcat::params::packagename}":
        file => "${tomcat::params::packagename}",
        untared_file => "${tomcat::params::untared_packagename}",
        module_url => "${tomcat::params::file_url}",
        destination => "${tomcat::params::file_destination}",
        before => [ File["tomcat-startup-script"], Service["tomcat"] ],
    } 

   file {"/etc/init.d/tomcat":
	source => "puppet:///modules/tomcat/tomcat",
	ensure => present,
	owner => root, group => root, mode => 0755,
        alias => "tomcat-startup-script",
	}
   file {"/opt/tomcat/conf/server.xml":
	content =>template("tomcat/server.xml.erb"), 
	ensure => present,
	owner => root, group => root, mode => 0755,
        alias => "server.xml",
	}
	
  #symbolic link to /usr/share/tomcat
  file { "${tomcat::params::file_destination}/tomcat":
	 ensure => "${tomcat::params::file_destination}/${tomcat::params::untared_packagename}"
	}
   service {'tomcat': 
	enable	=> true, 
	ensure	=> running, 
	hasstatus => true, 
	hasrestart => true,
	require => File["tomcat-startup-script"],
	}	
}
