set -gx EDITOR nvim
set -gx VISUAL nvim
set -g fish_greeting
alias e="nvim"
alias vim="nvim"
alias view="nvim -R"
alias mountshare="sudo mount -t cifs //10.6.4.242/stuff ~/shareStuff/ -o username=matthias,password=\"qXPMy4w&\""

#alias get_idf=". $HOME/projects/esp/esp-idf55/export.fish"
keychain --eval --quiet ~/security/ssh/git_ed25519 | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end

function get_idf
	set -l ver 55
	if test (count $argv) -ge 1
		set ver $argv[1]
	end
	set -gx IDF_PATH $HOME/projects/esp/esp-idf$ver
	set -gx IDF_TOOLS_PATH $HOME/.espressif/v$ver
	source "$HOME/projects/esp/esp-idf$ver/export.fish"
end
