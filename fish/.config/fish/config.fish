set -gx EDITOR nvim
set -gx VISUAL nvim
set -g fish_greeting
alias e="nvim"
alias vim="nvim"
alias get_idf=". $HOME/projects/esp/esp-idf/export.fish"
keychain --eval --quiet ~/security/ssh/git_ed25519 | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end
