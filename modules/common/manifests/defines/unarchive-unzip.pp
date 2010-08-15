define common::unarchive::unzip($file, $unzipped_file, $module_url, $destination) {
  file {"${destination}/${file}":
   source => "${module_url}/${file}",
   ensure => present,
  }

  exec { "/usr/bin/unzip -d /usr/local/ ${destination}/${file}":
    creates => "${destination}/${unzipped_file}",
    subscribe => File["${destination}/${file}"],
  }
}
