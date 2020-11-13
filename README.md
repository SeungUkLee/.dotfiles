...

```
# Alacritty Config
# @see https://medium.com/@pezcoder/how-i-migrated-from-iterm-to-alacritty-c50a04705f95
# @see https://github.com/alacritty/alacritty/blob/master/INSTALL.md#terminfo

# Clone alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# setup terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# cleanup
cd .. && rm -rf alacritty

defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
```
