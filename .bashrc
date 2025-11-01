# auto-start ssh-agent & add key in WSL
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)" >/dev/null
fi
if ! ssh-add -l | grep -q id_ed25519; then
  ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
fi
