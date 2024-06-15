import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CopyCat';

  @override
  String get en => 'English';

  @override
  String get es => 'Spanish';

  @override
  String get fr => 'French';

  @override
  String get de => 'German';

  @override
  String get language => 'Language';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get validEmailError => 'Please enter a valid email address';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get passwordLengthError =>
      'Please enter a password that is at least 6 characters long';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get forgotPassword => 'Forgot your password?';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Sign up';

  @override
  String get haveAccount => 'Already have an account? Sign in';

  @override
  String get sendPasswordReset => 'Send password reset email';

  @override
  String get backToSignIn => 'Back to sign in';

  @override
  String get updatePassword => 'Update Password';

  @override
  String get unexpectedError => 'An unexpected error occurred';

  @override
  String get passwordResetSent => 'Password reset email has been sent';

  @override
  String get collections => 'Collections';

  @override
  String get collection => 'Collection';

  @override
  String get createCollection => 'Create Collection';

  @override
  String get editCollection => 'Edit Collection';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get description => 'Description';

  @override
  String get noDescription => 'No description';

  @override
  String get noResultsWereFound => 'No Results were found';

  @override
  String get driveSetupDone => 'Drive Setup Done 🥳';

  @override
  String get pleaseWaitWhileWeSetupSyncing =>
      'Please wait while we setup\nsyncing';

  @override
  String get driveSetupMayTakeFewMin =>
      'This might take about a minute to complete.\n( Please do not close the app )';

  @override
  String get refreshNow => 'Refresh Now';

  @override
  String newUpdates(int ADDED, int UPDATED, int DELETED) {
    return 'Changes Available:\n $ADDED Added, $UPDATED Updated and $DELETED Deleted';
  }

  @override
  String get itemDeleted => 'Item Deleted';

  @override
  String get deletingFromCloud => 'Deleting from Cloud';

  @override
  String get emptyClipboard => 'Your clipboard is empty';

  @override
  String get loadMore => 'Load More';

  @override
  String get clipboard => 'Clipboard';

  @override
  String get search => 'Search';

  @override
  String get share => 'Share';

  @override
  String get export => 'Export';

  @override
  String get searchClipboard => 'Search Clipboard';

  @override
  String get settings => 'Settings';

  @override
  String get copyCatClipboard => 'CopyCat Clipboard';

  @override
  String get oneClipboardLimitlessPosibility =>
      'One Clipboard, Limitless Posibility';

  @override
  String get fullName => 'Full Name';

  @override
  String get preview => 'Preview';

  @override
  String get editDetails => 'Edit Details';

  @override
  String get title => 'Title';

  @override
  String get nothingHere => 'Nothing Here';

  @override
  String get downloading => 'Downloading';

  @override
  String get downloadForOffline => 'Downloading for offline';

  @override
  String get copyToClipboard => 'Copy to Clipboard';

  @override
  String get delete => 'Delete';

  @override
  String get resetYourPassword => 'Reset your password';

  @override
  String get passwordResetSuccess => 'Password reset successfully';

  @override
  String get findWhateverYouLooking => 'Find Whatever you are looking for...';

  @override
  String get noResults => 'No results were found.';

  @override
  String get searchInClipboard => 'Search in clipboard';

  @override
  String get basicLocal => 'Basic • Local';

  @override
  String get localSettingsDesc =>
      'These settings are applicable to this device only.';

  @override
  String get theme => 'Theme';

  @override
  String get syncLocal => 'Sync • Local';

  @override
  String get dontAutoCopyOver => 'Don\'t Auto Copy Over';

  @override
  String dontAutoCopyOverDesc(String SIZE) {
    return 'Files and Media over a certain size ($SIZE) will not be copied automatically.';
  }

  @override
  String get dontAutoUploadOver => 'Don\'t Auto Upload Over';

  @override
  String dontAutoUploadOverDesc(String SIZE) {
    return 'Files and Media over a certain size ($SIZE) will not be uploaded automatically.';
  }

  @override
  String get enableSync => 'Enable Sync';

  @override
  String get enableSyncDesc => 'Keep your files updated across devices';

  @override
  String get syncFiles => 'Sync Files and Medias';

  @override
  String get syncFilesDesc =>
      'Keep your files and media items updated across devices.';

  @override
  String get connected => 'Connected';

  @override
  String get loading => 'Loading...';

  @override
  String get authorizing => 'Authorizing...';

  @override
  String get connectNow => 'Connect Now';

  @override
  String get tips => 'ⓘ Tips';

  @override
  String get cloudStorageInfoDefault =>
      '\n\nGoogle Drive not connected, File and media syncing is disabled.';

  @override
  String cloudStorageInfo(String INFO) {
    return '${INFO}Your files and media are synced securely across devices using Google Drive to protect your privacy.';
  }

  @override
  String get attentionNeeded => '⚠ Attention Needed!';

  @override
  String get isPaused => 'Is Paused?';

  @override
  String isPausedDesc(String isPaused, String TILL) {
    String _temp0 = intl.Intl.selectLogic(
      isPaused,
      {
        'true': 'Auto copy is not paused',
        'other': 'Auto Copy is paused until $TILL',
      },
    );
    return '$_temp0';
  }

  @override
  String get paste => 'Paste';

  @override
  String get copy => 'Copy';

  @override
  String get previewEdit => 'Preview & Edit';

  @override
  String get pastingTheSharedContent =>
      'Pasting the Shared Content to Clipboard';

  @override
  String get smartPaste => 'Smart Paste';

  @override
  String get smartPasteDesc =>
      'Enable to paste clips directly to the last focused window.';

  @override
  String get launchAtStartup => 'Launch At Startup';

  @override
  String get launchAtStartupDesc =>
      'Enable to start the app automatically when your device starts.';

  @override
  String get autoSyncInterval => 'Auto Sync Interval';

  @override
  String autoSyncIntervalDesc(String TIME) {
    return 'Clipboard will be automatically synced every $TIME';
  }

  @override
  String get clipboardShortcut => 'Clipboard Shortcut';

  @override
  String get clipboardShortcutDesc => 'Effortlessly Access Clipboard Anywhere';

  @override
  String clipboardShortcutPreview(String KEY) {
    return 'Current Shortcut Key : $KEY';
  }

  @override
  String get unassigned => 'Unassigned';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get local => 'Local';

  @override
  String get uploading => 'Uploading...';

  @override
  String get pleaseWait => 'Please Wait...';

  @override
  String get open => 'Open';

  @override
  String get noCollection => 'No Collection';

  @override
  String get chooseCollection => 'Choose Collection';

  @override
  String get changeCollection => 'Change Collection';

  @override
  String get removeFromCollection => 'Remove from collection';

  @override
  String get compactMode => 'Compact Mode';

  @override
  String createACollection(int LEFT) {
    return 'Create a new collection ( $LEFT left )';
  }

  @override
  String get logout => 'Logout';

  @override
  String get logoutMessage =>
      '⚠️ WARNING ⚠️\n\nLogging out will delete unsynced changes in the local database. Are you sure you want to proceed?';

  @override
  String get loggingYouOut => 'Logging you out! Please wait...';

  @override
  String get logoutSuccess => 'Logged out successfully';

  @override
  String get internetConnected => 'Internet Connected';

  @override
  String get internetDisconnected => 'Internet Disconnected';

  @override
  String get noCollectionFound => 'No collection found';

  @override
  String get pinToTop => 'Pin to Top';

  @override
  String get done => 'Done';

  @override
  String get failed => 'Failed';

  @override
  String get syncNow => 'Sync Now';

  @override
  String get syncNotAvailable => 'Sync Not Available';

  @override
  String get checkingForRecord => 'Checking for Records';

  @override
  String get sync => 'Sync';

  @override
  String syncing(String PROGRESS) {
    return 'Syncing $PROGRESS';
  }

  @override
  String syncingCheckFailed(String MESSAGE) {
    return 'Syncing Check Failed: $MESSAGE';
  }

  @override
  String lastSynced(String TIMESTAMP) {
    return 'Last synced at $TIMESTAMP';
  }

  @override
  String get showWindow => 'Show Window';

  @override
  String get hideWindow => 'Hide Window';

  @override
  String get hideWindowDesc =>
      'Tip: Use keyboard shortcut to show the clipboard.';

  @override
  String get quit => 'Quit';

  @override
  String get quitDesc => 'Are you sure you want to quit?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get openInBrowser => 'Open in browser';

  @override
  String get makePhoneCall => 'Make a phone call';

  @override
  String get selectCollection => 'Select a collection';

  @override
  String get confirm => 'Confirm';

  @override
  String get recordKeyboardShortcut => 'Record keyboard shortcut.';

  @override
  String get recordKeyboardShortcutDesc =>
      'Type your shortcut using your keyboard and click ';

  @override
  String get subscription => 'Subscription';

  @override
  String get beta => 'BETA';

  @override
  String get featureListDetail =>
      'CopyCat Clipboard is currently in the Beta phase. While we strive for a seamless experience, you may encounter occasional bugs. Stay tuned for upcoming features and enhancements.';

  @override
  String get currentPlan => 'Current Plan';

  @override
  String currentPlanLabel(String LABEL) {
    return 'Current Plan • $LABEL';
  }

  @override
  String get included => 'Included';

  @override
  String get unlimitedClipboardItems => '• Unlimited Clipboard Items';

  @override
  String get supportAllMajorPlatforms => '• Support all major platforms';

  @override
  String get supportsAppleUniversalClipboard =>
      '• Supports Apple\'s Universal Clipboard';

  @override
  String get onDeviceStorage => '• On-Device Storage';

  @override
  String get googleDriveIntegration => '• Google Drive Integration';

  @override
  String get instantSearch => '• Instant Search';

  @override
  String get syncingUpToLast24Hours => '• Syncing up to Last 24 Hours';

  @override
  String get upTo3Collections => '• Up to 3 Collections';

  @override
  String get autoSyncEvery30Seconds => '• Auto-Sync Every 30 Seconds';

  @override
  String get termsAgreeP1 => 'By continuing you agree to the following ';

  @override
  String get privacyPolicies => 'Privacy policies';

  @override
  String get and => ' and ';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get termsAgreeP2 => '.';

  @override
  String get backToApp => 'Back to App';

  @override
  String get experimental => '🧪';

  @override
  String get experimentalDescription =>
      'This feature is experimental and might not work as expected.';

  @override
  String get selectAnOption => 'Select an option';

  @override
  String get advanceSecurity => 'Advance Security';

  @override
  String get endToEndVault => 'End-to-End Encryption Vault';

  @override
  String get accessE2eeVault => 'Access your E2EE vault settings';

  @override
  String get encryptClipboard => 'Encrypt Clipboard';

  @override
  String get encryptClipboardDesc =>
      'Encrypt clipboard before syncing with the cloud.';

  @override
  String get $5Sec => '5 Sec';

  @override
  String get $15Sec => '15 Sec';

  @override
  String get $30Sec => '30 Sec';

  @override
  String get $60Sec => '60 Sec';

  @override
  String get $90Sec => '90 Sec';

  @override
  String get e2eeNotSetup => 'E2EE not setup yet.';

  @override
  String get settingE2eeVault => 'Setting Up E2EE Vault';

  @override
  String get e2eeSetupWarning =>
      'If you lose your E2EE key and do not have a backup, your encrypted data will be permanently inaccessible. Keep your key safe and backed up.';

  @override
  String get e2eeSetupDesc =>
      'Generate your E2EE Vault key and save it in a secure location. You will need this key to set up other devices to access your encrypted information.';

  @override
  String get generating => 'Generating...';

  @override
  String get generateKey => 'Generate E2EE Vault Key';

  @override
  String get importE2eeKey => 'Import E2EE Vault Key';

  @override
  String get importE2eeInvalidKey => '⚠️ The imported key is invalid!';

  @override
  String get importE2eeDesc =>
      'Import your E2EE Vault key below to enable access to your encrypted information on this device. Make sure the key is securely stored and not shared with anyone.';

  @override
  String get importing => 'Importing...';

  @override
  String get importKey => 'Import E2EE Vault Key';

  @override
  String get e2eeVault => 'E2EE Vault';

  @override
  String get e2eeExportNote =>
      'Congratulations, you have successfully configured the end-to-end encryption.';

  @override
  String get e2eeExportDesc =>
      'Click the button below to export your E2EE Vault key.\nSave the key in a secure location to ensure you can set up other devices to access your encrypted information.';

  @override
  String get exportKey => 'Export E2EE Vault Key';
}
