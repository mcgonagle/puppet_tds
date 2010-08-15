class puppet::client inherits puppet  {

 #service { "puppet":
  #enable    => true,
  #ensure    => running,
  #subscribe => File["/etc/puppet/puppet.conf"],
  #require => File["/etc/puppet/puppet.conf"],
  #}


 file {"/etc/puppet/puppet.conf":
        source => [
                "puppet:///modules/puppet/puppet.conf.${hostname}",
                "puppet:///modules/puppet/puppet.conf.${role}",
                "puppet:///modules/puppet/puppet.conf.${zone}",
                "puppet:///modules/puppet/puppet.conf.${datacenter}",
                "puppet:///modules/puppet/puppet.conf"
        ],
        ensure => present,
        owner => "root", group => "root", mode => "644",
 }#end of file type
}
