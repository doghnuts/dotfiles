Dotfiles=~/dotifiles 

if type grep > /dev/null 2>&1; then
    echo "exist!"     #コマンドが存在する時の処理
else
    echo "NOT exist!" #コマンドが存在しないときの処理
fi

echo $Dotfiles
