class hosts {

  @@host { $hostname: 
           ip => $ipaddress, 
           host_aliases => [ $fqdn ],
           ensure => 'present' }

           Host <<||>>
}

