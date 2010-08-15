# Class: ant::absent
#
# Removes ant package
#
# Usage:
# include ant::absent
#
class ant::absent inherits ant {
    Package["ant"] {
        ensure => "absent" ,
    }
}
