# Class: glassfish::absent
#
# Removes glassfish package
#
# Usage:
# include glassfish::absent
#
class glassfish::absent inherits glassfish {
    Package["glassfish"] {
        ensure => "absent" ,
    }
}
