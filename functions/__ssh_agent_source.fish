function __ssh_agent_source -d "source ssh-agent environment"
    # Source existing $SSH_ENV
    source "$SSH_ENV" >/dev/null

    if test -z "$SSH_AGENT_PID"; or not ps -p "$SSH_AGENT_PID" -o 'pid=' >/dev/null 2>&1
        # Something is wrong with $SSH_ENV, let's restart ssh-agent
        __ssh_agent_start
    end
end
