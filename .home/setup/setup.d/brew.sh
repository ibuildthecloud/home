if [ ! -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

/home/linuxbrew/.linuxbrew/bin/brew bundle --file $HOME/.home/Brewfile install
