##Import the DEV/QA/Prod zonal information
##The following zone information must always be at the top
##of this site.pp config file. The first thing to be sourced has
##to be the zonal info. 
import "zones/*.pp"
import "roles/*.pp"
import "nodes/*.pp"
import "datacenter/*.pp"

node default {
	notice ("importing common module")
	include common
}#end of default node definition
