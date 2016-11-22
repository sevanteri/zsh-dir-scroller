# zsh-dir-scroller
Directory stack scroller for ZSH

[![asciicast](https://asciinema.org/a/92387.png)](https://asciinema.org/a/92387)


## How it works?

It uses the ZSH's own directory stack functions `pushd` and `popd`.

When you use `_dir_scroller_prev` your current directory (top off the ZSH's stack)
is `popd` into another stack, created by the plugin.
When you use `_dir_scroller_next`, the directory from the top of the plugin's
stack is `pushd` into ZSH's stack.

When you `cd` to another directory, the plugin's stack is emptied.

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
