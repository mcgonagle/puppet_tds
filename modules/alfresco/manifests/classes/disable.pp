# Class: java::disable
#
# Stops java service and disables it at boot time
#
# Usage:
# include java::disable

class java::disable inherits java {
    Service["java"] {
        ensure => "stopped" ,
        enable => "false",
    }
}
