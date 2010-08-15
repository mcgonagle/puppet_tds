# Class: ant::disableboot
#
# This class disables ant startup at boot time but doesn't check if the service is running
# Useful when the service is started but another applications (such as a Cluster suite)
#
# Usage:
# include ant::disableboot
#
class ant::disableboot inherits ant {
    Service["ant"] {
        enable => "false",
    }
}
