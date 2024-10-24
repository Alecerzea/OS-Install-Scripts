/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fastfetch wget
brew analytics off
python3 -m pip install -U "yt-dlp[default]"

defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"

defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true
sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE

sudo mdutil -i off -a

tell application "System Events"
    set the idle time to 0
end tell

sysctl -w vm.compressor_mode=2

sudo scutil --set ComputerName localhost
sudo scutil --set LocalHostName localhost

sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off
sudo pkill -HUP socketfilterfw