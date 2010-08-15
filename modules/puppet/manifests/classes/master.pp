class puppet::master inherits puppet  {
 include "master/*.pp"

 package { "puppet-server": ensure => latest, require => Package["epel-release"] }
 package { "rpm-build": ensure => latest }
 package { "yum-downloadonly": ensure => latest }
 package { "createrepo": ensure => latest }
 include puppet::master::store_configs_sqlite3
 include puppet::master::passenger

 file {"/etc/init.d/puppetmaster":
        source => "puppet:///modules/puppet/puppetmaster",
        owner => "root", group => "root", mode => 0755, }

 #service { "puppetmaster":
  #enable    => true,
  #ensure    => running,
  #subscribe => File["/etc/puppet/puppet.conf"],
  #require => File["/etc/puppet/puppet.conf"],
  #}

 #service { "puppet":
  #enable    => true,
  #ensure    => running,
  #subscribe => File["/etc/puppet/puppet.conf"],
  #require => File["/etc/puppet/puppet.conf"],
  #}



 file {"/etc/puppet/puppet.conf":
        source => [
                "puppet:///modules/puppet/puppetmaster.conf.${hostname}",
                "puppet:///modules/puppet/puppetmaster.conf.${role}",
                "puppet:///modules/puppet/puppetmaster.conf.${zone}",
                "puppet:///modules/puppet/puppetmaster.conf.${datacenter}",
                "puppet:///modules/puppet/puppetmaster.conf"
        ],
        ensure => present,
        owner => "root", group => "root", mode => "644",
 }#end of file type

 file {"/etc/puppet/tagmail.conf":
	source => "puppet:///modules/puppet/tagmail.conf",
 	owner => "root", group => "root", mode => 0644, }
 file {"/etc/puppet/auth.conf":
	source => "puppet:///modules/puppet/auth.conf",
 	owner => "root", group => "root", mode => 0644, }
 file {"/etc/puppet/fileserver.conf":
	source => "puppet:///modules/puppet/fileserver.conf",
 	owner => "root", group => "root", mode => 0644, }
 file {"/etc/puppet/autosign.conf":
	source => "puppet:///modules/puppet/autosign.conf",
 	owner => "root", group => "root", mode => 0644, }

}#end of puppet::master
