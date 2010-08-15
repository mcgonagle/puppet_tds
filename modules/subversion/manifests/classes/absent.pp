# Class: java::absent
#
# Removes java package
#
# Usage:
# include java::absent
#
class java::absent inherits java {
    Package["java"] {
        ensure => "absent" ,
    }
}
