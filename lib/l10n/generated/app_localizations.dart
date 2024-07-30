import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart' deferred as app_localizations_de;
import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_es.dart' deferred as app_localizations_es;
import 'app_localizations_fr.dart' deferred as app_localizations_fr;

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'CopyCat'**
  String get appName;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// No description provided for @es.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get es;

  /// No description provided for @fr.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get fr;

  /// No description provided for @de.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get de;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @validEmailError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get validEmailError;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @passwordLengthError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password that is at least 6 characters long'**
  String get passwordLengthError;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign up'**
  String get dontHaveAccount;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get haveAccount;

  /// No description provided for @sendPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'Send password reset email'**
  String get sendPasswordReset;

  /// No description provided for @backToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Back to sign in'**
  String get backToSignIn;

  /// No description provided for @updatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get updatePassword;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get unexpectedError;

  /// No description provided for @passwordResetSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset email has been sent'**
  String get passwordResetSent;

  /// No description provided for @collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections;

  /// No description provided for @collection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get collection;

  /// No description provided for @createCollection.
  ///
  /// In en, this message translates to:
  /// **'Create Collection'**
  String get createCollection;

  /// No description provided for @editCollection.
  ///
  /// In en, this message translates to:
  /// **'Edit Collection'**
  String get editCollection;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get noDescription;

  /// No description provided for @noResultsWereFound.
  ///
  /// In en, this message translates to:
  /// **'No Results were found'**
  String get noResultsWereFound;

  /// No description provided for @driveSetupDone.
  ///
  /// In en, this message translates to:
  /// **'Drive Setup Done 🥳'**
  String get driveSetupDone;

  /// No description provided for @pleaseWaitWhileWeSetupSyncing.
  ///
  /// In en, this message translates to:
  /// **'Please wait while we setup\nsyncing'**
  String get pleaseWaitWhileWeSetupSyncing;

  /// No description provided for @driveSetupMayTakeFewMin.
  ///
  /// In en, this message translates to:
  /// **'This might take about a minute to complete.\n( Please do not close the app )'**
  String get driveSetupMayTakeFewMin;

  /// No description provided for @refreshNow.
  ///
  /// In en, this message translates to:
  /// **'Refresh Now'**
  String get refreshNow;

  /// No description provided for @newUpdates.
  ///
  /// In en, this message translates to:
  /// **'Changes Available:\n {added} Added, {updated} Updated and {deleted} Deleted'**
  String newUpdates(int added, int updated, int deleted);

  /// No description provided for @itemDeleted.
  ///
  /// In en, this message translates to:
  /// **'Item Deleted'**
  String get itemDeleted;

  /// No description provided for @deletingFromCloud.
  ///
  /// In en, this message translates to:
  /// **'Deleting from Cloud'**
  String get deletingFromCloud;

  /// No description provided for @emptyClipboard.
  ///
  /// In en, this message translates to:
  /// **'Your clipboard is empty'**
  String get emptyClipboard;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load More'**
  String get loadMore;

  /// No description provided for @clipboard.
  ///
  /// In en, this message translates to:
  /// **'Clipboard'**
  String get clipboard;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @searchClipboard.
  ///
  /// In en, this message translates to:
  /// **'Search Clipboard'**
  String get searchClipboard;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @copyCatClipboard.
  ///
  /// In en, this message translates to:
  /// **'CopyCat Clipboard'**
  String get copyCatClipboard;

  /// No description provided for @oneClipboardLimitlessPosibility.
  ///
  /// In en, this message translates to:
  /// **'One Clipboard, Limitless Posibility'**
  String get oneClipboardLimitlessPosibility;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @editDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Details'**
  String get editDetails;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @nothingHere.
  ///
  /// In en, this message translates to:
  /// **'Nothing Here'**
  String get nothingHere;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloading;

  /// No description provided for @downloadForOffline.
  ///
  /// In en, this message translates to:
  /// **'Downloading for offline'**
  String get downloadForOffline;

  /// No description provided for @copyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to Clipboard'**
  String get copyToClipboard;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @resetYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get resetYourPassword;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get passwordResetSuccess;

  /// No description provided for @findWhateverYouLooking.
  ///
  /// In en, this message translates to:
  /// **'Find Whatever you are looking for...'**
  String get findWhateverYouLooking;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results were found.'**
  String get noResults;

  /// No description provided for @searchInClipboard.
  ///
  /// In en, this message translates to:
  /// **'Search in clipboard'**
  String get searchInClipboard;

  /// No description provided for @basicLocal.
  ///
  /// In en, this message translates to:
  /// **'Basic • Local'**
  String get basicLocal;

  /// No description provided for @localSettingsDesc.
  ///
  /// In en, this message translates to:
  /// **'These settings are applicable to this device only.'**
  String get localSettingsDesc;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @syncLocal.
  ///
  /// In en, this message translates to:
  /// **'Sync • Local'**
  String get syncLocal;

  /// No description provided for @dontAutoCopyOver.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Auto Copy Over'**
  String get dontAutoCopyOver;

  /// No description provided for @dontAutoCopyOverDesc.
  ///
  /// In en, this message translates to:
  /// **'Files and Media over a certain size ({size}) will not be copied automatically.'**
  String dontAutoCopyOverDesc(String size);

  /// No description provided for @dontAutoUploadOver.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Auto Upload Over'**
  String get dontAutoUploadOver;

  /// No description provided for @dontAutoUploadOverDesc.
  ///
  /// In en, this message translates to:
  /// **'Files and Media over a certain size ({size}) will not be uploaded automatically.'**
  String dontAutoUploadOverDesc(String size);

  /// No description provided for @enableSync.
  ///
  /// In en, this message translates to:
  /// **'Enable Sync'**
  String get enableSync;

  /// No description provided for @enableSyncDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep your clips synced across devices'**
  String get enableSyncDesc;

  /// No description provided for @syncFiles.
  ///
  /// In en, this message translates to:
  /// **'Sync Files and Medias'**
  String get syncFiles;

  /// No description provided for @syncFilesDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep your files and media items updated across devices.'**
  String get syncFilesDesc;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @authorizing.
  ///
  /// In en, this message translates to:
  /// **'Authorizing...'**
  String get authorizing;

  /// No description provided for @connectNow.
  ///
  /// In en, this message translates to:
  /// **'Connect Now'**
  String get connectNow;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'ⓘ Tips'**
  String get tips;

  /// No description provided for @cloudStorageInfoDefault.
  ///
  /// In en, this message translates to:
  /// **'\n\nGoogle Drive not connected, File and media syncing is disabled.'**
  String get cloudStorageInfoDefault;

  /// No description provided for @cloudStorageInfo.
  ///
  /// In en, this message translates to:
  /// **'{info}Your files and media are synced securely across devices using Google Drive to protect your privacy.'**
  String cloudStorageInfo(String info);

  /// No description provided for @attentionNeeded.
  ///
  /// In en, this message translates to:
  /// **'⚠ Attention Needed!'**
  String get attentionNeeded;

  /// No description provided for @isPaused.
  ///
  /// In en, this message translates to:
  /// **'Is Paused?'**
  String get isPaused;

  /// No description provided for @isPausedDesc.
  ///
  /// In en, this message translates to:
  /// **'{isPaused, select, true{Auto copy is not paused} other{Auto Copy is paused until {till}}}'**
  String isPausedDesc(String isPaused, String till);

  /// No description provided for @paste.
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get paste;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @previewEdit.
  ///
  /// In en, this message translates to:
  /// **'Preview & Edit'**
  String get previewEdit;

  /// No description provided for @pastingTheSharedContent.
  ///
  /// In en, this message translates to:
  /// **'Pasting the Shared Content to Clipboard'**
  String get pastingTheSharedContent;

  /// No description provided for @smartPaste.
  ///
  /// In en, this message translates to:
  /// **'Smart Paste'**
  String get smartPaste;

  /// No description provided for @smartPasteDesc.
  ///
  /// In en, this message translates to:
  /// **'Enable to paste clips directly to the last focused window.'**
  String get smartPasteDesc;

  /// No description provided for @launchAtStartup.
  ///
  /// In en, this message translates to:
  /// **'Launch At Startup'**
  String get launchAtStartup;

  /// No description provided for @launchAtStartupDesc.
  ///
  /// In en, this message translates to:
  /// **'Enable to start the app automatically when your device starts.'**
  String get launchAtStartupDesc;

  /// No description provided for @autoSyncInterval.
  ///
  /// In en, this message translates to:
  /// **'Auto Sync Interval'**
  String get autoSyncInterval;

  /// No description provided for @autoSyncIntervalDesc.
  ///
  /// In en, this message translates to:
  /// **'Clipboard will be automatically synced'**
  String get autoSyncIntervalDesc;

  /// No description provided for @clipboardShortcut.
  ///
  /// In en, this message translates to:
  /// **'Clipboard Shortcut'**
  String get clipboardShortcut;

  /// No description provided for @clipboardShortcutDesc.
  ///
  /// In en, this message translates to:
  /// **'Effortlessly Access Clipboard Anywhere'**
  String get clipboardShortcutDesc;

  /// No description provided for @clipboardShortcutPreview.
  ///
  /// In en, this message translates to:
  /// **'Current Shortcut Key : {key}'**
  String clipboardShortcutPreview(String key);

  /// No description provided for @unassigned.
  ///
  /// In en, this message translates to:
  /// **'Unassigned'**
  String get unassigned;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @local.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get local;

  /// No description provided for @uploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading...'**
  String get uploading;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get pleaseWait;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @noCollection.
  ///
  /// In en, this message translates to:
  /// **'No Collection'**
  String get noCollection;

  /// No description provided for @chooseCollection.
  ///
  /// In en, this message translates to:
  /// **'Choose Collection'**
  String get chooseCollection;

  /// No description provided for @changeCollection.
  ///
  /// In en, this message translates to:
  /// **'Change Collection'**
  String get changeCollection;

  /// No description provided for @removeFromCollection.
  ///
  /// In en, this message translates to:
  /// **'Remove from collection'**
  String get removeFromCollection;

  /// No description provided for @compactMode.
  ///
  /// In en, this message translates to:
  /// **'Compact Mode'**
  String get compactMode;

  /// No description provided for @createACollection.
  ///
  /// In en, this message translates to:
  /// **'Create a new collection ( {left} left )'**
  String createACollection(String left);

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutMessage.
  ///
  /// In en, this message translates to:
  /// **'⚠️ WARNING ⚠️\n\nLogging out will delete unsynced changes in the local database. Are you sure you want to proceed?'**
  String get logoutMessage;

  /// No description provided for @loggingYouOut.
  ///
  /// In en, this message translates to:
  /// **'Logging you out! Please wait...'**
  String get loggingYouOut;

  /// No description provided for @logoutSuccess.
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully'**
  String get logoutSuccess;

  /// No description provided for @internetConnected.
  ///
  /// In en, this message translates to:
  /// **'Internet Connected'**
  String get internetConnected;

  /// No description provided for @internetDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Internet Disconnected'**
  String get internetDisconnected;

  /// No description provided for @noCollectionFound.
  ///
  /// In en, this message translates to:
  /// **'No collection found'**
  String get noCollectionFound;

  /// No description provided for @pinToTop.
  ///
  /// In en, this message translates to:
  /// **'Pin to Top'**
  String get pinToTop;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get syncNow;

  /// No description provided for @syncNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Sync Not Available'**
  String get syncNotAvailable;

  /// No description provided for @checkingForRecord.
  ///
  /// In en, this message translates to:
  /// **'Checking for Records'**
  String get checkingForRecord;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get sync;

  /// No description provided for @syncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing {progress}'**
  String syncing(String progress);

  /// No description provided for @syncingCheckFailed.
  ///
  /// In en, this message translates to:
  /// **'Syncing Check Failed: {message}'**
  String syncingCheckFailed(String message);

  /// No description provided for @synced.
  ///
  /// In en, this message translates to:
  /// **'✅ Changes Synced'**
  String get synced;

  /// No description provided for @showWindow.
  ///
  /// In en, this message translates to:
  /// **'Show Window'**
  String get showWindow;

  /// No description provided for @hideWindow.
  ///
  /// In en, this message translates to:
  /// **'Hide Window'**
  String get hideWindow;

  /// No description provided for @hideWindowDesc.
  ///
  /// In en, this message translates to:
  /// **'Tip: Use keyboard shortcut to show the clipboard.'**
  String get hideWindowDesc;

  /// No description provided for @quit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get quit;

  /// No description provided for @quitDesc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to quit?'**
  String get quitDesc;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @openInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in browser'**
  String get openInBrowser;

  /// No description provided for @makePhoneCall.
  ///
  /// In en, this message translates to:
  /// **'Make a phone call'**
  String get makePhoneCall;

  /// No description provided for @selectCollection.
  ///
  /// In en, this message translates to:
  /// **'Select a collection'**
  String get selectCollection;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @recordKeyboardShortcut.
  ///
  /// In en, this message translates to:
  /// **'Record keyboard shortcut.'**
  String get recordKeyboardShortcut;

  /// No description provided for @recordKeyboardShortcutDesc.
  ///
  /// In en, this message translates to:
  /// **'Type your shortcut using your keyboard and click '**
  String get recordKeyboardShortcutDesc;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// No description provided for @beta.
  ///
  /// In en, this message translates to:
  /// **'PUBLIC BETA'**
  String get beta;

  /// No description provided for @featureListDetail.
  ///
  /// In en, this message translates to:
  /// **'CopyCat Clipboard is currently in the Beta phase. While we strive for a seamless experience, you may encounter occasional bugs. Stay tuned for upcoming features and enhancements.'**
  String get featureListDetail;

  /// No description provided for @currentPlan.
  ///
  /// In en, this message translates to:
  /// **'Current Plan'**
  String get currentPlan;

  /// No description provided for @currentPlanLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Plan • {label}'**
  String currentPlanLabel(String label);

  /// No description provided for @included.
  ///
  /// In en, this message translates to:
  /// **'Included'**
  String get included;

  /// No description provided for @unlimitedClipboardItems.
  ///
  /// In en, this message translates to:
  /// **'Unlimited Clipboard Items'**
  String get unlimitedClipboardItems;

  /// No description provided for @unlimitedClipboardItemsDesc.
  ///
  /// In en, this message translates to:
  /// **'Never run out of space with unlimited clipboard items, ensuring you always have access to your most recent copies.'**
  String get unlimitedClipboardItemsDesc;

  /// No description provided for @supportAllMajorPlatforms.
  ///
  /// In en, this message translates to:
  /// **'Support all major platforms'**
  String get supportAllMajorPlatforms;

  /// No description provided for @supportAllMajorPlatformsDesc.
  ///
  /// In en, this message translates to:
  /// **'Seamlessly sync across all major platforms—Android, iOS, Windows, macOS, and Linux —for uninterrupted productivity anywhere.'**
  String get supportAllMajorPlatformsDesc;

  /// No description provided for @supportsAppleUniversalClipboard.
  ///
  /// In en, this message translates to:
  /// **'Supports Apple Universal Clipboard'**
  String get supportsAppleUniversalClipboard;

  /// No description provided for @supportsAppleUniversalClipboardDesc.
  ///
  /// In en, this message translates to:
  /// **'Effortlessly transfer clipboard content between your Apple devices with support for Apple\'s Universal Clipboard.'**
  String get supportsAppleUniversalClipboardDesc;

  /// No description provided for @onDeviceStorage.
  ///
  /// In en, this message translates to:
  /// **'On-Device Storage'**
  String get onDeviceStorage;

  /// No description provided for @onDeviceStorageDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep your data secure with on-device storage, ensuring your clipboard items are always within reach and under your control.'**
  String get onDeviceStorageDesc;

  /// No description provided for @googleDriveIntegration.
  ///
  /// In en, this message translates to:
  /// **'Google Drive Integration'**
  String get googleDriveIntegration;

  /// No description provided for @googleDriveIntegrationDesc.
  ///
  /// In en, this message translates to:
  /// **'Securely store files and media on Google Drive, integrating seamlessly with CopyCat Clipboard for enhanced data management.'**
  String get googleDriveIntegrationDesc;

  /// No description provided for @instantSearch.
  ///
  /// In en, this message translates to:
  /// **'Instant Search'**
  String get instantSearch;

  /// No description provided for @instantSearchDesc.
  ///
  /// In en, this message translates to:
  /// **'Find what you need instantly with powerful instant search capabilities, making retrieval of clipboard items fast and efficient.'**
  String get instantSearchDesc;

  /// No description provided for @syncingUpToLast24Hours.
  ///
  /// In en, this message translates to:
  /// **'Syncing Up to the Last 24 Hours'**
  String get syncingUpToLast24Hours;

  /// No description provided for @syncingUpToLast24HoursDesc.
  ///
  /// In en, this message translates to:
  /// **'Access and sync your clipboard history across all your devices for the past 24 hours. This ensures you never lose important copied items, making your workflow seamless and efficient.'**
  String get syncingUpToLast24HoursDesc;

  /// No description provided for @upTo3Collections.
  ///
  /// In en, this message translates to:
  /// **'Up to 3 Collections'**
  String get upTo3Collections;

  /// No description provided for @upTo3CollectionsDesc.
  ///
  /// In en, this message translates to:
  /// **'Organize your clipboard items into up to 3 collections, providing simple categorization for better workflow management.'**
  String get upTo3CollectionsDesc;

  /// No description provided for @autoSyncEvery60Seconds.
  ///
  /// In en, this message translates to:
  /// **'Auto-Sync Every 60 Seconds'**
  String get autoSyncEvery60Seconds;

  /// No description provided for @autoSyncEvery60SecondsDesc.
  ///
  /// In en, this message translates to:
  /// **'Enjoy automatic syncing of clipboard items every 60 seconds, keeping your devices up-to-date without manual intervention.'**
  String get autoSyncEvery60SecondsDesc;

  /// No description provided for @withPro.
  ///
  /// In en, this message translates to:
  /// **'With PRO ✨'**
  String get withPro;

  /// No description provided for @withProDesc.
  ///
  /// In en, this message translates to:
  /// **'Everything included in Free +'**
  String get withProDesc;

  /// No description provided for @supportE2EE.
  ///
  /// In en, this message translates to:
  /// **'Support End-to-End Encryption'**
  String get supportE2EE;

  /// No description provided for @supportE2EEDesc.
  ///
  /// In en, this message translates to:
  /// **'E2EE will make everything encrypted for superior privacy.'**
  String get supportE2EEDesc;

  /// No description provided for @upto50Collection.
  ///
  /// In en, this message translates to:
  /// **'Up to 50 Collections'**
  String get upto50Collection;

  /// No description provided for @upto50CollectionDesc.
  ///
  /// In en, this message translates to:
  /// **'Organize your clipboard items into up to 50 collections for ultimate management.'**
  String get upto50CollectionDesc;

  /// No description provided for @syncLast720Hr.
  ///
  /// In en, this message translates to:
  /// **'Syncing Up to the Last 30 Days'**
  String get syncLast720Hr;

  /// No description provided for @syncLast720HrDesc.
  ///
  /// In en, this message translates to:
  /// **'Clipboard history is synced across all your devices for clips created within the last 30 days. This means you can access any clip you copied in the past month, no matter which device you are using.'**
  String get syncLast720HrDesc;

  /// No description provided for @realtimeSync.
  ///
  /// In en, this message translates to:
  /// **'Real Time Synchronization'**
  String get realtimeSync;

  /// No description provided for @realtimeSyncDesc.
  ///
  /// In en, this message translates to:
  /// **'Experience lightning-fast syncing.'**
  String get realtimeSyncDesc;

  /// No description provided for @prioritySupport.
  ///
  /// In en, this message translates to:
  /// **'Faster and Priority Support'**
  String get prioritySupport;

  /// No description provided for @prioritySupportDesc.
  ///
  /// In en, this message translates to:
  /// **'Get prompt and prioritized support as a PRO user.'**
  String get prioritySupportDesc;

  /// No description provided for @earlyAccessToNewFeature.
  ///
  /// In en, this message translates to:
  /// **'Early Access to New Features'**
  String get earlyAccessToNewFeature;

  /// No description provided for @earlyAccessToNewFeatureDesc.
  ///
  /// In en, this message translates to:
  /// **'Be the first to try out new features and updates.'**
  String get earlyAccessToNewFeatureDesc;

  /// No description provided for @termsAgreeP1.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to the following '**
  String get termsAgreeP1;

  /// No description provided for @privacyPolicies.
  ///
  /// In en, this message translates to:
  /// **'Privacy policies'**
  String get privacyPolicies;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @termsAgreeP2.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get termsAgreeP2;

  /// No description provided for @backToApp.
  ///
  /// In en, this message translates to:
  /// **'Back to App'**
  String get backToApp;

  /// No description provided for @experimental.
  ///
  /// In en, this message translates to:
  /// **'🧪'**
  String get experimental;

  /// No description provided for @experimentalDescription.
  ///
  /// In en, this message translates to:
  /// **'This feature is experimental and might not work as expected.'**
  String get experimentalDescription;

  /// No description provided for @selectAnOption.
  ///
  /// In en, this message translates to:
  /// **'Select an option'**
  String get selectAnOption;

  /// No description provided for @advanceSecurity.
  ///
  /// In en, this message translates to:
  /// **'Advance Security'**
  String get advanceSecurity;

  /// No description provided for @endToEndVault.
  ///
  /// In en, this message translates to:
  /// **'End-to-End Encryption Vault'**
  String get endToEndVault;

  /// No description provided for @accessE2eeVault.
  ///
  /// In en, this message translates to:
  /// **'Access your E2EE vault settings'**
  String get accessE2eeVault;

  /// No description provided for @encryptClipboard.
  ///
  /// In en, this message translates to:
  /// **'Encrypt Clipboard'**
  String get encryptClipboard;

  /// No description provided for @encryptClipboardDesc.
  ///
  /// In en, this message translates to:
  /// **'Encrypt clipboard before syncing with the cloud.'**
  String get encryptClipboardDesc;

  /// No description provided for @$5Sec.
  ///
  /// In en, this message translates to:
  /// **'Instant'**
  String get $5Sec;

  /// No description provided for @$10Sec.
  ///
  /// In en, this message translates to:
  /// **'Rapid'**
  String get $10Sec;

  /// No description provided for @$20Sec.
  ///
  /// In en, this message translates to:
  /// **'Swift'**
  String get $20Sec;

  /// No description provided for @$45Sec.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get $45Sec;

  /// No description provided for @$60Sec.
  ///
  /// In en, this message translates to:
  /// **'Casual'**
  String get $60Sec;

  /// No description provided for @$5MB.
  ///
  /// In en, this message translates to:
  /// **'Small (5 MB)'**
  String get $5MB;

  /// No description provided for @$10MB.
  ///
  /// In en, this message translates to:
  /// **'Standard (10 MB)'**
  String get $10MB;

  /// No description provided for @$20MB.
  ///
  /// In en, this message translates to:
  /// **'Medium (20 MB)'**
  String get $20MB;

  /// No description provided for @$50MB.
  ///
  /// In en, this message translates to:
  /// **'Large (50 MB)'**
  String get $50MB;

  /// No description provided for @$100MB.
  ///
  /// In en, this message translates to:
  /// **'Extra Large (100 MB)'**
  String get $100MB;

  /// No description provided for @e2eeNotSetup.
  ///
  /// In en, this message translates to:
  /// **'E2EE not setup yet.'**
  String get e2eeNotSetup;

  /// No description provided for @settingE2eeVault.
  ///
  /// In en, this message translates to:
  /// **'Setting Up E2EE Vault'**
  String get settingE2eeVault;

  /// No description provided for @e2eeSetupWarning.
  ///
  /// In en, this message translates to:
  /// **'If you lose your E2EE key and do not have a backup, your encrypted data will be permanently inaccessible. Keep your key safe and backed up.'**
  String get e2eeSetupWarning;

  /// No description provided for @e2eeSetupDesc.
  ///
  /// In en, this message translates to:
  /// **'Generate your E2EE Vault key and save it in a secure location. You will need this key to set up other devices to access your encrypted information.'**
  String get e2eeSetupDesc;

  /// No description provided for @generating.
  ///
  /// In en, this message translates to:
  /// **'Generating...'**
  String get generating;

  /// No description provided for @generateKey.
  ///
  /// In en, this message translates to:
  /// **'Generate E2EE Vault Key'**
  String get generateKey;

  /// No description provided for @importE2eeKey.
  ///
  /// In en, this message translates to:
  /// **'Import E2EE Vault Key'**
  String get importE2eeKey;

  /// No description provided for @importE2eeInvalidKey.
  ///
  /// In en, this message translates to:
  /// **'⚠️ The imported key is invalid!'**
  String get importE2eeInvalidKey;

  /// No description provided for @importE2eeDesc.
  ///
  /// In en, this message translates to:
  /// **'Import your E2EE Vault key below to enable access to your encrypted information on this device. Make sure the key is securely stored and not shared with anyone.'**
  String get importE2eeDesc;

  /// No description provided for @importing.
  ///
  /// In en, this message translates to:
  /// **'Importing...'**
  String get importing;

  /// No description provided for @importKey.
  ///
  /// In en, this message translates to:
  /// **'Import E2EE Vault Key'**
  String get importKey;

  /// No description provided for @e2eeVault.
  ///
  /// In en, this message translates to:
  /// **'E2EE Vault'**
  String get e2eeVault;

  /// No description provided for @e2eeExportNote.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, you have successfully configured the end-to-end encryption.'**
  String get e2eeExportNote;

  /// No description provided for @e2eeExportDesc.
  ///
  /// In en, this message translates to:
  /// **'Click the button below to export your E2EE Vault key.\nSave the key in a secure location to ensure you can set up other devices to access your encrypted information.'**
  String get e2eeExportDesc;

  /// No description provided for @exportKey.
  ///
  /// In en, this message translates to:
  /// **'Export E2EE Vault Key'**
  String get exportKey;

  /// No description provided for @exportSuccess.
  ///
  /// In en, this message translates to:
  /// **'✅ Successfully exported'**
  String get exportSuccess;

  /// No description provided for @copySuccess.
  ///
  /// In en, this message translates to:
  /// **'✅ Successfully copied to clipboard'**
  String get copySuccess;

  /// No description provided for @whatsNew.
  ///
  /// In en, this message translates to:
  /// **'What\'s New?'**
  String get whatsNew;

  /// No description provided for @feature1.
  ///
  /// In en, this message translates to:
  /// **'Smart Cross-Platform Clipboard'**
  String get feature1;

  /// No description provided for @feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Seamlessly sync your clipboard content across all your devices. Whether it\'s text, images, or files, access your clipboard history wherever you go.'**
  String get feature1Desc;

  /// No description provided for @feature2.
  ///
  /// In en, this message translates to:
  /// **'Unlimited History with Instant Search'**
  String get feature2;

  /// No description provided for @feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Never lose your copied items again. Our unlimited history feature ensures you can instantly search and retrieve any past clipboard item.'**
  String get feature2Desc;

  /// No description provided for @feature3.
  ///
  /// In en, this message translates to:
  /// **'Smart Paste'**
  String get feature3;

  /// No description provided for @feature3Desc.
  ///
  /// In en, this message translates to:
  /// **'Paste intelligently with context-aware suggestions. Save time by quickly accessing the right content for your current task.'**
  String get feature3Desc;

  /// No description provided for @feature4.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get feature4;

  /// No description provided for @feature4Desc.
  ///
  /// In en, this message translates to:
  /// **'Organize your clipboard items into collections for easy access and management. Perfect for projects, research, and more.'**
  String get feature4Desc;

  /// No description provided for @gettingStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get gettingStarted;

  /// No description provided for @howToUse.
  ///
  /// In en, this message translates to:
  /// **'How to Use'**
  String get howToUse;

  /// No description provided for @howToUseDesc.
  ///
  /// In en, this message translates to:
  /// **'How to use CopyCat? Read our documentation to get started.'**
  String get howToUseDesc;

  /// No description provided for @tutorials.
  ///
  /// In en, this message translates to:
  /// **'Video Tutorials'**
  String get tutorials;

  /// No description provided for @tutorialsDesc.
  ///
  /// In en, this message translates to:
  /// **'Learn how to make the most out of CopyCat with our step-by-step video tutorials.'**
  String get tutorialsDesc;

  /// No description provided for @learnAboutFeatures.
  ///
  /// In en, this message translates to:
  /// **'Learn about all the features CopyCat has to offer.'**
  String get learnAboutFeatures;

  /// No description provided for @learn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learn;

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get upgrade;

  /// No description provided for @trialTill.
  ///
  /// In en, this message translates to:
  /// **'Trial till {till}'**
  String trialTill(String till);

  /// No description provided for @expiredPlan.
  ///
  /// In en, this message translates to:
  /// **'{planName} • Expired'**
  String expiredPlan(String planName);

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @dangerZone.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get dangerZone;

  /// No description provided for @requestAccountDeletion.
  ///
  /// In en, this message translates to:
  /// **'Request Account Deletion'**
  String get requestAccountDeletion;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @accountDeleteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Delete Request'**
  String get accountDeleteDialogTitle;

  /// No description provided for @accountDeleteDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'You will be redirected to the account delete request form, are you sure?'**
  String get accountDeleteDialogDesc;

  /// No description provided for @unlockPremiumFeatures.
  ///
  /// In en, this message translates to:
  /// **'Unlock CopyCat PRO'**
  String get unlockPremiumFeatures;

  /// No description provided for @upgradeToPro.
  ///
  /// In en, this message translates to:
  /// **'Enjoy over 30 days of synced history, over 50 collections, end-to-end encryption, real-time syncing, access to the newest features, and much more.'**
  String get upgradeToPro;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get tryAgain;

  /// No description provided for @continue_.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @manageSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Manage Subscriptions'**
  String get manageSubscriptions;

  /// No description provided for @promoSub.
  ///
  /// In en, this message translates to:
  /// **'You are using a promo subscription till {till}'**
  String promoSub(String till);

  /// No description provided for @subscriptionUpdated.
  ///
  /// In en, this message translates to:
  /// **'Subscription Updated'**
  String get subscriptionUpdated;

  /// No description provided for @grantedEntitlement.
  ///
  /// In en, this message translates to:
  /// **'Granted Entitlement'**
  String get grantedEntitlement;

  /// No description provided for @grantedEntitlementDesc.
  ///
  /// In en, this message translates to:
  /// **'Granted Entitlement Codes are shared with specific individuals for custom entitlements. You can check if invitations are still available by '**
  String get grantedEntitlementDesc;

  /// No description provided for @clickingHere.
  ///
  /// In en, this message translates to:
  /// **'clicking here.'**
  String get clickingHere;

  /// No description provided for @enterCodeSubmit.
  ///
  /// In en, this message translates to:
  /// **'Enter the code and press Submit'**
  String get enterCodeSubmit;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @subscribeInSupportedPlatform.
  ///
  /// In en, this message translates to:
  /// **'To access premium features on Copycat Clipboard, please subscribe through the Play Store or Apple App Store. Your subscription will be synced across all your devices, including Linux and Windows.'**
  String get subscribeInSupportedPlatform;

  /// No description provided for @timeSyncWarning.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Time Sync Warning'**
  String get timeSyncWarning;

  /// No description provided for @timeSyncWarningNote1.
  ///
  /// In en, this message translates to:
  /// **'Inconsistent Device Time Detected'**
  String get timeSyncWarningNote1;

  /// No description provided for @timeSyncWarningNote2.
  ///
  /// In en, this message translates to:
  /// **'To ensure accurate clipboard syncing, please check and correct your device\'s time settings.'**
  String get timeSyncWarningNote2;

  /// No description provided for @timeSyncWarningNote3.
  ///
  /// In en, this message translates to:
  /// **'Inconsistent time settings may cause synchronization issues.'**
  String get timeSyncWarningNote3;

  /// No description provided for @checkAgain.
  ///
  /// In en, this message translates to:
  /// **'Check Again'**
  String get checkAgain;

  /// No description provided for @shareYourFeedback.
  ///
  /// In en, this message translates to:
  /// **'Share Your Feedback'**
  String get shareYourFeedback;

  /// No description provided for @shareYourFeedbackDesc.
  ///
  /// In en, this message translates to:
  /// **'We value your thoughts!, Whether it’s a suggestion, a bug report, or just to say hello, your input is invaluable to us.'**
  String get shareYourFeedbackDesc;

  /// No description provided for @joinDiscord.
  ///
  /// In en, this message translates to:
  /// **'Join Our Discord Community'**
  String get joinDiscord;

  /// No description provided for @joinDiscordDesc.
  ///
  /// In en, this message translates to:
  /// **'Connect with other users, share ideas, get updates, and chat directly with us.'**
  String get joinDiscordDesc;

  /// No description provided for @joinGoogleGroup.
  ///
  /// In en, this message translates to:
  /// **'Join Our Google Group'**
  String get joinGoogleGroup;

  /// No description provided for @joinGoogleGroupDesc.
  ///
  /// In en, this message translates to:
  /// **'Stay informed and collaborate with fellow users in our Google Group'**
  String get joinGoogleGroupDesc;

  /// No description provided for @rebuildingDB.
  ///
  /// In en, this message translates to:
  /// **'⏱️ Rebuilding Database\nPlease Wait...'**
  String get rebuildingDB;

  /// No description provided for @proTip.
  ///
  /// In en, this message translates to:
  /// **'Pro Tip'**
  String get proTip;

  /// No description provided for @useCollectionProTip.
  ///
  /// In en, this message translates to:
  /// **'To ensure your important clips are always available regardless of time, across all your devices, save them in a collection!'**
  String get useCollectionProTip;

  /// No description provided for @syncConfigNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Sync related configurations not available.'**
  String get syncConfigNotAvailable;

  /// No description provided for @useLocally.
  ///
  /// In en, this message translates to:
  /// **'Use Locally'**
  String get useLocally;

  /// No description provided for @useLocallyDesc.
  ///
  /// In en, this message translates to:
  /// **'No syncing. All data stays on your device.'**
  String get useLocallyDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return lookupAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<AppLocalizations> lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return app_localizations_de
          .loadLibrary()
          .then((dynamic _) => app_localizations_de.AppLocalizationsDe());
    case 'en':
      return app_localizations_en
          .loadLibrary()
          .then((dynamic _) => app_localizations_en.AppLocalizationsEn());
    case 'es':
      return app_localizations_es
          .loadLibrary()
          .then((dynamic _) => app_localizations_es.AppLocalizationsEs());
    case 'fr':
      return app_localizations_fr
          .loadLibrary()
          .then((dynamic _) => app_localizations_fr.AppLocalizationsFr());
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
