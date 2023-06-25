# 
/bin/sh

######################################### ENVIRONMENTS

NEOVIM_VERSION="v0.9.0"

######################################### CLEANING

SYSTEM_MACHINE=''
SYSTEM_OS="$(uname)"

######################################### CASES

case $SYSTEM_OS in
'Linux')
	SYSTEM_MACHINE='nvim-linux64'
	FILE='nvim-linux64'
	;;
'Darwin')
	SYSTEM_MACHINE='nvim-macos'
	FILE="nvim-macos"
	;;
*) ;;
esac

######################################### INSTALL

function installNeovim() {
	echo "🧑🏽‍💻 INSTALLING NEOVIM"
	URL="https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/${SYSTEM_MACHINE}.tar.gz"
	echo $URL
	curl -LO $URL
	tar xzvf ${SYSTEM_MACHINE}.tar.gz >/dev/null 2>&1
	rm -rf ${SYSTEM_MACHINE}.tar.gz 
	mv ./${FILE} ${HOME}/${FILE}
	ln -sf ${HOME}/${FILE}/bin/nvim /usr/local/bin/nvim
}

######################################### REMOVE NVIM

function removeInstalledNvim() {
	echo "❌ REMOVING NVIM"
	rm -rf ${HOME}/nvim-macos ${HOME}/nvim.appimage /usr/local/Cellar/nvim /usr/local/bin/nvim ${HOME}/.cache/nvim ${HOME}/.cache/nvim ${HOME}/.local/share/nvim /usr/local/share/lua /usr/local/Cellar/luajit-openresty /usr/local/share/luajit-2.1.0-beta3 /usr/local/lib/lua
}

######################################### INSTALL NVIM FOLDER

removeInstalledNvim
installNeovim

echo ""

######################################### END

echo "########.####.##....##.####..######..##.....##.########.########."
echo "##........##..###...##..##..##....##.##.....##.##.......##.....##"
echo "##........##..####..##..##..##.......##.....##.##.......##.....##"
echo "######....##..##.##.##..##...######..#########.######...##.....##"
echo "##........##..##..####..##........##.##.....##.##.......##.....##"
echo "##........##..##...###..##..##....##.##.....##.##.......##.....##"
echo "##.......####.##....##.####..######..##.....##.########.########."

echo ""
echo ""
