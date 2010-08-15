# Class: glassfish::disableboot
#
# This class disables glassfish startup at boot time but doesn't check if the service is running
# Useful when the service is started but another applications (such as a Cluster suite)
#
# Usage:
# include glassfish::disableboot
#
class glassfish::disableboot inherits glassfish {
    Service["glassfish"] {
        enable => "false",
    }
}
