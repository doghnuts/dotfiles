if [ ! -e ~/dotfiles ]; then
	mkdir ~/dotfiles

DOTPAH="dotfiles"
fi

if type git > /dev/null 2>&1; then
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

cd "$HOME"/$DOTPAH

# 移動できたらリンクを実行する
for file in .??*
do 
	["$file" = ".git"] && continue
	
	ln -snvf "$DOTPATH/$file" "$HOME"/"$file" 
done
