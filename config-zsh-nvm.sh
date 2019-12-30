# Config ZSH & Install NVM for ZSH

# Set default shell manually
echo "bash -c zsh" >>"$HOME/.bashrc"

# Oh My ZSH plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ZSH_PLUGINS="(git zsh-autosuggestions zsh-syntax-highlighting)"
ZSH_THEME="\"bira\""

sed -i -e "s/\(ZSH_THEME=\).*/\1$ZSH_THEME/" \
  -e "s/\(plugins=\).*/\1$ZSH_PLUGINS/" ~/.zshrc

# NVM install
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

cat "./data/nvm-config" >>"$HOME/.zshrc"

# Finish
unset -f source ~/.zshrc
