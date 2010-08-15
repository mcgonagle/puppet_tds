class scribe::syslog inherits scribe {

$sysloggroup = "SCRIBE"
include syslog


scribe_config_template{"scribed":
			template_name   => "scribed_client_conf.erb",
			self_port 	=> "1463",
			next_host      => "scribevip.athenahealth.com",
			next_host_port => "1463",
			}


}#end of scribe::syslog class
