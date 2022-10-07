apt-get install curl git mercurial make binutils bison gcc build-essential
git clone https://github.com/udhos/update-golang
cd update-golang
PROFILED=~/.zshrc ./update-golang.sh
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)