#! /bin/bash

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.adb/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=AxExBxDxBxegedabagacad

# export PS1="ಠ_ಠ [\D{%b, %d} \@] \u: \w $ "
export PS1="ಠ_ಠ [\u]: \w $ "

for script in /etc/profile.d/*.sh ; do
        if [ -r $script ] ; then
                . $script
        fi
done

if [ -f $(brew --prefix)/etc/grc.bashrc ]; then
  . $(brew --prefix)/etc/grc.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [[ $# -eq 0 ]]
then
{

# Define Variable greeting
greeting=("Greetings Kia... " "Welcome Kia... ")

# Define Variable index
index=$(( RANDOM % ${#greeting[@]} ))
echo ${greeting[${index}]}

# Define Variable tecreset
tecreset=$(tput sgr0)

# Check Logged In Users
who>/tmp/who
echo -e "Logged In users:" $tecreset && cat /tmp/who

# Check hostname
echo -e "Hostname:"$tecreset $HOSTNAME

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e "Internet:$tecreset Connected" || echo -e "Internet:$tecreset Disconnected"

# Check Internal IP - Wired
internalip=$(ipconfig getifaddr en1 || echo none)
echo -e "Internal IP (wired):"$tecreset $internalip

# Check Internal IP - Wifi
internalipwifi=$(ipconfig getifaddr en0 || echo none)
echo -e "Internal IP (wifi):"$tecreset $internalipwifi

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e "External IP: $tecreset"$externalip

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e "System Uptime Days:" $tecreset $tecuptime

# Unset Variables
unset greeting index tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

}
fi
shift $(($OPTIND -1))
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=$PATH:~/.nexustools
PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
