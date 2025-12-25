# Custom theme based on af-magic with better color separation
# Original: https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/af-magic.zsh-theme

# Dashed separator
afmagic_dashes() {
  local PYTHON_ENV='[PYENV]'
  local PYTHON_ENV_CHAR_NUM=$#PYTHON_ENV
  local PYTHON_ENV_LENGTH=$((PYTHON_ENV_CHAR_NUM + 1))

  local VENV_CHAR_NUM
  local VENV_LENGTH

  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    VENV_CHAR_NUM=$#CONDA_DEFAULT_ENV
    VENV_LENGTH=$((VENV_CHAR_NUM + 3))
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    VENV_CHAR_NUM=$#VIRTUAL_ENV
    VENV_LENGTH=$((VENV_CHAR_NUM + 3))
  else
    VENV_LENGTH=0
  fi

  local TERMWIDTH=$(( COLUMNS - PYTHON_ENV_LENGTH - VENV_LENGTH ))
  local FILL=${(l:TERMWIDTH::―:)}
  echo $FILL
}

# Primary prompt - directory in green, git branch in yellow
PROMPT='${FG[237]}―${(l.$(afmagic_dashes)..―.)}%{$reset_color%}
${FG[040]}%~%{$reset_color%} $(git_prompt_info)$(hg_prompt_info)${FG[105]}%(!.#.»)%{$reset_color%} '

# Right prompt
PROMPT_RIGHT="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
if [[ $CONDA_DEFAULT_ENV ]]; then
  PROMPT_RIGHT="($CONDA_DEFAULT_ENV) $PROMPT_RIGHT"
elif [[ $VIRTUAL_ENV ]]; then
  PROMPT_RIGHT="($VIRTUAL_ENV:t) $PROMPT_RIGHT"
fi
PROMPT_RIGHT="$PROMPT_RIGHT %{$FG[237]%}%n@%m%{$reset_color%}"
RPS1=$PROMPT_RIGHT

# Git configuration - yellow branch with clear separators
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[245]%}[%{$FG[226]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[245]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Mercurial configuration
ZSH_THEME_HG_PROMPT_PREFIX="%{$FG[245]%}[%{$FG[226]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$FG[245]%}]%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$FG[202]%}*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN=""
