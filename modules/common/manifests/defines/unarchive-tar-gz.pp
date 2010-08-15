define common::unarchive::tar-gz($file, $untared_file, $module_url, $destination) {
  file {"${destination}/${file}":
   source => "${module_url}/${file}",
   ensure => present,
  }

  exec { "/bin/tar -xzf ${destination}/${file} -C ${destination}":
    ##command => "cd ${destination};/bin/tar -xzf ${file} -C ${destination}",
    ##command => "/bin/tar -xzf ${destination}/${file} -C ${destination}",
    creates => "${destination}/${untared_file}",
    subscribe => File["${destination}/${file}"],
    #onlyif => "/bin/false",
  }
}
