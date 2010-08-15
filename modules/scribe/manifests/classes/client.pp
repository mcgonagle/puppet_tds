class scribe::client inherits scribe {


  scribe::scribe_config_template{"scribed_client":
                                scribe_categories      => [
                                  "default:test-vm.buydomains.com",
                                ],
       				require => [ Package['facebook-scribe'], Package['perl-Log-Dispatch-Scribe'], File['scribed-init']],
				before => [ Service['scribed']],
                        }
}

