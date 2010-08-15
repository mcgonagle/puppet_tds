class ssh::server inherits ssh {
  file {'/etc/ssh/sshd_config':
    #0.24.x 
    # source => 'puppet:///ssh/sshd_config'
    # 0.25.x
    #edited this out, have to talk to Matt about 
    #proper sshd_config files for bd - 06/27/10 1:00PM - Tom M
    source => 'puppet:///modules/ssh/sshd_config',
    owner => 'root',
    group => 'root',
    mode => '644'
  } 
  Package['openssh-server'] {
    ensure => latest, 
    require => Package['openssh-clients'],
  }  
  service {'sshd':
    ensure => running,
    enable => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package['openssh-server'],
    subscribe => File['/etc/ssh/sshd_config'],
  }

    # Collecting all the know host keys from stored configs.
    ssh::ssh_host_keys_def { $hostname: }
    ##notice("${ssh::params::ssh_authorized_key_users}")
    ##ssh::ssh_authorized_keys_def { "${ssh::params::ssh_authorized_key_users}": }
    ssh::ssh_authorized_keys_def {$hostname: }
}
