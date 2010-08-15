#class definition to install passenger and use passenger
class puppet::master::passenger {
 #Install phusion packages
 package { "gcc-c++": ensure => latest }
 package { "httpd": ensure => latest }
 package { "httpd-devel": ensure => latest }
 package { "ruby-devel": ensure => latest }
 package { "rubygems": ensure => latest }
 package { "mod_ssl": ensure => latest }
 package { "rack": ensure => present, provider => gem }
 package { "passenger": ensure => latest, provider => gem }

 exec {"/usr/lib/ruby/gems/1.8/gems/passenger-2.2.15/bin/passenger-install-apache2-module -a":
      path => "/usr/bin:/usr/sbin:/bin",
      onlyif => "! /usr/bin/test -f /usr/lib/ruby/gems/1.8/gems/passenger-2.2.15/ext/apache2/mod_passenger.so"
      }#end of exec

 file {"/etc/httpd/conf.d/passenger-puppetmasterd.conf":
	content => template("apache/passenger-puppetmasterd.conf"),
        ensure => present,
        owner => "root", group => "root", mode => "644"
 }#end of file type

 file {"/etc/httpd/conf.d/ssl.conf": ensure => absent }

 file {  "/etc/puppet/rack/":,
          ensure => directory,
           owner => "puppet", group => "puppet", mode => "644", }#file 

 file {  "/etc/puppet/rack/public":,
          ensure => directory,
           owner => "puppet", group => "puppet", mode => "644", }#file 

 file { "/etc/puppet/rack/public/RPC2":,
          ensure => directory,
           owner => "puppet", group => "puppet", mode => "644", }#file 
	
 file { "/etc/puppet/rack/config.ru":
	source => "puppet:///modules/puppet/config.ru",
        ensure => present,
        owner => "puppet", group => "puppet", mode => "644" }#end of file



}#end of puppet::master::passenger 
