/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/user/.zprofile
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> /Users/user/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
brew install fastfetch wget
brew analytics off
python3 -m ensurepip --upgrade
python3 -m pip install -U "yt-dlp[default]" v2dl

defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock launchanim -bool false
sudo sysctl debug.lowpri_throttle_enabled=0
sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"

sudo launchctl remove com.apple.AddressBook.abd
sudo launchctl remove com.apple.ap.adprivacyd
sudo launchctl remove com.apple.ap.adprivacyd

defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true
sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE

sudo mdutil -i off -a

tell application "System Events"
    set the idle time to 0
end tell

sysctl -w vm.compressor_mode=2

sudo scutil --set ComputerName watamegu
sudo scutil --set LocalHostName otoyuri

open ./Downloads/MacUtil-Universal.app

sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off
sudo pkill -HUP socketfilterfw

sudo defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture ""
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0.001
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1

sudo launchctl remove com.apple.ap.adprivacyd
sudo launchctl remove com.apple.ap.adprivacyd
sudo launchctl remove com.apple.siriknowledged

defaults write com.apple.loginwindow TALLogoutSavesState -bool false

sudo reboot now
