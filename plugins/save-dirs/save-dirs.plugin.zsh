# Directory save and restore
# (original source: http://www.macosxhints.com/article.php?story=20020716005123797)
#
# This plugin gives you two new commands (save & show) that can be used for saving
# and restoring frequently used directories.
# You can save a directory using an abbreviation of your choosing. Eg. "save ms"
# You can subsequently move to one of the saved directories by using cd with
# the abbreviation you chose. Eg. "cd ms"  (Note that no '$' is necessary.)
#
# The saved directories are stored in the simple file ~/.dirs, that you can also
# edit manually (e.g. to change or delete existing entries)
#
# You can also use the abreviations in other commands like "cp" or "mv", however
# you then have to use the '$' prefix to dereference the shortcuts, e.g.
# % cp file $acme

if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
  touch ~/.dirs
fi

# initialization for the 'save' facility: source the .dirs file
source ~/.dirs

alias show='cat ~/.dirs'

save () {
  command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs
  source ~/.dirs
}

# enable the zsh option that make the '$' prefix not required when using the above facility
setopt cdablevars