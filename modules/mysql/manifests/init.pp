# Class: mysql
#
# Manages mysql.
# Include it to install and run mysql with default settings
#
# Usage:
# include mysql


import "defines/*.pp"
import "classes/*.pp"

class mysql {
 require mysql::params

    package { "mysql":
        name  => "MySQL-client-community",
        ensure => present,
    }

    package { "mysql-server":
        name => "MySQL-server-community",
        ensure => present,
    }

    service { "mysql":
        name => "mysql",
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus => true,
	##status => "/etc/init.d/mysql status",
        require => File["my.cnf"],
        subscribe => File["my.cnf"],
    }

    file { "my.cnf":
	content => template("mysql/my.cnf.erb"),
	#source => [
        #	"puppet:///modules/mysql/${fqdn}/my.cnf",
        #	"puppet:///modules/mysql/${role}/my.cnf",
        # 	"puppet:///modules/mysql/${zone}/my.cnf",
        #	"puppet:///modules/mysql/my.cnf",
    	#],
        mode => 644, owner => root, group => root,
        require => Package["mysql-server"],
        ensure => present,
        path => "/etc/my.cnf",
        }
    }

   file { "/var/log/mysql":
	ensure => directory,
	before => [ Package["mysql"], Package["mysql-server"] ],
 	owner => "root", group => "root", mode => 0755, }


# Extra settings per Operating system 
    case $operatingsystem {
        default: { }
    }

# Inclusion of optional extended classes
    if $backup == "yes" { include mysql::backup }
    if $monitor == "yes" { include mysql::monitor }
    if $firewall == "yes" { include mysql::firewall }

