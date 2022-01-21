function __ssh_agent_start -d "starts a new instance of the ssh-agent"
    # Start the ssh-agent
    ssh-agent -c | sed 's/^echo/#echo/' >"$SSH_ENV"
    chmod 600 "$SSH_ENV"
    source "$SSH_ENV" >/dev/null

    # Load keys from macOS Keychain
    ssh-add --apple-load-keychain 2>/dev/null
end
