# Class: java::disableboot
#
# This class disables java startup at boot time but doesn't check if the service is running
# Useful when the service is started but another applications (such as a Cluster suite)
#
# Usage:
# include java::disableboot
#
class java::disableboot inherits java {
    Service["java"] {
        enable => "false",
    }
}
