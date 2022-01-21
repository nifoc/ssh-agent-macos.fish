if test -z "$SSH_ENV"
    set -gx SSH_ENV "$HOME/.ssh/environment"
end

if test -f "$SSH_ENV"; and test -z "$SSH_AGENT_PID"
    # Source existing $SSH_ENV
    source "$SSH_ENV" >/dev/null

    if test -z "$SSH_AGENT_PID"; or not pgrep "$SSH_AGENT_PID" >/dev/null
        # Something is wrong with $SSH_ENV, let's restart ssh-agent
        __ssh_agent_start
    end
else
    # Start ssh-agent for the first time
    __ssh_agent_start
end
