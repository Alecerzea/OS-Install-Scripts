

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fastfetch

brew analytics off

sudo mdutil -i off -a

nvram boot-args

sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"

sudo defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture ""

defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1

sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE

defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true


defaults write com.apple.universalaccessAuthWarning /System/Applications/Utilities/Terminal.app -bool true
defaults write com.apple.universalaccessAuthWarning /usr/libexec -bool true
defaults write com.apple.universalaccessAuthWarning /usr/libexec/sshd-keygen-wrapper -bool true
defaults write com.apple.universalaccessAuthWarning com.apple.Messages -bool true
defaults write com.apple.universalaccessAuthWarning com.apple.Terminal -bool true

defaults write com.apple.loginwindow DisableScreenLock -bool true

defaults write com.apple.loginwindow TALLogoutSavesState -bool false


defaults write com.apple.universalaccessAuthWarning "/Applications/AnyDesk.app" -bool true
defaults write com.apple.universalaccessAuthWarning "/Applications/AnyDesk.app/Contents/MacOS/AnyDesk" -bool true
defaults write com.apple.universalaccessAuthWarning "3::/Applications" -bool true
defaults write com.apple.universalaccessAuthWarning "3::/Applications/AnyDesk.app" -bool true
defaults write com.apple.universalaccessAuthWarning "com.philandro.anydesk" -bool true

sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart \
    -activate \
    -configure \
    -access \
    -off \
    -restart \
    -agent \
    -privs \
    -all \
    -allowAccessFor -allUsers

sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport prefs JoinMode=Strongest
