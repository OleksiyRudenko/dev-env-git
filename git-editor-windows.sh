echo You need to uncomment and edit a set of instructions corresponding to the editor of your choice.
echo Check README.md for details.
#
# === Windows and git for Windows
#git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin '$*'"
#
#git config --global core.editor "'C:/Program Files/emacs/bin/emacsclient.exe'"
#
#git config --global core.editor "'~/AppData/Local/Programs/Microsoft VS Code/code.exe' --wait"
#
#git config --global core.editor "'C:/Program Files (x86)/sublime text 3/subl.exe' -w"
#
# === Linux/MacOS
#git config --global core.editor "nano"
#
# === WSL (Windows Subsystem Linux). Requires Windows version of VS Code installed. Replace USERNAME as appropriate.
#echo "alias vscode='/mnt/c/Users/USERNAME/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe'" >> $HOME/.bash_profile
#git config --global core.editr "vscode --wait"
#
git config --global -e
