define apache::config_def() {
   require apache::params
file {"/etc/httpd/conf/":
 ensure => directory,
 recurse => true,
 replace => false,
 checksum => undef,
 source => [ "puppet:///modules/apache/${hostname}/conf",
             "puppet:///modules/apache/${role}/conf",
             "puppet:///modules/apache/DEFAULT"
           ],
 }#end of file declaration

file {"/etc/httpd/conf.d/":
 ensure => directory,
 recurse => true,
 replace => false,
 checksum => undef,
 source => [ "puppet:///modules/apache/${hostname}/conf.d",
             "puppet:///modules/apache/${role}/conf.d",
             "puppet:///modules/apache/DEFAULT"
           ],
 }#end of file declaration
} #end of apache::config_def
