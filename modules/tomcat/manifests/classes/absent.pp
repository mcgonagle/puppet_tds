# Class: tomcat::absent
#
# Removes tomcat package
#
# Usage:
# include tomcat::absent
#
class tomcat::absent inherits tomcat {
    Package["tomcat"] {
        ensure => "absent" ,
    }
}
