import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([super.locale = 'en']);

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
  String newUpdates(int added, int updated, int deleted) {
    return 'Changes Available:\n $added Added, $updated Updated and $deleted Deleted';
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
  String dontAutoCopyOverDesc(String size) {
    return 'Files and Media over a certain size ($size) will not be copied automatically.';
  }

  @override
  String get dontAutoUploadOver => 'Don\'t Auto Upload Over';

  @override
  String dontAutoUploadOverDesc(String size) {
    return 'Files and Media over a certain size ($size) will not be uploaded automatically.';
  }

  @override
  String get enableSync => 'Enable Sync';

  @override
  String get enableSyncDesc => 'Keep your clips synced across devices';

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
  String cloudStorageInfo(String info) {
    return '${info}Your files and media are synced securely across devices using Google Drive to protect your privacy.';
  }

  @override
  String get attentionNeeded => '⚠ Attention Needed!';

  @override
  String get isPaused => 'Is Paused?';

  @override
  String isPausedDesc(String isPaused, String till) {
    String temp0 = intl.Intl.selectLogic(
      isPaused,
      {
        'true': 'Auto copy is not paused',
        'other': 'Auto Copy is paused until $till',
      },
    );
    return temp0;
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
  String get autoSyncIntervalDesc => 'Clipboard will be automatically synced';

  @override
  String get clipboardShortcut => 'Clipboard Shortcut';

  @override
  String get clipboardShortcutDesc => 'Effortlessly Access Clipboard Anywhere';

  @override
  String clipboardShortcutPreview(String key) {
    return 'Current Shortcut Key : $key';
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
  String createACollection(String left) {
    return 'Create a new collection ( $left left )';
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
  String syncing(String progress) {
    return 'Syncing $progress';
  }

  @override
  String syncingCheckFailed(String message) {
    return 'Syncing Check Failed: $message';
  }

  @override
  String get synced => '✅ Changes Synced';

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
  String get beta => 'PUBLIC BETA';

  @override
  String get featureListDetail =>
      'CopyCat Clipboard is currently in the Beta phase. While we strive for a seamless experience, you may encounter occasional bugs. Stay tuned for upcoming features and enhancements.';

  @override
  String get currentPlan => 'Current Plan';

  @override
  String currentPlanLabel(String label) {
    return 'Current Plan • $label';
  }

  @override
  String get included => 'Included';

  @override
  String get unlimitedClipboardItems => 'Unlimited Clipboard Items';

  @override
  String get unlimitedClipboardItemsDesc =>
      'Never run out of space with unlimited clipboard items, ensuring you always have access to your most recent copies.';

  @override
  String get supportAllMajorPlatforms => 'Support all major platforms';

  @override
  String get supportAllMajorPlatformsDesc =>
      'Seamlessly sync across all major platforms—Android, iOS, Windows, macOS, and Linux —for uninterrupted productivity anywhere.';

  @override
  String get supportsAppleUniversalClipboard =>
      'Supports Apple Universal Clipboard';

  @override
  String get supportsAppleUniversalClipboardDesc =>
      'Effortlessly transfer clipboard content between your Apple devices with support for Apple\'s Universal Clipboard.';

  @override
  String get onDeviceStorage => 'On-Device Storage';

  @override
  String get onDeviceStorageDesc =>
      'Keep your data secure with on-device storage, ensuring your clipboard items are always within reach and under your control.';

  @override
  String get googleDriveIntegration => 'Google Drive Integration';

  @override
  String get googleDriveIntegrationDesc =>
      'Securely store files and media on Google Drive, integrating seamlessly with CopyCat Clipboard for enhanced data management.';

  @override
  String get instantSearch => 'Instant Search';

  @override
  String get instantSearchDesc =>
      'Find what you need instantly with powerful instant search capabilities, making retrieval of clipboard items fast and efficient.';

  @override
  String get syncingUpToLast24Hours => 'Syncing Up to the Last 24 Hours';

  @override
  String get syncingUpToLast24HoursDesc =>
      'Access and sync your clipboard history across all your devices for the past 24 hours. This ensures you never lose important copied items, making your workflow seamless and efficient.';

  @override
  String get upTo3Collections => 'Up to 3 Collections';

  @override
  String get upTo3CollectionsDesc =>
      'Organize your clipboard items into up to 3 collections, providing simple categorization for better workflow management.';

  @override
  String get autoSyncEvery60Seconds => 'Auto-Sync Every 60 Seconds';

  @override
  String get autoSyncEvery60SecondsDesc =>
      'Enjoy automatic syncing of clipboard items every 60 seconds, keeping your devices up-to-date without manual intervention.';

  @override
  String get withPro => 'With PRO ✨';

  @override
  String get withProDesc => 'Everything included in Free +';

  @override
  String get supportE2EE => 'Support End-to-End Encryption';

  @override
  String get supportE2EEDesc =>
      'E2EE will make everything encrypted for superior privacy.';

  @override
  String get upto50Collection => 'Up to 50 Collections';

  @override
  String get upto50CollectionDesc =>
      'Organize your clipboard items into up to 50 collections for ultimate management.';

  @override
  String get syncLast720Hr => 'Syncing Up to the Last 30 Days';

  @override
  String get syncLast720HrDesc =>
      'Clipboard history is synced across all your devices for clips created within the last 30 days. This means you can access any clip you copied in the past month, no matter which device you are using.';

  @override
  String get realtimeSync => 'Real Time Synchronization';

  @override
  String get realtimeSyncDesc => 'Experience lightning-fast syncing.';

  @override
  String get prioritySupport => 'Faster and Priority Support';

  @override
  String get prioritySupportDesc =>
      'Get prompt and prioritized support as a PRO user.';

  @override
  String get earlyAccessToNewFeature => 'Early Access to New Features';

  @override
  String get earlyAccessToNewFeatureDesc =>
      'Be the first to try out new features and updates.';

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
  String get $5Sec => 'Instant';

  @override
  String get $10Sec => 'Rapid';

  @override
  String get $20Sec => 'Swift';

  @override
  String get $45Sec => 'Balanced';

  @override
  String get $60Sec => 'Casual';

  @override
  String get $5MB => 'Small (5 MB)';

  @override
  String get $10MB => 'Standard (10 MB)';

  @override
  String get $20MB => 'Medium (20 MB)';

  @override
  String get $50MB => 'Large (50 MB)';

  @override
  String get $100MB => 'Extra Large (100 MB)';

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

  @override
  String get exportSuccess => '✅ Successfully exported';

  @override
  String get copySuccess => '✅ Successfully copied to clipboard';

  @override
  String get whatsNew => 'What\'s New?';

  @override
  String get feature1 => 'Smart Cross-Platform Clipboard';

  @override
  String get feature1Desc =>
      'Seamlessly sync your clipboard content across all your devices. Whether it\'s text, images, or files, access your clipboard history wherever you go.';

  @override
  String get feature2 => 'Unlimited History with Instant Search';

  @override
  String get feature2Desc =>
      'Never lose your copied items again. Our unlimited history feature ensures you can instantly search and retrieve any past clipboard item.';

  @override
  String get feature3 => 'Smart Paste';

  @override
  String get feature3Desc =>
      'Paste intelligently with context-aware suggestions. Save time by quickly accessing the right content for your current task.';

  @override
  String get feature4 => 'Collections';

  @override
  String get feature4Desc =>
      'Organize your clipboard items into collections for easy access and management. Perfect for projects, research, and more.';

  @override
  String get gettingStarted => 'Get Started';

  @override
  String get howToUse => 'How to Use';

  @override
  String get howToUseDesc =>
      'How to use CopyCat? Read our documentation to get started.';

  @override
  String get tutorials => 'Video Tutorials';

  @override
  String get tutorialsDesc =>
      'Learn how to make the most out of CopyCat with our step-by-step video tutorials.';

  @override
  String get learnAboutFeatures =>
      'Learn about all the features CopyCat has to offer.';

  @override
  String get learn => 'Learn';

  @override
  String get upgrade => 'Upgrade';

  @override
  String trialTill(String till) {
    return 'Trial till $till';
  }

  @override
  String expiredPlan(String planName) {
    return '$planName • Expired';
  }

  @override
  String get displayName => 'Display Name';

  @override
  String get email => 'Email';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get dangerZone => 'Danger Zone';

  @override
  String get requestAccountDeletion => 'Request Account Deletion';

  @override
  String get myAccount => 'My Account';

  @override
  String get accountDeleteDialogTitle => 'Account Delete Request';

  @override
  String get accountDeleteDialogDesc =>
      'You will be redirected to the account delete request form, are you sure?';

  @override
  String get unlockPremiumFeatures => 'Unlock CopyCat PRO';

  @override
  String get upgradeToPro =>
      'Enjoy over 30 days of synced history, over 50 collections, end-to-end encryption, real-time syncing, access to the newest features, and much more.';

  @override
  String get tryAgain => 'Please try again';

  @override
  String get continue_ => 'Continue';

  @override
  String get year => 'year';

  @override
  String get month => 'month';

  @override
  String get manageSubscriptions => 'Manage Subscriptions';

  @override
  String promoSub(String till) {
    return 'You are using a promo subscription till $till';
  }

  @override
  String get subscriptionUpdated => 'Subscription Updated';

  @override
  String get grantedEntitlement => 'Granted Entitlement';

  @override
  String get grantedEntitlementDesc =>
      'Granted Entitlement Codes are shared with specific individuals for custom entitlements. You can check if invitations are still available by ';

  @override
  String get clickingHere => 'clicking here.';

  @override
  String get enterCodeSubmit => 'Enter the code and press Submit';

  @override
  String get submit => 'Submit';

  @override
  String get subscribeInSupportedPlatform =>
      'To access premium features on Copycat Clipboard, please subscribe through the Play Store or Apple App Store. Your subscription will be synced across all your devices, including Linux and Windows.';

  @override
  String get timeSyncWarning => '⚠️ Time Sync Warning';

  @override
  String get timeSyncWarningNote1 => 'Inconsistent Device Time Detected';

  @override
  String get timeSyncWarningNote2 =>
      'To ensure accurate clipboard syncing, please check and correct your device\'s time settings.';

  @override
  String get timeSyncWarningNote3 =>
      'Inconsistent time settings may cause synchronization issues.';

  @override
  String get checkAgain => 'Check Again';

  @override
  String get shareYourFeedback => 'Share Your Feedback';

  @override
  String get shareYourFeedbackDesc =>
      'We value your thoughts!, Whether it’s a suggestion, a bug report, or just to say hello, your input is invaluable to us.';

  @override
  String get joinDiscord => 'Join Our Discord Community';

  @override
  String get joinDiscordDesc =>
      'Connect with other users, share ideas, get updates, and chat directly with us.';

  @override
  String get joinGoogleGroup => 'Join Our Google Group';

  @override
  String get joinGoogleGroupDesc =>
      'Stay informed and collaborate with fellow users in our Google Group';

  @override
  String get rebuildingDB => '⏱️ Rebuilding Database\nPlease Wait...';

  @override
  String get proTip => 'Pro Tip';

  @override
  String get useCollectionProTip =>
      'To ensure your important clips are always available regardless of time, across all your devices, save them in a collection!';

  @override
  String get syncConfigNotAvailable =>
      'Sync related configurations not available.';

  @override
  String get useLocally => 'Use Locally';

  @override
  String get useLocallyDesc => 'No syncing. All data stays on your device.';
}
