node /^puppet/ {
 #node domU-12-31-39-0A-25-92.compute-1.internal
 include common

 #include puppet::master
 #include puppet::dashboard
 #include mysql
 include apache
 include tomcat
 include mod_jk

}
