#Remember Only for VM use.
#I'm starting to think if these is even worth it considering that Apple got rid of support for x86, not the biggest fan of ARM btw.

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fastfetch yt-dlp

brew analytics off

sudo mdutil -i off -a

sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"

defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1

sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE

defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true

defaults write com.apple.loginwindow DisableScreenLock -bool true

defaults write com.apple.loginwindow TALLogoutSavesState -bool false

sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport prefs JoinMode=Strongest