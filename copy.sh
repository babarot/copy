#!/bin/bash

get_filter()
{
    local x candidates

    if [[ -z $1 ]]; then
        return 1
    fi

    # candidates should be list like "a:b:c" concatenated by a colon
    candidates="$1:"

    while [[ -n $candidates ]]
    do
        # the first remaining entry
        x=${candidates%%:*}
        # reset candidates
        candidates=${candidates#*:}

        # check if x is __enhancd::utils::filter
        if type "${x%% *}" &>/dev/null; then
            echo "$x"
            return 0
        else
            continue
        fi
    done

    return 1
}

stdin="$(cat <&0)"
lines=$(echo "$stdin" | grep -c '')

case $lines in
    0)
        echo "stdin: No input" >&2
        exit 1
        ;;
    1)
        printf "$stdin" | pbcopy
        ;;
    *)
        filter="$(get_filter "${F:-"fzy:fzf-tmux:fzf:peco:percol:zaw"}")"
        if [[ -z $filter ]]; then
            echo "No available filter command (fzf, peco, ...)" >&2
            exit 1
        fi
        selected="$(echo "$stdin" | eval "$filter")"
        printf "$selected" | pbcopy
        ;;
esac
