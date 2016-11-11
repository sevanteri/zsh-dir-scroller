# zsh-dir-scroller
Directory stack scroller for ZSH

# Install

Install with your favorite plugin manager. Or manually if that's your cup of
tea.

    zplug "sevanteri/zsh-dir-scroller"


# Configuration

Add key bindings

    bindkey -M vicmd 'H' _dir_scroller_prev
    bindkey -M vicmd 'L' _dir_scroller_next

If `zle`'s `reset-prompt` is not enough, list prompt redraw functions the
following way:

    export DIR_SCROLLER_RESETS=(prompt_pure_preprompt_render some_other_reset)
