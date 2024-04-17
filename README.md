# Mac Terminal Setup Guide

## Starting Installs

### Basic Command Line Tooling

To support much of the tooling we are going to be using the first thing we need to do is run the following command to begin setting stuff up.

```bash
xcode-select --install
```

### Brew

Start by installing Homebrew if it is not installed yet. It is the essential Mac package manager (like apt for debian or pacman for arch).

You can check if it is already installed by running `which brew`.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After the install you should run the following command to make sure everything is up to date and working.

```bash
brew update && brew upgrade
```

### Fonts

These are important for rendering some of the icons included in the terminal for features you may like.

You will need a "nerd font" for unicode characters I recommend MesloLGS NF which you can download with the command below.

```bash
curl -L -o ~/Downloads/meslonf.ttf https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf
```

I would also recommend a nice ASCII font such as [Fira Code](https://fonts.google.com/specimen/Fira+Code) but it is not required.
If you choose to install this just unzip the package and look for the the `FiraCode-VariableFont_wght.ttf` file.
If you don't like either of these options you should be able find something you like from nerdfonts.com.

Once you have these downloaded you should just be able to double click the font to install it to your system.

### iTerm2

The last basic install is iTerm2. This is a terminal emulator which will give you better terminal performance.
It is open source and comes with a variety of safety features so you can rest assured it is completely secure.

You can install it easily with homebrew.

```bash
brew install --cask iterm2
```

The `--cask` flag is used to install GUI applications.

## Adding Some Style

### Font

Now we can finally open iTerm2 and reap the rewards.
When you open it you will be greeted to your regular mac terminal... but this is very easy to change.

The first change we are going to make is to click on "iTerm2 > Settings..." in your navigation bar.
From here click the "Profiles" tab and then the "Text" tab.

If you installed your fonts correctly you should be able to click font and set it to your Nerd Font if you only installed a nerd font.
If you installed an ASCII font as well you can set the font to the ASCII font, click "Use a different font for non-ASCII text", and set the "Non-ASCII Font" to your nerd font.
If you are using "Fira Code" you can click turn ligatures on.

I recommend a font size of 15 for my ASCII font and 14 for my Nerd Font but it's all up to you.

### Color

Next we can navigate to the "Colors" tab to set the terminal's theme.
There are plenty of good default ones you can try out but if none of those are what you're looking for [Dracula](https://github.com/dracula/iterm) and [Catppuccin](https://github.com/catppuccin/iterm) are popular ones you can download.

Just `cd ~/Downloads/` then `git clone <repository>`. After that go to the "Colors" tab again and use the drop-down to import the `<theme>.itermcolors` file.

### Transparency

There is also a "Window" tab where you can set transparency and blur. Mine are set to 5 and 15 respectively.

## Switching Up ZSH

### Oh My Zsh Install

To change things up further we need a framework for zsh. We are going to choose Oh My Zsh for this.
Zsh or ZShell is the default shell installed on your Mac; it is like more featureful version of "bash".
The framework simply provides a way for people who want to build plugins and themes to implement their ideas in a formatted way.

To install Oh My Zsh use the command:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

After doing this you can see a `~/.oh-my-zsh/` directory if you use the command `ls -la ~`

### Themes

The other file that was changed when installing the framework was your `.zshrc` file.
This is short for "Z Shell Run Commands" and it is a series of commands that are ran every time your shell starts up.
This happens whenever you open a new terminal instance.

One of the new things in the `.zshrc` added by the framework is the `ZSH_THEME` variable.
There is a comment blurb above this variable explaining some things as well as all over this file.
If you care to read them at some point they are very helpful.

If you use the command `cd ~/.oh-my-zsh/themes/` you can see the default themes if you want to try some out.
[This link](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) covers a lot of them but you can download more if you want.

The most popular one by far is definitely powerlevel10k. If you want to try it out you can run the following commands.

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
```

Then set `ZSH_THEME="powerlevel10k/powerlevel10k"` in your `.zshrc` file and restart your terminal.
This should put you through the configuration wizard, but if not you can type `p10k configure`

### A Couple Useful Plugins

For some fun features that wont slow your terminal down but will be helpful you can install syntax highlighting and autosuggestions in the terminal using the following commands.

```bash
cd ~/.oh-my-zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
```
Then just open your `.zshrc` again and modify the plugins line to be `plugins=(zsh-autosuggestions zsh-syntax-highlighting git)`.

## Some Other Tools

The steps up until now should have you 90% of the way to a useful terminal but there is really endless configuration.
This is especially true when you get to programs like vim and tmux.
To add a little extra on top we can install some improvements to the general unix tooling.

All of the following tools can be installed using `brew install <tool>`.

### fzf

This is a fuzzy finder that can be used for anything. You can just run it in a directory to search all files or you can pipe some input into it for greater utility.

### bat

This is just a better version of `cat`. Press q to exit.

### tldr

A shortened version of the `man` page for a given command.

### eza

A better `ls`. Has more utility if you read the man page and set up aliases.
Some basic aliases you can add to your `.zshrc` can be found below.

```bash
alias ls="eza -G"
alias la="eza -la --git --icons --group-directories-first"
alias lt="eza -aTL 2 --icons"
```

### neofetch

A cool printout of specs and system.
Add a simple line containing `neofetch` at the bottom of your `.zshrc` if you want it to print on startup.
It can be a little slow.
