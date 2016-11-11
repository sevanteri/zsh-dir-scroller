function _dir_scroller_append {
    _dir_scroller_popped=()
}
add-zsh-hook chpwd _dir_scroller_append

function _dir_scroller_reset_prompt {
    if zle; then
        zle reset-prompt
        for f in $DIR_SCROLLER_RESETS; $f
    fi
}

function _dir_scroller_prev {
    local stack=($(dirs))
    (( $#stack == 1 )) && return

    _dir_scroller_popped=( $(pwd) $_dir_scroller_popped )
    popd -q
    _dir_scroller_reset_prompt
}

function _dir_scroller_next {
    local saved="$_dir_scroller_popped[1]"
    [[ -z $saved ]] && return

    pushd -q $saved
    shift _dir_scroller_popped
    _dir_scroller_reset_prompt
}

_dir_scroller_popped=()

zle -N _dir_scroller_prev
zle -N _dir_scroller_next

bindkey -M vicmd 'H' _dir_scroller_prev
bindkey -M vicmd 'L' _dir_scroller_next

export DIR_SCROLLER_RESETS=(prompt_pure_preprompt_render)
