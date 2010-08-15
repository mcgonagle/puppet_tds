# Class: glassfish
#
# Manages glassfish J2EE server.
# Include it to install and run glassfish with default settings
#
# Usage:
# include glassfish


import "defines/*.pp"
import "classes/*.pp"

class glassfish {
   require java 
   require glassfish::params


  file { "/etc/init.d/glassfish":
 	source => "puppet:///modules/glassfish/glassfish",
 	owner => "root", group => "root", mode => 0755,
  }

  service {'glassfish': 
        enable  => true, 
        ensure  => running, 
        hasstatus => false, 
        hasrestart => true,
	pattern => "java -cp /usr/local/glassfishv3/glassfish/modules/glassfish.jar",
        require => File["/etc/init.d/glassfish"],
        #subscribe => File["domain.xml"], 
   }

}#end of glassfish
