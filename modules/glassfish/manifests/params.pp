class glassfish::params  {

# Basic settings
$unzipped_packagename = $operatingsystem ? {
    default => "glassfishv3",
}

$packagename = $operatingsystem ? {
    default => "glassfish-v3.zip",
}

$file_url = $operatingsystem ? {
    default => "puppet:///modules/glassfish/",
}

$file_destination = $operatingsystem ? {
    default => "/usr/local",
}

}#end of class glassfish::params
