define ssh::ssh_authorized_keys_def() {
    ##causing unknown error
    ##turning this off will turn off purging. 
    ##resources { ssh_authorized_key: purge => true }
    ssh_authorized_key { root:
                ensure => 'present',
                name => "root@config.buydomains.com",
                type => 'ssh-rsa',
                key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA8xmZ+OEwD5GODLOSuNLCu+ZxxyFIFMR2e9XT3qeRpSWvh4lh7jenGcoIxUK1IfdIkk0NJu9c1/NP7+vzeEP5wmmh7KzRFckSvy6zUOIrGEUW5KJU+tsy94P1CnfvJxe6mBNM0OlQOcn8GDEsoFkcN+5NLst5Z/8lu0nj2xDHJful14m3G1DOsxiNP86UHhdoYiwmdsWx+b5Y5NfoQ31R6wjOVbf5CYsjLoKbZvzPiihzpQpo1pLed8nviMxJeGWhfWNtFrda/Z2tEi/ndYoTejsuMibgRqnBp4UionX2ujK8eD2455qnYs6WmwuSjdMNgmjMQlWShcOgGyjiWDUIpw==",
                user => root,
              }

    ssh_authorized_key { matt:
                ensure => 'absent',
                name => "matt@config.buydomains.com",
                type => 'ssh-rsa',
                key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA8xmZ+OEwD5GODLOSuNLCu+ZxxyFIFMR2e9XT3qeRpSWvh4lh7jenGcoIxUK1IfdIkk0NJu9c1/NP7+vzeEP5wmmh7KzRFckSvy6zUOIrGEUW5KJU+tsy94P1CnfvJxe6mBNM0OlQOcn8GDEsoFkcN+5NLst5Z/8lu0nj2xDHJful14m3G1DOsxiNP86UHhdoYiwmdsWx+b5Y5NfoQ31R6wjOVbf5CYsjLoKbZvzPiihzpQpo1pLed8nviMxJeGWhfWNtFrda/Z2tEi/ndYoTejsuMibgRqnBp4UionX2ujK8eD2455qnYs6WmwuSjdMNgmjMQlWShcOgGyjiWDUIpw==",
                user => matt,
              }

    ssh_authorized_key { tom-rsa:
                ensure => 'present',
                name => "tom@config.buydomains.com",
                type => 'ssh-rsa',
                key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA5a6bC/AupI9JQ6b2t69vuWe1vpHKNoAUiItnF2yfMBzuikY98x3xtWDTt/9c2dVAqAL2/6SEjreocFzVW2lHPvtObJVVkRV82Rs/PbMob/LHDpousjH5lVDh+LPDUVJDLEvmd7+bSO2559Ot5P32lUJlsKjNc+5j6nvzG225J9TbdPn7ayGJnJuI9IkowXPNVcYm0IEMnjDUfRDQmvh+tX4IFdEhcxs/JVVIs7yPd5YIwT/VbyC8bAdLt47gWRwQ5yc2WGPJV37nIJWq409TOHXv4I7GUEHNIPynad6Wgb+BL+cWSgi0PQZKSNACuNdt8FY+19INtSVCsjxEUnC3xQ==",
                user => tom,
              }

    ssh_authorized_key { tom-dss:
                ensure => 'present',
                name => "tom-dss@config.buydomains.com",
                type => 'ssh-dss',
                key => "AAAAB3NzaC1kc3MAAACBANS78QhK14OlNByi1RD+aqgSXaQhTSDDevGEVF/YyTHCr2sD+MsowevT74hFuDhl5HaBO9I+o1pLYQyOvUkAhc7Z31jQTPEAmd/FvbDAcT9+HEjmIxhKGC+DMVhyw8R4oBHXPY40SJyU74XTh7XnOQW0Ul8iJxuO+sAQCDbZ1MFlAAAAFQDTdwvwX95lGvtaPtn42bDDkuy0XQAAAIAoJimUMonrNrOHINo+REY4DhlgCiSmuYiW64Oifbdwlx6+q+lOf+drC5KLXTmKcuZ5avYCffitRZaDIZMjLol4eHkyIvTJ0k5dgXr31ByPGHdIPmDgEVZMOiCLQwlWIKa2m9DUVoi6AlXZKhaZS42EOM2qBMOEcRJURpc/WGC+mwAAAIA6Fsu2IbWG/uD4PBn4w1Y1X+NRFLWFywUwx5p9z/tWQcL7kKrBBLZjCsRXUfqeqzQDdNkAVFH7F4sRk33Gg4VGce2ooBeUfwqauvE6Bk0e8apaBdJtQ497zuCW8eWnt7gtH5Q+9Zf5j8V/p+MoIjiRt5GbBr/f7Dasaoq40GbTzw=",
                user => tom,
              }
   file {"/home/tom/.ssh":
  	ensure => directory,
  	recurse => true, #enable recursive directory management 
  	#purge => true, #purge unmanaged files
  	#force => true, #also purge subdirecotories and links
  	owner => tom, group => tom,
  	mode => 0600,#this mode will apply to files form the source directory
  	# puppet will automatically set +x for directories
        checksum => undef,
  	source => [ "puppet:///modules/ssh/toms_ssh_config_files" ],
        before => [ Ssh_authorized_key["tom-rsa", "tom-dss" ]]
     }#end of file "/home/tom/.ssh"


    ssh_authorized_key { "wgray":
                ensure => 'present',
                name => "wgray@config.buydomains.com",
                type => 'ssh-rsa',
                key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA88VVtF95SxA/7rtfZATJFiisNV7sYv7GyRStY0yiCk+ncVSGvQgtTiqCO8pRP9EwoMF2lf3/tjg5nPwdLn6H0obUnp9skAX2f7j7kFuWkDuwTamanRZP8eMcxtvBKPTp10fOGReCYW832Kp99qy9lOTCHnzim6paC24NNZ/kA+mXA+WqqBOl8IcE3C7eD+S+j6XF/4TqEpKF8uL5h6Tb7ADsVGqC6ZNdkYrhsxmF0aRxUPXCm1Faa+KiTvGLBNjuFlaK5j6Lhp4d7SGrLiz8gN13fJDxbxo5biMBzukI9zycW7XcdPosLj52IPM6B+fE3iRov6moY8JlGGyzT6dvbQ==",
                user => wgray,
              }

       file {"/home/wgray/.ssh":
        ensure => directory,
        recurse => true, #enable recursive directory management 
        owner => wgray, group => wgray,
        mode => 0600,#this mode will apply to files form the source directory
        # puppet will automatically set +x for directories
        checksum => undef,
        source => [ "puppet:///modules/ssh/wgray_ssh_config_files" ],
        before => [ Ssh_authorized_key["wgray" ]],
     }#end of file "/home/wgray/.ssh"

    ssh_authorized_key { rich:
                ensure => 'absent',
                name => "rich@config.buydomains.com",
                type => 'ssh-rsa',
                key => "",
                user => rich,
              }
    ssh_authorized_key { devuser:
                ensure => 'absent',
                name => "devuser@config.buydomains.com",
                type => 'ssh-rsa',
                key => "",
                user => devuser,
              }
    ssh_authorized_key { qauser:
                ensure => 'absent',
                name => "qauser@config.buydomains.com",
                type => 'ssh-rsa',
                key => "",
                user => qauser,
              }
}
