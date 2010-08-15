# Class: mod_jk::absent
# Removes mod_jk package
# Usage:
# include mod_jk::absent

class mod_jk::absent inherits mod_jk {
    Package["mod_jk"] {
        ensure => "absent" ,
    }
}
