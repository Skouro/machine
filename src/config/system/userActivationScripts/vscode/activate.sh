echo 'settings vscode...'

# Create --user-data-dir
rm -rf /home/vscode/data
mkdir -p /home/vscode/data/User
echo "${argSettings}" > /home/vscode/data/User/settings.json
echo "${argsKeyBindings}" > /home/vscode/data/User/keybindings.json

# Create --extensions-dir
if ! test -e /home/vscode/extensions; then
  mkdir -p /home/vscode/extensions
fi
cp -L --no-preserve=mode -R "${argExtensions}/share/vscode/extensions/"* /home/vscode/extensions
