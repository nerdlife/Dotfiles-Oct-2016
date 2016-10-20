###########################
# CUSTOM SCRIPTS
###########################

# Quick git add+commit+push
function gpush() {
    git add .
    git commit -a -m "$1"
    git push
}

# open in ST3
function s() {
    if [ $# -eq 0 ]; then
        subl .;
    else
        subl "$@";
    fi;
}

# open current w default
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

# cd auto ls
alias ll='ls -p'  
cd() { builtin cd "$@"; ll; }  

# auto cd into new directory
function mkd() {
    mkdir -p "$@" && cd "$_";
}



###########################
# CUSTOM ALIAS
###########################

# terminal misc
alias c="clear"
alias desk="cd ~/Desktop"
alias profile="source ~/.bash_profile"
alias note="cd ~/Desktop/Skeleton/02_Work/00_Notes; subl ."
alias work="cd ~/Desktop/Skeleton/02_Work/01_Projects/"

# navigating directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."


# osx 
alias f='open -a Finder ./'
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# bundler
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias bl='bundle list'

# Git
alias gpo='git pull origin master'
alias gb='git branch -v'
alias ga="git add ."
alias gc="git commit -a -m "$1""
alias gp="git push"
alias gs="git status"
alias gm="git merge"

#Rails
alias rakeall="rake db:drop db:create db:migrate db:seed"
alias rr="rails s"

# Meteor
alias mr="meteor reset"
alias m="meteor"
alias book="cd ~/Desktop/Skeleton/02_Work/00_Notes/zMeteorNotes; subl . ; cd ~/Desktop/Skeleton/02_Work/01_Projects/Ryannit; subl . ; open ~/Desktop/DiscoverMeteor.pdf "


# my username will render before the rest of the command is executed
echo "Logged in as NerdLife.IO"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Path for RVM
test -d "$HOME/.rvm/bin" && PATH="$PATH:$HOME/.rvm/bin"

# Rbenv autocomplete and shims
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# Path for RBENV
test -d "$HOME/.rbenv/" && PATH="$HOME/.rbenv/bin:$PATH"

# Path for brew
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Path for Heroku
test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# colored prompt
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# clean git color to green
c_git_clean='\[\e[0;32m\]'
# dirty git color to red
c_git_dirty='\[\e[0;31m\]'

# prompt variable
PROMPT_COMMAND=$PROMPT_COMMAND' PS1="${c_path}\W${c_reset}$(git_prompt) => "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]=> '

# git branch clean or dirty
git_prompt ()
{
  # git directory?
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # git branch name
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'
export PATH=/usr/local/bin:$PATH



