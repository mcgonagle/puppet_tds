##############################################################################
# This file is mananged by puppet.  Do NOT edit on the server, your changes  #
# will be blown away on the next puppet run.                                 #
##############################################################################
# /etc/profile.d/java.sh

# System wide environment and startup programs, for login setup
# Functions and aliases go in /etc/bashrc

pathmunge () {
        if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH=$PATH:$1
           else
              PATH=$1:$PATH
           fi
        fi
}

pathmunge /usr/java/latest/bin

JAVA_HOME=/usr/java/latest
export JAVA_HOME
