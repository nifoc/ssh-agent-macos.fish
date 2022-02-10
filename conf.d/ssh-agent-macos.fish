if test -z "$SSH_ENV"
    set -gx SSH_ENV "$HOME/.ssh/environment"
end

if not test -e "$SSH_ENV"
    # Environment file does not exist at all
    __ssh_agent_start
else if test -e "$SSH_ENV"; and test -z "$SSH_AGENT_PID"
    # Environment file exists but $SSH_AGENT_PID is not set
    __ssh_agent_source
else if not ps -p "$SSH_AGENT_PID" -o 'comm=' | grep -i ssh-agent >/dev/null 2>&1
    # The process that $SSH_AGENT_PID references is not alive
    __ssh_agent_start
end
