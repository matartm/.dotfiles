set -gx EDITOR nvim
set -gx VISUAL nvim
set -g fish_greeting
alias e="nvim"
if status is-interactive
    # Commands to run in interactive sessions can go here
end
