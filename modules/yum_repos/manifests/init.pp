class yum_repos {
import "defines/*.pp"
#import "classes/*.pp"

	require yum_repos::params

	yumrepo_define{ "${servername}": 
  		description => "${servername}",
        	url => "http://${servername}:80/repo",
	}#end of yumrepo_definition

	yumrepo_define{ "puppetlabs": 
  		description => "puppetlabs",
        	url => "http://yum.puppetlabs.com/base/",
	}#end of yumrepo_definition

	
	
	
	#Install the Epel Repository via package type
	package { "epel-release": ensure => latest }
}#end of class yum_repos
