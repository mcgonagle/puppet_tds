class puppet {

#import "defines/*.pp"
import "classes/*.pp"

require puppet::params

 package { puppet: ensure => latest }
 file {"/etc/init.d/puppet":
	source => "puppet:///modules/puppet/puppet",
 	owner => "root", group => "root", mode => 0755, }

}
