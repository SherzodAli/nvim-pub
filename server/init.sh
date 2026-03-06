#/usr/bin/env bash
sudo apt update
sudo apt install -y zsh git curl unzip build-essential ripgrep fd-find fzf xclip wl-clipboard fonts-noto-color-emoji neovim

command -v fd >/dev/null 2>&1 || sudo ln -s "$(command -v fdfind)" /usr/local/bin/fd

chsh -s "$(which zsh)"
export RUNZSH=no CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/joshskidmore/zsh-fzf-history-search "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search"

sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-fzf-history-search)/' ~/.zshrc
sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="crcandy"/' ~/.zshrc

touch ~/.zsh_history
[ -f ~/.bash_history ] && awk '{print ": " strftime("%s") ":0;" $0}' ~/.bash_history >> ~/.zsh_history

mkdir -p "$HOME/.config"
[ -d "$HOME/.config/nvim" ] && mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)"
git clone https://github.com/SherzodAli/nvim-pub "$HOME/.config/nvim"

nvim --headless "+Lazy! sync" +qa || true

exec zsh
