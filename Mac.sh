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

# Custom Lulu tools that get rid of apple telemtry

# Blocking Apple Telemetry Domains
lulu --add-rule --process any --remote-endpoint "*.apple.com" --action block --name "Block Apple Telemetry"

# Blocking Apple Analytics
lulu --add-rule --process any --remote-endpoint "analytics.apple.com" --action block --name "Block Apple Analytics"

# Blocking Apple Crash Reporter
lulu --add-rule --process CrashReporter --remote-endpoint "crashreport.apple.com" --action block --name "Block Apple Crash Reporter"

# Blocking Apple Diagnostics
lulu --add-rule --process any --remote-endpoint "diagnostics.apple.com" --action block --name "Block Apple Diagnostics"

# Blocking Apple iCloud
lulu --add-rule --process any --remote-endpoint "icloud.com" --action block --name "Block Apple iCloud"