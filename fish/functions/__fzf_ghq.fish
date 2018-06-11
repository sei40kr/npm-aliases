# __fzf_ghq.fish
# author: Seong Yong-ju <sei40kr@gmail.com>

function __fzf_ghq
    if not type -q ghq
        echo 'ERROR: ghq is not installed.' >&2
        return 1
    end

    if not type -q fzf
        echo 'ERROR: fzf is not installed.' >&2
        return 1
    end

    ghq list | eval (__fzfcmd) $FZF_DEFAULT_OPTS | read ghq_repo
    and commandline -- cd\ (ghq root)/{$ghq_repo}
    and commandline -f execute
    commandline -f repaint
end
