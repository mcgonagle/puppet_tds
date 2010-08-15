# Class: users
#
# Manages namemedia's users and groups
# Include it to install the default set of users
#
# Usage:
# include users


import "defines/*.pp"
##import "classes/*.pp"

class users {

    require users::params

    #users::manage_user {"qauser":
    #    uid => "503",
    #    gid => "503",
    #    other_groups => "users",
    #    password => 'I9J6N6XaPjymI',
    #    manage_ssh => "true",
    #    }

}#end of class user
