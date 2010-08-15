class java::params  {

# Basic settings
$packagename = $operatingsystem ? {
    default => "jdk-1.6.0_20-fcs",
}

$file_url = $operatingsystem ? {
    default => "puppet:///modules/java/",
}

$file_destination = $operatingsystem ? {
    default => "/usr/local",
}

}#end of class java::params
