class puppet::dashboard {
  require mysql
  #package { "mysql": ensure => latest }
  #package { "mysql-server": ensure => latest }
  package { "mysql-devel": ensure => latest }
  package { "ruby": ensure => latest }
  if defined(Package["ruby-devel"]) { } else { package { "ruby-devel": ensure => latest } }
  package { "ruby-irb": ensure => latest }
  package { "ruby-mysql": ensure => latest }
  package { "ruby-rdoc": ensure => latest }
  package { "ruby-ri": ensure => latest }

  package { "rake": ensure => latest, provider => gem }

  package {"puppet-dashboard": ensure => latest, require => Yumrepo["puppetlabs"] }

 service { "mysqld": ensure => running }
 service { "puppet-dashboard": ensure => running }
 file {"/etc/init.d/puppet-dashboard":
	source => "puppet:///modules/puppet/puppet-dashboard",
 	ensure => present,
        owner => "root", group => "root", mode => "755",		
	before => Service["puppet-dashboard"],
	}#file
 file {"/usr/lib/ruby/site_ruby/1.8/puppet/reports/puppet_dashboard.rb":
	source => "puppet:///modules/puppet/puppet_dashboard.rb",
 	ensure => present,
	replace => no,
        owner => "puppet", group => "puppet", mode => "755",		
	before => Service["puppet-dashboard"],
	}#file

}
