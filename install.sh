DOTPATH = ~/dotfiles

if has "git"; then
	git clone --recursive "https://github.com/dghnts/dotfiles.git" "$DOTPATH"
for file in .??*
do 
	["$file" = ".git"] && continue
	
	ln -snvf "$DOTPATH/$file" "$HOME"/"$file" 
