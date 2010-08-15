class ant::params  {

#Below Used for when installing from rpm
#$packagename = $operatingsystem ? {
#    default => "ant",
#}

$untared_packagename = $operatingsystem ? {
    default => "apache-ant-1.8.0",
}
#notice that there is a -bin.tar.gz.
$packagename = $operatingsystem ? {
    default => "${untared_packagename}-bin.tar.gz",
}

$file_url = $operatingsystem ? {
    default => "puppet:///modules/ant/",
}

$file_destination = $operatingsystem ? {
    default => "/opt",
}

}#end of class ant::params
