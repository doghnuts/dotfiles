DOTPATH=~/github/dotfiles

if [ ! -e "$DOTPATH" ]; then
	mkdir "$DOTPATH"
fi

if [ ! -e "$HOME/github" ]; then
	if type git > /dev/null 2>&1 ; then
		git clone --recursive "https://github.com/dghnts/dotfiles.git" "$DOTPATH"
	elif type curl > /dev/null 2>&1 || type wget > /dev/null 2>&1; then
		tarball="https://github.com/dghnts/dotfiles/archive/main.tar.gz"
		
		# どっちかでダウンロードして，tar に流す
		if type curl > /dev/null 2>&1; then
			curl -L "$tarball"
		
		elif type wget > /dev/null/ 2>&1; then
			wget -O - "$tarball"
	
		fi | tar zxv
		
		# 解凍したら，DOTPATH に置く
    		mv dotfiles-main $DOTPATH
	else
		exit "curl or wget required"
	fi
fi

cd "$DOTPATH"

echo $PWD
# 移動できたらリンクを実行する
for file in .*
do 
	if [ "$file" = ".git" ] || [ "$file" = ".gitignore" ] || [ "$file" = "." ] || [ "$file" = ".." ]; then
		continue
	else
		echo $file
	ln -snvf "$DOTPATH/$file" "$HOME"/"$file" 
	fi
done
