import "classes/*"
import "defines/*"
class common {
 require common::params

 require yum_repos
 require users
 require sudo
 require logrotate

file {
    #Scratch area for downloading tarballs, state info, etc. 
    [ "/var/lib/puppet/scratch",
      "/var/lib/puppet/scratch/state" ]:
        ensure => directory,
        mode => 0755, owner => puppet, group => puppet;
 }
 file { "/etc/profile.d/":
        ensure => directory,
        source => "puppet://$server/modules/common/profile.d/",
	recurse => true,
        mode => 0755, owner => root, group => root;
 }

 file { "/etc/profile":
        ensure => present, 
        source => "puppet://$server/modules/common/profile",
        mode => 0644, owner => root, group => root,
 }

 file { "/etc/security/limits.conf":
        ensure => present,
        source => "puppet://$server/modules/common/limits.conf",
	recurse => true,
        mode => 0644, owner => root, group => root;
 }
}#end of common class
