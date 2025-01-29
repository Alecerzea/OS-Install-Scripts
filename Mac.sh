/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fastfetch wget
brew analytics off
curl -fsSL https://ollama.com/install.sh | sh
curl -LsSf https://astral.sh/uv/install.sh | sh
python3 -m pip install -U "yt-dlp[default]"

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

sudo launchctl remove com.apple.CallHistoryPluginHelper
sudo launchctl remove com.apple.AddressBook.abd
sudo launchctl remove com.apple.ap.adprivacyd
sudo launchctl remove com.apple.ReportPanic
sudo launchctl remove com.apple.ReportCrash
sudo launchctl remove com.apple.ReportCrash.Self
sudo launchctl remove com.apple.DiagnosticReportCleanup.plist
sudo launchctl remove com.apple.ap.adprivacyd
sudo launchctl remove com.apple.siriknowledged
sudo launchctl remove com.apple.helpd
sudo launchctl remove com.apple.mobiledeviceupdater
sudo launchctl remove com.apple.screensharing.MessagesAgent
sudo launchctl remove com.apple.TrustEvaluationAgent
sudo launchctl remove com.apple.iTunesHelper.launcher
sudo launchctl remove com.apple.softwareupdate_notify_agent
sudo launchctl remove com.apple.appstoreagent
sudo launchctl remove com.apple.familycircled
sudo launchctl remove com.apple.SafariCloudHistoryPushAgent
sudo launchctl remove com.apple.Safari.SafeBrowsing.Service
sudo launchctl remove com.apple.SafariNotificationAgent
sudo launchctl remove com.apple.SafariPlugInUpdateNotifier
sudo launchctl remove com.apple.SafariHistoryServiceAgent
sudo launchctl remove com.apple.SafariLaunchAgent
sudo launchctl remove com.apple.SafariPlugInUpdateNotifier
sudo launchctl remove com.apple.safaridavclient

defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true
sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE

sudo mdutil -i off -a

tell application "System Events"
    set the idle time to 0
end tell

sysctl -w vm.compressor_mode=2

sudo scutil --set ComputerName watamegu
sudo scutil --set LocalHostName otoyuri

sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off
sudo pkill -HUP socketfilterfw
