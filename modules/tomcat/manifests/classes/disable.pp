# Class: tomcat::disable
#
# Stops tomcat service and disables it at boot time
#
# Usage:
# include tomcat::disable

class tomcat::disable inherits tomcat {
    Service["tomcat"] {
        ensure => "stopped" ,
        enable => "false",
    }
}
