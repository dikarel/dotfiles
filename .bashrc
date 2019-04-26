# Secret keys
. ~/.bash_secrets

# More informative prompt
export GIT_RADAR_FORMAT="(%{branch}) "
export PS1="\w: "
export PS1="\$(git-radar --bash --fetch)$PS1"

# Software installations
export PATH="/Users/dikarel/Library/Android/sdk/platform-tools:$PATH"
export PATH="/Users/dikarel/Library/Android/sdk/tools/bin:$PATH"
export PATH="/Users/dikarel/Library/Android/sdk/tools:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Replace default tools with better ones
alias git=hub
alias ls=exa

# Enable tools
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
eval "$(fasd --init auto)"
_fasd_bash_hook_cmd_complete v
eval "$(pyenv init -)"
eval "$(rbenv init -)"

# Fun stuff
alias weather='curl http://wttr.in?m'
alias star-wars="telnet towel.blinkenlights.nl"

# Very short aliases
alias g='git'
alias a='git add'
alias l='ls'
alias la='ls -a'
alias c='clear'
alias d='git diff'
alias ds='git diff --staged'
alias dt='git difftool'
alias dts='git difftool --staged'
alias h='git push'
alias m='git commit'
alias n='source venv/bin/activate'
alias o='git checkout'
alias ob='git checkout -b'
alias om='git checkout master && git pull'
alias p='git pull'
alias s='git status'
alias v="fasd -e vim -b viminfo"
alias w='find backend | entr bash -c "clear; echo; git status -sb; echo; hr; echo; git delta | grep py | xargs flake8 && git delta | grep py | xargs isort && echo No lint issues | figlet"'
alias x='exit'
alias y='yarn'
alias yd='yarn django'
alias ys='yarn shell'
alias ym='yarn migrate'
alias b="brew"
alias bi="brew install"
alias ?='howdoi'
alias bs='brew search'

ptest() {
  # Sample usage: ptest GigBizFeedbackFormTests
  # Requires code search tool "rg" (brew install rg)

  if [ -z "$1" ]; then
    >&2 echo 'ptest - Simple Python test runner'
    >&2 echo 'Usage: ptest <test class name>'
    >&2 echo 'e.g. "ptest GigBizFeedbackForm" or "ptest GigBizFeedbackFormTests"'
    return 1
  fi

  # Locate the test file that contains our test class
  local test_file=`rg -l "$1" -tpy | grep 'test/'`

  # Maybe the user forgot to add "Tests" at the end of their class name?
  if [ -z "$test_file" ]; then
    test_file=`rg -l "$1Tests" -tpy | grep 'test/'`
  fi

  if [ -z "$test_file" ]; then
    echo "Cannot locate $1"
    return 1
  else
    # Don't print boring debug info
    pytest "$test_file::$1" -n0 --quiet --failed-first $2 $3 $4
  fi
}

# These would be nice, but cause the terminal to become noticeably slow
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# eval "$(pyenv virtualenv-init -)"
