class mysql::params {
#basic settings
$mysqlclientpackagename = $operatingsystem ? {
    default => "MySQL-client-community",
}                  


$mysqlserverpackagename = $operatingsystem ? {
    default => "MySQL-server-community",
}

$servicename = $operatingsystem ? {
    default => "mysql",
}

$my_cnf_path = $operatingsystem ? {
    default => "/etc/my.cnf",
}     

$thread_concurrency = "0"

}#end of mysql::params class
