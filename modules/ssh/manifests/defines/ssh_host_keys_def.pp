define ssh::ssh_host_keys_def() {
    @@sshkey { $hostname:
                ensure => 'present',
                name => $hostname,
                host_aliases => $fqdn,
                type => 'ssh-rsa',
                key => $sshrsakey,
              }

    Sshkey <<||>>
    resources { sshkey: purge => true }
}
