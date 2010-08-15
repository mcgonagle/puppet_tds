class scribe::webclient inherits scribe {


scribe_config_template{"scribed":
			template_name   => "scribed_client_conf.erb",
			self_port 	=> "1463",
			next_host      => "scribemid.athenahealth.com",
			next_host_port => "1463",
			}


	file{"/etc/httpd/conf.d/scribe_logging.conf":
                source => "puppet://$servername/scribe/scribe_logging.conf",
                owner  => "root",
                group  => "root",
                mode   => 0644,
        }

 	service { "httpd":
    	        enable    => true,
       		ensure    => running,
          	subscribe => File["/etc/httpd/conf.d/scribe_logging.conf"],
	}

}



