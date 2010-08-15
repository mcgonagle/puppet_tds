node zone inherits datacenter {
 case $zone { 
  default: { include $zone }
}#end of zone case
}#end class zones
