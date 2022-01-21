function __ssh_agent_source -d "source ssh-agent environment"
    # Source existing $SSH_ENV
    source "$SSH_ENV" >/dev/null

    if test -z "$SSH_AGENT_PID"; or not pgrep "$SSH_AGENT_PID" >/dev/null
        # Something is wrong with $SSH_ENV, let's restart ssh-agent
        __ssh_agent_start
    end
end
