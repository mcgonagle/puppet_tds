import "classes/*.pp"
import "defines/*.pp"
class scribe {

 require scribe::params

 package { "libstdc++": ensure => latest,
       before => Package["facebook-scribe"], }

 package { facebook-scribe: ensure => latest,
       before => Package["perl-Log-Dispatch-Scribe"], }

 package { perl-Log-Dispatch-Scribe: ensure => latest }

 file { "/etc/init.d/scribed":
	source  => "puppet:///modules/scribe/scribed",
	owner   => "root",
	group   => "root",
	mode    =>  0755,
	notify  => Service["scribed"],
        alias   => "scribed-init",
 }

 file { "/usr/local/bin/scribe_log":
	source => "puppet:///modules/scribe/scribe_log",
	owner => root, group => root, mode=> 0755,
 }

 service { "scribed":
  enable => true, 
  ensure => running,
  require => File["scribed-init"],
  }


}



