if status is-interactive
    # Commands to run in interactive sessions can go here
    export PATH=$PATH:/home/stroky/.pyenv/shims:/home/stroky/bin:/usr/local/bin:/home/stroky/bin:/usr/local/bin:/home/stroky/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/opt/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/home/stroky/.dotnet/tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin:/var/lib/snapd/snap/bin:/home/stroky/.local/bin/:/home/stroky/.local/bin/:/home/stroky/go/bin
    export FZF_DEFAULT_OPTS="--preview-window right:60%:wrap" #fzf --preview 'cat {}'
    export GOPATH="/home/stroky/go/bin/"
    source ~/.config/fish/functions/custom.fish
    bind "^X" cpbuffer
    # set fish_cursor_default line
    # set fish_cursor_insert line
    # set fish_cursor_default block
    # # Set the insert mode cursor to a line
    # set fish_cursor_insert line
    # # Set the replace mode cursor to an underscore
    # set fish_cursor_replace_one underscore
    # # The following variable can be used to configure cursor shape in
    # # visual mode, but due to fish_cursor_default, is redundant here
    # set fish_cursor_visual block
end

function fish_greeting
    pfetch 
end

function fish_prompt -d "Write out the prompt"
    printf '  %s%s%s ❯ %s' (set_color normal) (prompt_pwd) (set_color $fish_color_cwd) (set_color brgreen)
end

#source ~/.config/fish/conf.d/transient.fish

