set -gx EDITOR nvim
set -gx VISUAL nvim
set -g fish_greeting
alias e="nvim"
alias vim="nvim"
alias view="nvim -R"
alias get_idf=". $HOME/projects/esp/esp-idf55/export.fish"
#keychain --eval ~/.ssh/id_ed25519 | source
if status is-interactive
    # Commands to run in interactive sessions can go here
	if not set -q SSH_AUTH_SOCK
		eval (ssh-agent -c)
	end
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
end
