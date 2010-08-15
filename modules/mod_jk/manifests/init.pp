# Class: mod_jk
#
# Installs mod_jk  for apache
#
# Usage:
# include apache::mod_jk
#

#import "defines/*.pp"
#import "classes/*.pp"

class mod_jk {
    require apache
    require tomcat

    file {"/usr/lib64/httpd/modules/mod_jk.so":
       source => "puppet:///modules/apache/mod_jk/mod_jk-1.2.28-httpd-2.2.X.so",
       owner => "root", group => "root", mode => 0755, }

    file {"/etc/httpd/conf.d/mod_jk.conf":
       source => "puppet:///modules/apache/conf.d/mod_jk.conf",
       owner => "root", group => "root", mode => 0644, }
}#mod_jk
