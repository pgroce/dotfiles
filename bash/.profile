export PROFILE_READ="YES"

if [ "$BASHRC_READ" != "YES" ]; then
    . ~/.bashrc
fi

. ~/.bash_functions

export HISTCONTROL=ignorespace

export PS1='[\t|\!]\n\h:\w\n$ '

#######
# Paths
#######

# PATH
path -f $HOME/bin /usr/local/bin /usr/local/sbin

# PYTHONPATH
path -p PYTHONPATH ~/lib/python

# Java CLASSPATH (thank God it takes wildcards now)
# path -p CLASSPATH -f $HOME/lib/java/jars/\*
# path -p CLASSPATH $HOME/lib/java/lib

. .profile_custom
