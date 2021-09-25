# DotFiles

System configuration scripts to bootstrap a new development environment based on my personal preferences. This repo utilizes the Oh My Zsh project and can be further customized using it's plugins. 

## Installing fonts

To install the powerline fonts on Linux, clone the following repository and open the .ttf files to add them to your font library. 

```sh
git clone https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy
```

## Applications

The [app.sh](app.sh) file will install the following applications from homebrew and will be invoked in the [bootstrap.sh](bootstrap.sh) file. Comment or remove `brew install` invocations within [app.sh](app.sh) to prevent any undesired applications or plugins from automatically being installed.

Applications installed by default:
* Google Chrome
* Intellij Idea CE
* MPlayerX
* Spotify
* Sublime Text
* The Unarchiver
* Thinkorswim
* Visual Studio Code

Plugins installed by default:
| Plugin             | Description                                                        |
|--------------------|--------------------------------------------------------------------|
| qlmarkdown         | Quicklook plugin for viewing Markdown files                        |
| quicklook-json     | Quicklook plugin for pretty-printing JSON files                    |
| qlprettypatch      | Quicklook plugin for viewing patch files                           |
| quicklook-csv      | Quicklook plugin for viewing CSV files as tables                   |
| qlimagesize        | Quicklook plugin to display image dimensions when viewing an image |
| webpquicklook      | Quicklook plugin for viewing WebP files                            |
| suspicious-package | Quicklook plugin to inspect suspicious packages                    |