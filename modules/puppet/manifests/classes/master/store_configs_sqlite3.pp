#class definition to install storeconfigs and use sqlite3
class puppet::master::store_configs_sqlite3 {
 #Install packages for puppetmaster storeconfigs 
 package {  "sqlite": ensure => latest  }
 package {  "rubygem-sqlite3-ruby": ensure => latest }
 package {  "rubygem-rails": ensure => latest }
}#end of class puppet::master::store_configs_sqlite3 {
