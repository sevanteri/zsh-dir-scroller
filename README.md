# zsh-dir-scroller
Directory stack scroller for ZSH

## Install
Install with your favorite plugin manager. Or manually if that's your cup of
tea.

    zplug "sevanteri/zsh-dir-scroller"

## Configuration
Add key bindings to your liking. Here's a couple of examples:

    # alt + left arrow and alt + right arrow
    bindkey "^[[1;3D" _dir_scroller_prev
    bindkey "^[[1;3C" _dir_scroller_next

    # or for vi command mode
    bindkey -M vicmd 'H' _dir_scroller_prev
    bindkey -M vicmd 'L' _dir_scroller_next

If `zle`'s `reset-prompt` is not enough, list prompt redraw functions the
following way:

    export DIR_SCROLLER_RESETS=(prompt_pure_preprompt_render some_other_reset_func)
