class tomcat::params  {
# Basic settings
$untared_packagename = $operatingsystem ? {
    #default => "apache-tomcat-5.5.17",
    default => "apache-tomcat-6.0.29",
}

$packagename = $operatingsystem ? {
    default => "${untared_packagename}.tar.gz",
}

$file_url = $operatingsystem ? {
    default => "puppet:///modules/tomcat/",
}

$file_destination = $operatingsystem ? {
    default => "/opt",
}


}#end of class tomcat::params
