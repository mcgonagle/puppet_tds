class ganglia::server inherits ganglia {


package { rrdtool-devel: ensure => latest }
package { ganglia-gmetad: ensure => latest }
package { ganglia-web: ensure => latest }

include apache::php
#package { httpd: ensure => latest }
#package { php: ensure => latest }

 service { "gmetad":
   enable => true, 
   ensure => running,
   subscribe => File["/etc/ganglia/gmetad.conf"],
 }

## service { "httpd":
##   enable => true, 
   ##ensure => running,
   ##subscribe => File["/etc/ganglia/gmetad.conf"],
 ##}


ganglia_config_def{"gmond":
                        template_name   => "gmond.conf",
                        require         => Package[ganglia-gmond],
                        before          => Service[gmond],
                        notify          => Service[gmond],
                        }

ganglia_config_def{"gmetad":
                        template_name   => "gmetad.conf",
                        require         => Package[ganglia-gmetad], 
                        before          => Service[gmetad],
                        notify          => Service[gmetad],
                        }

}#end of ganglia server

