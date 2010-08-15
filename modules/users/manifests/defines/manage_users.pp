define users::manage_user($uid = '', $gid='', $ensure=present, $password, $other_groups="", $manage_ssh="true") {
  if($ensure == 'absent' and $name == 'root'){
    fail('will not delete root user')
  }

 if($gid) {
    $group = $gid
  } else {
    $group = $name
  }

  $home = $name? {
    'root'  => '/root',
    default => "/home/${name}",
  }

  group {"${name}":
    ensure     => $ensure,
    gid        => $group,
    before     => User["$name"],
  }

  user {$name:
    ensure     => $ensure,
    uid        => $uid,
    gid        => $group,
    groups     => $other_groups,
    home       => $home,
    managehome => true,
    password   => $password,
  }


if $home == "/root" {

} else {
 file {"${home}":
  ensure => directory,
  recurse => true,
  replace => false,
  checksum => undef,
  source => [ "puppet:///modules/users/${name}_homedir_files",
              "puppet:///modules/users/BLANK"
            ],
  }#end of file declaration
}#end of else

if $manage_ssh == true {
    file { "/home/${name}/.ssh":
        ensure => directory,
        owner => "root", group => "root", mode => 0400,
     }

   file { "/home/${name}/.ssh/authorized_keys":
       source => "puppet:///modules/users/${name}/ssh/authorized_keys",
       owner => "root", group => "root", mode => 0400,
    } 
} else {
}#end of manage_ssh else
}#end of define
