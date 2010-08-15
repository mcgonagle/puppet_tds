# Class: ant::disable
#
# Stops ant service and disables it at boot time
#
# Usage:
# include ant::disable

class ant::disable inherits ant {
    Service["ant"] {
        ensure => "stopped" ,
        enable => "false",
    }
}
