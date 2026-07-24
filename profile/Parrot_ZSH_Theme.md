# Parrot ZSH Theme in Termux

+ Install *Oh My ZSH* from [ohmyz.sh](https://ohmyz.sh/)

+ Install *Parrot ZSH* from [trabdlkarim/parrot-zsh-theme](https://github.com/trabdlkarim/parrot-zsh-theme)

  1. Clone the repository

  1. Change to the git folder
  
  1. Create a **soft link** to `parrot.zsh-theme` in `~/.oh-my-zsh/custom/themes/`

      ```console
      foo@bar:~$ ln -s parrot.zsh-theme ~/.oh-my-zsh/custom/themes/parrot.zsh-theme
      ```

  1. Add the line `ZSH_THEME="parrot"` in `~/.zshrc` file.
  
      + Follow this [file](https://github.com/JustABeginning/config/blob/master/profile/termux/.zshrc)
        for more clarity

  1. Restart Termux
