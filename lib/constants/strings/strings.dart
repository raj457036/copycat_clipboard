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
