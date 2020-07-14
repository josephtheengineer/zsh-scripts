echo "" > /etc/zsh/vars.sh

echo "export PLAN9=$(find /nix/store -name plan9 | head -1)" >> /etc/zsh/vars.sh
