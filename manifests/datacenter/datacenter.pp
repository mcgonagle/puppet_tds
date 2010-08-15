node datacenter inherits default {
 case $datacenter {
  default: { include $zone }
}#end of datacenter case
}#end class datacenter
