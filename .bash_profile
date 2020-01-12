
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

export PATH=~/Library/Python/3.7/bin:$PATH

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
eval "$(rbenv init -)"
