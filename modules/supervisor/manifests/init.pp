#import "classes/*.pp"
import "defines/*.pp"

class supervisor {

 package { supervisor: ensure => latest }

 service { "supervisord":
  enable    => true,
  ensure    => running,
  subscribe => File["/etc/supervisord.conf"],
  require => File["/etc/supervisord.conf"],
  }

 file { "/etc/supervisord.conf":
  #source => [
  #  "puppet://$servername/supervisor/supervisord.conf.$hostname",
  #  "puppet://$servername/supervisor/supervisord.conf",
  #],
  content => template('supervisor/supervisord.conf.erb'),
  owner   => "root", group   => "root", mode    =>  0644,
  ##replace => false,
  replace => true,
 }

}#end of supervisor class
