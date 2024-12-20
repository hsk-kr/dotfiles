# HSK Dev Setup

OS: MacOS

## Tools

|Tool Name|Usage|url|
|---|---|---|
|WezTerm|Terminal Emulator|https://wezfurlong.org/wezterm/index.html|
|Neovim|Code Editor|https://neovim.io/|
|Snipaste|Capturing Tool|https://www.snipaste.com/index.html|
|Aerospace|Window Tile Manager|https://github.com/nikitabobko/AeroSpace|
|Shortcat|Manipulate Mac Without Mouse|https://shortcat.app/|
|Homerow|Click and Scroll Mac Without Mouse|https://www.homerow.app/|
|zsh-vi-mode|brew install zsh-vi-mode|https://github.com/jeffreytse/zsh-vi-mode|
|fzf|interactive filter program|https://github.com/junegunn/fzf

## .zshrc

```
# prompt custom
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
# About the prefixed `$`: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_03.html#:~:text=Words%20in%20the%20form%20%22%24',by%20the%20ANSI%2DC%20standard.
NEWLINE=$'\n'
# Set zsh option for prompt substitution
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n@%M ${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '
```
