# Class: glassfish::disable
#
# Stops glassfish service and disables it at boot time
#
# Usage:
# include glassfish::disable

class glassfish::disable inherits glassfish {
    Service["glassfish"] {
        ensure => "stopped" ,
        enable => "false",
    }
}
