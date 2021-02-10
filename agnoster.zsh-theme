# vim:et sts=2 sw=2 ft=zsh
#
# A Zim version of Agnoster, a Powerline-inspired theme for Zsh.
#
# This theme requires a [patched Powerline
# font](https://github.com/powerline/fonts). In addition, it looks better with
# the [Solarized theme](https://github.com/altercation/solarized/).
#
# Based on the [original theme](https://github.com/agnoster/agnoster-zsh-theme),
# on the [Oh My Zsh version of
# Agnoster](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/agnoster.zsh-theme),
# and on the [Powerlevel9k theme](https://github.com/bhilburn/powerlevel9k).
#
# Uses the 'git-info' Zim module.
#

prompt_agnoster_main() {
  # This runs in a subshell
  RETVAL=${?}
  CURRENT_BG=''

  prompt_agnoster_status
  prompt_agnoster_pwd
  prompt_agnoster_git
  prompt_agnoster_end
}

prompt_agnoster_segment() {
  print -n "%K{${1}}"
  if [[ -n ${CURRENT_BG} ]] print -n "%F{${CURRENT_BG}}"
  print -n "${2}"
  CURRENT_BG=${1}
}

prompt_agnoster_standout_segment() {
  print -n "%S%F{${1}}"
  if [[ -n ${CURRENT_BG} ]] print -n "%K{${CURRENT_BG}}%k"
  print -n "${2}%s"
  CURRENT_BG=${1}
}

prompt_agnoster_end() {
  print -n "%k%F{${CURRENT_BG}}%f "
}

prompt_agnoster_status() {
  local segment=''
  if (( RETVAL )) segment+=" %F{red}${RETVAL}"
  if (( EUID == 0 )) segment+=' %F{yellow}⚡'
  if (( $(jobs -l | wc -l) )) segment+=' %F{cyan}⚙'
  if [[ -n ${VIRTUAL_ENV} ]] segment+=" %F{cyan}${VIRTUAL_ENV:t}"
  if [[ -n ${SSH_TTY} ]] segment+=" %F{%(!.yellow.default)}%n@%m"
  if [[ -n ${segment} ]]; then
    prompt_agnoster_segment black "${segment} "
  fi
}

prompt_agnoster_pwd() {
  prompt_agnoster_standout_segment blue ' %~ '
}

prompt_agnoster_git() {
  if [[ -n ${git_info} ]]; then
    prompt_agnoster_standout_segment ${git_info[color]} " ${(e)git_info[prompt]} "
  fi
}

VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info:branch' format ' %b'
  zstyle ':zim:git-info:commit' format '➦ %c'
  zstyle ':zim:git-info:ahead' format ' ↑%A'
  zstyle ':zim:git-info:behind' format ' ↓%B'
  zstyle ':zim:git-info:stashed' format ' ⍟%S'
  zstyle ':zim:git-info:indexed' format ' ✚'
  zstyle ':zim:git-info:unindexed' format ' ●'
  zstyle ':zim:git-info:action' format '  %s'
  zstyle ':zim:git-info:clean' format 'green'
  zstyle ':zim:git-info:dirty' format 'yellow'
  zstyle ':zim:git-info:keys' format \
      'prompt' '%b%c%A%B%S%i%I%s' \
      'color' '%C%D'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PS1='$(prompt_agnoster_main)'
unset RPS1
