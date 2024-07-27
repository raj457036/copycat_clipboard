const kLocalUserId = "local_user";

const supportedUriSchemas = {
  "http",
  "https",
  "ftp",
  "file",
  "mailto",
  "tel",
  "data",
  "ws",
  "wss",
  "ldap",
  "urn",
  "git",
  "ssh",
  "irc",
  "news"
};

const androidTestAdUnit = "ca-app-pub-3940256099942544/6300978111";
const iosTestAdUnit = "ca-app-pub-3940256099942544/2934735716";

const macAppcastUrl = String.fromEnvironment("MACOS_UPGRADE_APPCAST_URL");
const windowsAppcastUrl = String.fromEnvironment("WINDOWS_UPGRADE_APPCAST_URL");
const linuxAppcastUrl = String.fromEnvironment("LINUX_UPGRADE_APPCAST_URL");
const tutorialsUrl = String.fromEnvironment("TUTORIALS_URL");
const youtubePlaylistUrl = String.fromEnvironment("YOUTUBE_PLAYLIST_URL");
const supportUrl = String.fromEnvironment("SUPPORT_URL");
const discordUrl = String.fromEnvironment("DISCORD_URL");
const googleGroupUrl = String.fromEnvironment("GOOGLE_GROUP_URL");
