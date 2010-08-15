class subversion::params  {

# Basic settings
$packagename = $operatingsystem ? {
    default => "subversion",
}
}#end of class subversion::params
