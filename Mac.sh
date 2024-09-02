# Homebrew and Packages

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fastfetch yt-dlp
brew analytics off

# Accessibility and Performance

defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"

# Multiple Sessions

defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true
sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE

# Improving Wi-Fi connectivity

sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport prefs JoinMode=Strongest

# Disabling Spotlight

sudo mdutil -i off -a

# Stop the screen to turn off

tell application "System Events"
    set the idle time to 0
end tell

# Disabling swap

sysctl -w vm.compressor_mode=2
