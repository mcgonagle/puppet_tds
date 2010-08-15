class apache::params  {

#paramater file for apache class
$apache_dev  = 'httpd-devel'
$template_file = "apache/${role}/httpd.conf.erb"

# Basic settings
$packagename = $operatingsystem ? {
    default => "httpd",
}

$servicename = $operatingsystem ? {
    default => "httpd",
}

$servicepattern = $operatingsystem ? {
    default => "/usr/sbin/httpd",
}

$username = $operatingsystem ? {
    default => "apache",
}

$configfile = $operatingsystem ?{
    default => "/etc/httpd/conf/httpd.conf",
}

$configdir = $operatingsystem ?{
    default => "/etc/httpd/conf",
}

$documentroot = $operatingsystem ?{
    default => "/var/www/html",
}

$prefork_start_servers = $role ?{
    default => "128",
}
$prefork_min_spare_servers = $role ?{
   default => "16",
}

$prefork_max_spare_servers = $role ?{
   default => "128",
}

$prefork_server_limit = $role ?{
   default => "1500",
}

$prefork_max_clients = $role ?{
   default => "1200",
}

$prefork_max_requests_per_child = $role ?{
   default => "10000",
}

$worker_start_servers = $role ?{
   default => "2",
}

$worker_max_clients = $role ?{
   default => "150",
}

$worker_min_spare_threads = $role ?{
   default => "150",
}


$worker_max_spare_threads = $role ?{
   default => "75",
}

$worker_threads_per_child = $role ?{
   default => "25",
}

$worker_max_requests_per_child = $role ?{
   default => "25",
}
}#end of apache::params class
