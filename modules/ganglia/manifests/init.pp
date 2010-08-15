import "defines/*.pp"
import "classes/*.pp"

class ganglia {

$clustername = $hostname ? {
 default => "green"
}

$multicastaddress = $hostname ? {
 default => "239.2.11.71"
}

$hostdmax = "3600"

 package { ganglia-gmond: ensure => latest }

 service { "gmond":
  enable => true, 
  ensure => running,
  subscribe => File["/etc/ganglia/gmond.conf"],
  }



}#end of class ganaglia

