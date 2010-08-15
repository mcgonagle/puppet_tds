class ganglia::client inherits ganglia {


ganglia_config_def{"gmond":
			template_name   => "gmond.conf",
                        require         => Package[ganglia-gmond], 
                        before          => Service[gmond],
                        notify          => Service[gmond],
			}

}#end of ganglia client

