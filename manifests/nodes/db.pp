node "devdb1.domain.local" inherits zone {
 #include $role
 notice ("importing mysql module")
 include mysql
}

