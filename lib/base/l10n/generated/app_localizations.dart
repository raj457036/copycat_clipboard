import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart' deferred as app_localizations_de;
import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_es.dart' deferred as app_localizations_es;
import 'app_localizations_fr.dart' deferred as app_localizations_fr;
import 'app_localizations_pt.dart' deferred as app_localizations_pt;
import 'app_localizations_zh.dart' deferred as app_localizations_zh;

// ignore_for_file: type=lint

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
    Locale('fr'),
    Locale('pt'),
    Locale('zh'),
  ];

  /// App name: CopyCat Clipboard
  ///
  /// In en, this message translates to:
  /// **'CopyCat Clipboard'**
  String get app__name;

  /// CopyCat Clipboard Slogan
  ///
  /// In en, this message translates to:
  /// **'One Clipboard, Limitless Possibility'**
  String get app__slogan;

  /// No description provided for @app__start_indexing.
  ///
  /// In en, this message translates to:
  /// **'Start Indexing'**
  String get app__start_indexing;

  /// No description provided for @app__stop_indexing.
  ///
  /// In en, this message translates to:
  /// **'Stop Indexing'**
  String get app__stop_indexing;

  /// No description provided for @app__image_not_found.
  ///
  /// In en, this message translates to:
  /// **'Image not found'**
  String get app__image_not_found;

  /// No description provided for @app__unknown_error.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get app__unknown_error;

  /// No description provided for @app__downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get app__downloading;

  /// No description provided for @app__download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get app__download;

  /// No description provided for @app__follow_link.
  ///
  /// In en, this message translates to:
  /// **'Follow Link'**
  String get app__follow_link;

  /// No description provided for @app__edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get app__edit;

  /// No description provided for @app__export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get app__export;

  /// No description provided for @app__delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get app__delete;

  /// No description provided for @app__later.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get app__later;

  /// No description provided for @app__select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get app__select;

  /// No description provided for @app__change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get app__change;

  /// No description provided for @app__confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get app__confirm;

  /// No description provided for @app__action_required.
  ///
  /// In en, this message translates to:
  /// **'Action Required'**
  String get app__action_required;

  /// No description provided for @app__feature_unavailable.
  ///
  /// In en, this message translates to:
  /// **'This feature is not available for your platform.'**
  String get app__feature_unavailable;

  /// No description provided for @app__preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get app__preview;

  /// No description provided for @app__open_file.
  ///
  /// In en, this message translates to:
  /// **'Open file'**
  String get app__open_file;

  /// No description provided for @app__change_collection.
  ///
  /// In en, this message translates to:
  /// **'Change Collection'**
  String get app__change_collection;

  /// No description provided for @app__no_name.
  ///
  /// In en, this message translates to:
  /// **'No Name'**
  String get app__no_name;

  /// No description provided for @app__share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get app__share;

  /// No description provided for @app__clip_actions.
  ///
  /// In en, this message translates to:
  /// **'Clip Actions'**
  String get app__clip_actions;

  /// No description provided for @app__copy_content.
  ///
  /// In en, this message translates to:
  /// **'Copy Content'**
  String get app__copy_content;

  /// No description provided for @app__paste_content.
  ///
  /// In en, this message translates to:
  /// **'Paste Content'**
  String get app__paste_content;

  /// No description provided for @app__loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get app__loading;

  /// No description provided for @app__uploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading...'**
  String get app__uploading;

  /// No description provided for @app__syncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get app__syncing;

  /// No description provided for @app__sync_cooldown.
  ///
  /// In en, this message translates to:
  /// **'Sync is on cooldown. Please wait {time} before syncing again.'**
  String app__sync_cooldown({required String time});

  /// No description provided for @app__sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get app__sync;

  /// No description provided for @app__queued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get app__queued;

  /// No description provided for @app__local.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get app__local;

  /// No description provided for @app__utc.
  ///
  /// In en, this message translates to:
  /// **'UTC'**
  String get app__utc;

  /// No description provided for @app__send_message.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get app__send_message;

  /// No description provided for @app__send_email.
  ///
  /// In en, this message translates to:
  /// **'Send Email'**
  String get app__send_email;

  /// No description provided for @app__empty_clipboard.
  ///
  /// In en, this message translates to:
  /// **'Your clipboard is empty.'**
  String get app__empty_clipboard;

  /// No description provided for @app__load_more.
  ///
  /// In en, this message translates to:
  /// **'Fetch More'**
  String get app__load_more;

  /// No description provided for @app__more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get app__more;

  /// No description provided for @app__search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get app__search;

  /// No description provided for @app__no_results.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get app__no_results;

  /// No description provided for @app__locale_en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get app__locale_en;

  /// No description provided for @app__locale_es.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get app__locale_es;

  /// No description provided for @app__locale_fr.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get app__locale_fr;

  /// No description provided for @app__locale_de.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get app__locale_de;

  /// No description provided for @app__locale_zh.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get app__locale_zh;

  /// No description provided for @app__locale_pt.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get app__locale_pt;

  /// No description provided for @app__language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get app__language;

  /// No description provided for @app__yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get app__yes;

  /// No description provided for @app__no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get app__no;

  /// No description provided for @app__quit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get app__quit;

  /// No description provided for @app__clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get app__clear;

  /// No description provided for @app__reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get app__reset;

  /// No description provided for @app__continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get app__continue;

  /// No description provided for @app__paste.
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get app__paste;

  /// No description provided for @app__copycat_logo.
  ///
  /// In en, this message translates to:
  /// **'CopyCat Logo'**
  String get app__copycat_logo;

  /// No description provided for @app__logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get app__logout;

  /// No description provided for @app__no_collection.
  ///
  /// In en, this message translates to:
  /// **'No Collection Found'**
  String get app__no_collection;

  /// No description provided for @app__create_collection.
  ///
  /// In en, this message translates to:
  /// **'Create Collection'**
  String get app__create_collection;

  /// No description provided for @app__create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get app__create;

  /// No description provided for @app__pro_tip.
  ///
  /// In en, this message translates to:
  /// **'Pro Tip'**
  String get app__pro_tip;

  /// No description provided for @app__try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get app__try_again;

  /// No description provided for @app__realtime_connected.
  ///
  /// In en, this message translates to:
  /// **'Realtime Connected'**
  String get app__realtime_connected;

  /// No description provided for @app__realtime_disconnected.
  ///
  /// In en, this message translates to:
  /// **'Realtime Disconnected'**
  String get app__realtime_disconnected;

  /// No description provided for @app__realtime_connecting.
  ///
  /// In en, this message translates to:
  /// **'Realtime Connecting...'**
  String get app__realtime_connecting;

  /// No description provided for @app__ack__exported.
  ///
  /// In en, this message translates to:
  /// **'Exported'**
  String get app__ack__exported;

  /// No description provided for @app__ack__copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get app__ack__copied;

  /// No description provided for @app__ack__copied_from_device.
  ///
  /// In en, this message translates to:
  /// **'Copied from {device}'**
  String app__ack__copied_from_device({required String device});

  /// No description provided for @app__ack__received_from_device.
  ///
  /// In en, this message translates to:
  /// **'Received from {device}'**
  String app__ack__received_from_device({required String device});

  /// No description provided for @app__ack__excluded.
  ///
  /// In en, this message translates to:
  /// **'Excluded'**
  String get app__ack__excluded;

  /// No description provided for @app__ack__excluded_with_reason.
  ///
  /// In en, this message translates to:
  /// **'Excluded • {reason}'**
  String app__ack__excluded_with_reason({required String reason});

  /// No description provided for @app__ack__reason_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get app__ack__reason_phone;

  /// No description provided for @app__ack__reason_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get app__ack__reason_email;

  /// No description provided for @app__ack__reason_credit_card.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get app__ack__reason_credit_card;

  /// No description provided for @app__ack__reason_sensitive_url.
  ///
  /// In en, this message translates to:
  /// **'Sensitive URL'**
  String get app__ack__reason_sensitive_url;

  /// No description provided for @app__ack__reason_app.
  ///
  /// In en, this message translates to:
  /// **'Sensitive App'**
  String get app__ack__reason_app;

  /// No description provided for @app__ack__reason_pattern.
  ///
  /// In en, this message translates to:
  /// **'Pattern'**
  String get app__ack__reason_pattern;

  /// No description provided for @app__ack__reason_title.
  ///
  /// In en, this message translates to:
  /// **'Sensitive Window'**
  String get app__ack__reason_title;

  /// No description provided for @app__ack__pasted.
  ///
  /// In en, this message translates to:
  /// **'Pasted'**
  String get app__ack__pasted;

  /// No description provided for @app__ack__pasting.
  ///
  /// In en, this message translates to:
  /// **'Pasting'**
  String get app__ack__pasting;

  /// No description provided for @app__ack__done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get app__ack__done;

  /// No description provided for @app__ack__quit_app.
  ///
  /// In en, this message translates to:
  /// **'Quit App'**
  String get app__ack__quit_app;

  /// No description provided for @app__ack__deleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get app__ack__deleted;

  /// No description provided for @app__ack__internet_connected.
  ///
  /// In en, this message translates to:
  /// **'Internet Connected'**
  String get app__ack__internet_connected;

  /// No description provided for @app__ack__internet_disconnected.
  ///
  /// In en, this message translates to:
  /// **'Internet Disconnected'**
  String get app__ack__internet_disconnected;

  /// No description provided for @app__ack__logout_success.
  ///
  /// In en, this message translates to:
  /// **'You are successfully logged out.'**
  String get app__ack__logout_success;

  /// No description provided for @app__ack__no_app_for_file.
  ///
  /// In en, this message translates to:
  /// **'No application found to open this file.'**
  String get app__ack__no_app_for_file;

  /// No description provided for @app__ack__perm_fail_to_open_file.
  ///
  /// In en, this message translates to:
  /// **'Permission to open this file not granted.'**
  String get app__ack__perm_fail_to_open_file;

  /// No description provided for @app__ack__missing_e2e_setup.
  ///
  /// In en, this message translates to:
  /// **'Missing encryption setup'**
  String get app__ack__missing_e2e_setup;

  /// No description provided for @app__ack__failed_to_sync.
  ///
  /// In en, this message translates to:
  /// **'Failed to sync {entityType}: {message}'**
  String app__ack__failed_to_sync({
    required String entityType,
    required String message,
  });

  /// No description provided for @app__index_pending.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Index {total} clips to make them searchable. It only takes a moment.'**
  String app__index_pending({required int total});

  /// No description provided for @app__indexing_completed.
  ///
  /// In en, this message translates to:
  /// **'🎉 Search indexing completed. Your clips are now searchable.'**
  String get app__indexing_completed;

  /// No description provided for @dialog__delete_clip__title.
  ///
  /// In en, this message translates to:
  /// **'Delete Clip'**
  String get dialog__delete_clip__title;

  /// No description provided for @dialog__delete_clip__subtitle.
  ///
  /// In en, this message translates to:
  /// **'{itemCount, plural, other{Are you sure you want to delete these clips?} one{Are you sure you want to delete this clip?}}'**
  String dialog__delete_clip__subtitle({required int itemCount});

  /// No description provided for @dialog__e2e__title.
  ///
  /// In en, this message translates to:
  /// **'End to End Encryption'**
  String get dialog__e2e__title;

  /// No description provided for @dialog__text__e2e_key_export.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, you have successfully configured the end-to-end encryption.'**
  String get dialog__text__e2e_key_export;

  /// No description provided for @dialog__text__e2e_key_export__note.
  ///
  /// In en, this message translates to:
  /// **'Click the button below to export your encryption key.\nSave the key in a secure location to ensure you can set up other devices to access your encrypted information.'**
  String get dialog__text__e2e_key_export__note;

  /// No description provided for @dialog__text__e2e_key_generate.
  ///
  /// In en, this message translates to:
  /// **'Generate an encryption key and store it securely. This key is required to set up other devices for accessing your encrypted data.'**
  String get dialog__text__e2e_key_generate;

  /// No description provided for @dialog__button__e2e_generating_key.
  ///
  /// In en, this message translates to:
  /// **'Generating'**
  String get dialog__button__e2e_generating_key;

  /// No description provided for @dialog__button__e2e_generate_key.
  ///
  /// In en, this message translates to:
  /// **'Generated'**
  String get dialog__button__e2e_generate_key;

  /// No description provided for @dialog__text__invalid_e2e_key.
  ///
  /// In en, this message translates to:
  /// **'The imported key is invalid!'**
  String get dialog__text__invalid_e2e_key;

  /// No description provided for @dialog__text__e2e_key_import__note.
  ///
  /// In en, this message translates to:
  /// **'Import your encryption key below to access your encrypted data on this device.'**
  String get dialog__text__e2e_key_import__note;

  /// No description provided for @dialog__button__e2e_importing_key.
  ///
  /// In en, this message translates to:
  /// **'Importing'**
  String get dialog__button__e2e_importing_key;

  /// No description provided for @dialog__button__e2e_import_key.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get dialog__button__e2e_import_key;

  /// No description provided for @dialog__button__e2e_clear_key.
  ///
  /// In en, this message translates to:
  /// **'Clear Key'**
  String get dialog__button__e2e_clear_key;

  /// No description provided for @dialog__title__e2e_clear_key.
  ///
  /// In en, this message translates to:
  /// **'Clear Encryption Key'**
  String get dialog__title__e2e_clear_key;

  /// No description provided for @dialog__text__e2e_clear_key__confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove the encryption key from this device? You will not be able to decrypt encrypted clips until you import the key again.'**
  String get dialog__text__e2e_clear_key__confirm;

  /// No description provided for @dialog__text__inconsistent_time__title.
  ///
  /// In en, this message translates to:
  /// **'Time Sync Warning'**
  String get dialog__text__inconsistent_time__title;

  /// No description provided for @dialog__text__inconsistent_time__content.
  ///
  /// In en, this message translates to:
  /// **'Inconsistent Device Time Detected\n\nTo ensure accurate clipboard syncing, please check and correct your device\'s time settings.\n\nInconsistent time settings may cause synchronization issues.'**
  String get dialog__text__inconsistent_time__content;

  /// No description provided for @dialog__text__inconsistent_time__still_off.
  ///
  /// In en, this message translates to:
  /// **'Clock is still out of sync. Please update your system time manually.'**
  String get dialog__text__inconsistent_time__still_off;

  /// No description provided for @dialog__text__inconsistent_time__ntp_unreachable.
  ///
  /// In en, this message translates to:
  /// **'Could not reach time server. Please check your internet connection and sync your clock manually.'**
  String get dialog__text__inconsistent_time__ntp_unreachable;

  /// No description provided for @dialog__text__inconsistent_time__check_failed.
  ///
  /// In en, this message translates to:
  /// **'Time check failed. Please update your system clock manually.'**
  String get dialog__text__inconsistent_time__check_failed;

  /// No description provided for @dialog__button__try_again.
  ///
  /// In en, this message translates to:
  /// **'Check Again'**
  String get dialog__button__try_again;

  /// No description provided for @dialog__button__try_fix.
  ///
  /// In en, this message translates to:
  /// **'Try Auto-Fix'**
  String get dialog__button__try_fix;

  /// No description provided for @dialog__record_keys__title.
  ///
  /// In en, this message translates to:
  /// **'Record Keyboard Shortcut'**
  String get dialog__record_keys__title;

  /// No description provided for @dialog__record_keys__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Type your shortcut using your keyboard and click '**
  String get dialog__record_keys__subtitle;

  /// No description provided for @dialog__delete_collection__title.
  ///
  /// In en, this message translates to:
  /// **'Delete {collectionName}'**
  String dialog__delete_collection__title({required String collectionName});

  /// No description provided for @dialog__delete_collection__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to delete this collection?'**
  String get dialog__delete_collection__subtitle;

  /// No description provided for @dialog__ack__sub_updated.
  ///
  /// In en, this message translates to:
  /// **'Subscription Updated'**
  String get dialog__ack__sub_updated;

  /// No description provided for @dialog__grant_entitlement__title.
  ///
  /// In en, this message translates to:
  /// **'Granted Entitlement'**
  String get dialog__grant_entitlement__title;

  /// No description provided for @dialog__grant_entitlement__subtitle_p1.
  ///
  /// In en, this message translates to:
  /// **'Granted Entitlement Codes are shared with specific individuals for custom entitlements. You can check if invitations are still available by '**
  String get dialog__grant_entitlement__subtitle_p1;

  /// No description provided for @dialog__grant_entitlement__subtitle_p2.
  ///
  /// In en, this message translates to:
  /// **'Clicking Here.'**
  String get dialog__grant_entitlement__subtitle_p2;

  /// No description provided for @dialog__grant_entitlement__enter_code.
  ///
  /// In en, this message translates to:
  /// **'Enter the code and press Submit'**
  String get dialog__grant_entitlement__enter_code;

  /// No description provided for @dialog__grant_entitlement__code_label.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get dialog__grant_entitlement__code_label;

  /// No description provided for @dialog__grant_entitlement__apply_code.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get dialog__grant_entitlement__apply_code;

  /// No description provided for @view_button__switch_to_grid.
  ///
  /// In en, this message translates to:
  /// **'Switch to Grid Layout'**
  String get view_button__switch_to_grid;

  /// No description provided for @view_button__switch_to_list.
  ///
  /// In en, this message translates to:
  /// **'Switch to List Layout'**
  String get view_button__switch_to_list;

  /// No description provided for @view_button__change_view.
  ///
  /// In en, this message translates to:
  /// **'Change View'**
  String get view_button__change_view;

  /// No description provided for @view_button__view_window.
  ///
  /// In en, this message translates to:
  /// **'Windowed'**
  String get view_button__view_window;

  /// No description provided for @view_button__view_dock_right.
  ///
  /// In en, this message translates to:
  /// **'Dock Right'**
  String get view_button__view_dock_right;

  /// No description provided for @view_button__view_dock_bottom.
  ///
  /// In en, this message translates to:
  /// **'Dock Bottom'**
  String get view_button__view_dock_bottom;

  /// No description provided for @view_button__view_dock_left.
  ///
  /// In en, this message translates to:
  /// **'Dock Left'**
  String get view_button__view_dock_left;

  /// No description provided for @view_button__view_dock_top.
  ///
  /// In en, this message translates to:
  /// **'Dock Top'**
  String get view_button__view_dock_top;

  /// No description provided for @view_button__pin.
  ///
  /// In en, this message translates to:
  /// **'Pin to top'**
  String get view_button__pin;

  /// No description provided for @view_button__unpin.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get view_button__unpin;

  /// No description provided for @sub_dialog__text__included.
  ///
  /// In en, this message translates to:
  /// **'Included'**
  String get sub_dialog__text__included;

  /// No description provided for @sub_dialog__f1__title.
  ///
  /// In en, this message translates to:
  /// **'Unlimited Clipboard Items'**
  String get sub_dialog__f1__title;

  /// No description provided for @sub_dialog__f1__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Never run out of space with unlimited clipboard items, ensuring you always have access to your most recent copies.'**
  String get sub_dialog__f1__subtitle;

  /// No description provided for @sub_dialog__f2__title.
  ///
  /// In en, this message translates to:
  /// **'Support all major platforms'**
  String get sub_dialog__f2__title;

  /// No description provided for @sub_dialog__f2__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Seamlessly sync across all major platforms—Android, iOS, Windows, macOS, and Linux —for uninterrupted productivity anywhere.'**
  String get sub_dialog__f2__subtitle;

  /// No description provided for @sub_dialog__f3__title.
  ///
  /// In en, this message translates to:
  /// **'Supports Apple Universal Clipboard'**
  String get sub_dialog__f3__title;

  /// No description provided for @sub_dialog__f3__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Effortlessly transfer clipboard content between your Apple devices with support for Apple\'s Universal Clipboard.'**
  String get sub_dialog__f3__subtitle;

  /// No description provided for @sub_dialog__f4__title.
  ///
  /// In en, this message translates to:
  /// **'On-Device Storage'**
  String get sub_dialog__f4__title;

  /// No description provided for @sub_dialog__f4__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your data secure with on-device storage, ensuring your clipboard items are always within reach and under your control.'**
  String get sub_dialog__f4__subtitle;

  /// No description provided for @sub_dialog__f5__title.
  ///
  /// In en, this message translates to:
  /// **'Google Drive Integration'**
  String get sub_dialog__f5__title;

  /// No description provided for @sub_dialog__f5__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Securely store files and media on Google Drive, integrating seamlessly with CopyCat Clipboard for enhanced data management.'**
  String get sub_dialog__f5__subtitle;

  /// No description provided for @sub_dialog__f6__title.
  ///
  /// In en, this message translates to:
  /// **'Instant Search'**
  String get sub_dialog__f6__title;

  /// No description provided for @sub_dialog__f6__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Find what you need instantly with powerful instant search capabilities, making retrieval of clipboard items fast and efficient.'**
  String get sub_dialog__f6__subtitle;

  /// No description provided for @sub_dialog__f7__title.
  ///
  /// In en, this message translates to:
  /// **'Syncing Up to the Last 24 Hours'**
  String get sub_dialog__f7__title;

  /// No description provided for @sub_dialog__f7__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Access and sync your clipboard history across all your devices for the past 24 hours. This ensures you never lose important copied items, making your workflow seamless and efficient.'**
  String get sub_dialog__f7__subtitle;

  /// No description provided for @sub_dialog__f8__title.
  ///
  /// In en, this message translates to:
  /// **'Up to 3 Collections'**
  String get sub_dialog__f8__title;

  /// No description provided for @sub_dialog__f8__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Organize your clipboard items into up to 3 collections, providing simple categorization for better workflow management.'**
  String get sub_dialog__f8__subtitle;

  /// No description provided for @sub_dialog__f9__title.
  ///
  /// In en, this message translates to:
  /// **'Background Sync'**
  String get sub_dialog__f9__title;

  /// No description provided for @sub_dialog__f9__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Core syncing runs on a best-effort basis and may take up to 15 minutes depending on server load.'**
  String get sub_dialog__f9__subtitle;

  /// No description provided for @sub_dialog__f10__title.
  ///
  /// In en, this message translates to:
  /// **'Support End-to-End Encryption'**
  String get sub_dialog__f10__title;

  /// No description provided for @sub_dialog__f10__subtitle.
  ///
  /// In en, this message translates to:
  /// **'E2EE will make everything encrypted for superior privacy.'**
  String get sub_dialog__f10__subtitle;

  /// No description provided for @sub_dialog__text__pro_title.
  ///
  /// In en, this message translates to:
  /// **'With PRO'**
  String get sub_dialog__text__pro_title;

  /// No description provided for @sub_dialog__text__pro_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Everything included in Core +'**
  String get sub_dialog__text__pro_subtitle;

  /// No description provided for @sub_dialog__f11__title.
  ///
  /// In en, this message translates to:
  /// **'Up to 50 Collections'**
  String get sub_dialog__f11__title;

  /// No description provided for @sub_dialog__f11__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Organize your clipboard items into up to 50 collections for ultimate management.'**
  String get sub_dialog__f11__subtitle;

  /// No description provided for @sub_dialog__f12__title.
  ///
  /// In en, this message translates to:
  /// **'Syncing Up to the Last 30 Days'**
  String get sub_dialog__f12__title;

  /// No description provided for @sub_dialog__f12__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Clipboard history is synced across all your devices for clips created within the last 30 days. This means you can access any clip you copied in the past month, no matter which device you are using.'**
  String get sub_dialog__f12__subtitle;

  /// No description provided for @sub_dialog__f13__title.
  ///
  /// In en, this message translates to:
  /// **'Real Time Synchronization'**
  String get sub_dialog__f13__title;

  /// No description provided for @sub_dialog__f13__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Experience lightning-fast syncing.'**
  String get sub_dialog__f13__subtitle;

  /// No description provided for @sub_dialog__f14__title.
  ///
  /// In en, this message translates to:
  /// **'Faster and Priority Support'**
  String get sub_dialog__f14__title;

  /// No description provided for @sub_dialog__f14__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Get prompt and prioritized support as a PRO user.'**
  String get sub_dialog__f14__subtitle;

  /// No description provided for @sub_dialog__f15__title.
  ///
  /// In en, this message translates to:
  /// **'Early Access to New Features'**
  String get sub_dialog__f15__title;

  /// No description provided for @sub_dialog__f15__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Be the first to try out new features and updates.'**
  String get sub_dialog__f15__subtitle;

  /// No description provided for @sub_dialog__f16__title.
  ///
  /// In en, this message translates to:
  /// **'Custom Exclusion Rules'**
  String get sub_dialog__f16__title;

  /// No description provided for @sub_dialog__f16__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Precise control over your clipboard. Allows you to define what to copy, from where to copy and when to copy.'**
  String get sub_dialog__f16__subtitle;

  /// No description provided for @sub_dialog__f17__title.
  ///
  /// In en, this message translates to:
  /// **'Drag & Drop'**
  String get sub_dialog__f17__title;

  /// No description provided for @sub_dialog__f17__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Seamlessly move items in any direction on your Desktop and Tablet devices.'**
  String get sub_dialog__f17__subtitle;

  /// No description provided for @sub_dialog__f18__title.
  ///
  /// In en, this message translates to:
  /// **'Theming'**
  String get sub_dialog__f18__title;

  /// No description provided for @sub_dialog__f18__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize the entire look and feel of the app to match your preferences.'**
  String get sub_dialog__f18__subtitle;

  /// No description provided for @paywall_dialog__text__month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get paywall_dialog__text__month;

  /// No description provided for @paywall_dialog__text__year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get paywall_dialog__text__year;

  /// No description provided for @paywall_dialog__text__subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get paywall_dialog__text__subscription;

  /// No description provided for @paywall_dialog__text__supported_platform.
  ///
  /// In en, this message translates to:
  /// **'To access premium features on Copycat Clipboard, please subscribe through the Play Store or Apple App Store. Your subscription will be synced across all your devices, including Linux and Windows.'**
  String get paywall_dialog__text__supported_platform;

  /// No description provided for @paywall_dialog__text__unlock_pro.
  ///
  /// In en, this message translates to:
  /// **'Unlock CopyCat PRO'**
  String get paywall_dialog__text__unlock_pro;

  /// No description provided for @paywall_dialog__text__unlock_pro_p1.
  ///
  /// In en, this message translates to:
  /// **'Enjoy over 30 days of synced history, over 50 collections, end-to-end encryption, real-time syncing, access to the newest features, and much more.'**
  String get paywall_dialog__text__unlock_pro_p1;

  /// No description provided for @paywall_dialog__text__try_again.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get paywall_dialog__text__try_again;

  /// No description provided for @paywall_dialog__text__current_plan.
  ///
  /// In en, this message translates to:
  /// **'Current Plan'**
  String get paywall_dialog__text__current_plan;

  /// No description provided for @paywall_dialog__text__expired_plan.
  ///
  /// In en, this message translates to:
  /// **'Current Plan • Expired'**
  String get paywall_dialog__text__expired_plan;

  /// No description provided for @paywall_dialog__text__trial_till.
  ///
  /// In en, this message translates to:
  /// **'Trial till {till}'**
  String paywall_dialog__text__trial_till({required DateTime till});

  /// No description provided for @paywall_dialog__text__upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get paywall_dialog__text__upgrade;

  /// No description provided for @fab__create_collection.
  ///
  /// In en, this message translates to:
  /// **'Create Collection ( {remaining} Remaining )'**
  String fab__create_collection({required String remaining});

  /// No description provided for @fab__sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get fab__sync;

  /// No description provided for @fab__sync_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Sync Unavailable'**
  String get fab__sync_unavailable;

  /// No description provided for @fab__sync_up_to_date.
  ///
  /// In en, this message translates to:
  /// **'Already up to date.'**
  String get fab__sync_up_to_date;

  /// No description provided for @fab__sync_failed.
  ///
  /// In en, this message translates to:
  /// **'Sync failed : {message}'**
  String fab__sync_failed({required String message});

  /// No description provided for @layout__navbar__clipboard.
  ///
  /// In en, this message translates to:
  /// **'Clipboard'**
  String get layout__navbar__clipboard;

  /// No description provided for @layout__navbar__collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get layout__navbar__collections;

  /// No description provided for @layout__navbar__settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get layout__navbar__settings;

  /// No description provided for @search__tooltip__filter.
  ///
  /// In en, this message translates to:
  /// **'Search filters'**
  String get search__tooltip__filter;

  /// No description provided for @manage_sub__ack__promo_sub.
  ///
  /// In en, this message translates to:
  /// **'You are using a promo subscription till {till}'**
  String manage_sub__ack__promo_sub({required String till});

  /// No description provided for @manage_sub__button__text.
  ///
  /// In en, this message translates to:
  /// **'Manage Subscriptions'**
  String get manage_sub__button__text;

  /// No description provided for @my_account__button__tooltip.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get my_account__button__tooltip;

  /// No description provided for @badges__tooltip__experimental.
  ///
  /// In en, this message translates to:
  /// **'This feature is experimental and might not work as expected.'**
  String get badges__tooltip__experimental;

  /// No description provided for @badges__label__pro.
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get badges__label__pro;

  /// No description provided for @badges__tooltip__pro_only.
  ///
  /// In en, this message translates to:
  /// **'This feature is available for Pro users only.'**
  String get badges__tooltip__pro_only;

  /// No description provided for @collection_selector__tile__no_collection.
  ///
  /// In en, this message translates to:
  /// **'No Collection'**
  String get collection_selector__tile__no_collection;

  /// No description provided for @collection_selector__button__remove_collection.
  ///
  /// In en, this message translates to:
  /// **'Remove Collection'**
  String get collection_selector__button__remove_collection;

  /// No description provided for @dialog__logout__title.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get dialog__logout__title;

  /// No description provided for @dialog__logout__subtitle.
  ///
  /// In en, this message translates to:
  /// **'⚠️ WARNING ⚠️\n\nLogging out will delete unsynced changes in the local database. Are you sure you want to proceed?'**
  String get dialog__logout__subtitle;

  /// No description provided for @dialog__logging_out__ack.
  ///
  /// In en, this message translates to:
  /// **'Logging you out! Please wait...'**
  String get dialog__logging_out__ack;

  /// No description provided for @reset_pass__text__label.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get reset_pass__text__label;

  /// No description provided for @dnd__text__drop_here.
  ///
  /// In en, this message translates to:
  /// **'Drop Here'**
  String get dnd__text__drop_here;

  /// No description provided for @dnd__ack__error_max_drop_count.
  ///
  /// In en, this message translates to:
  /// **'Maximum {count} drop items are allowed at once.'**
  String dnd__ack__error_max_drop_count({required int count});

  /// No description provided for @search_filter__text__title.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get search_filter__text__title;

  /// No description provided for @search_filter__button__apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get search_filter__button__apply;

  /// No description provided for @search_filter__text__from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get search_filter__text__from;

  /// No description provided for @search_filter__text__select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get search_filter__text__select;

  /// No description provided for @search_filter__text__to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get search_filter__text__to;

  /// No description provided for @search_filter__text__now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get search_filter__text__now;

  /// No description provided for @search_filter__text__including.
  ///
  /// In en, this message translates to:
  /// **'Including'**
  String get search_filter__text__including;

  /// No description provided for @search_filter__chip__text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get search_filter__chip__text;

  /// No description provided for @search_filter__chip__url.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get search_filter__chip__url;

  /// No description provided for @search_filter__chip__media.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get search_filter__chip__media;

  /// No description provided for @search_filter__chip__docs.
  ///
  /// In en, this message translates to:
  /// **'Docs'**
  String get search_filter__chip__docs;

  /// No description provided for @search_filter__text__textCategories.
  ///
  /// In en, this message translates to:
  /// **'Text Categories'**
  String get search_filter__text__textCategories;

  /// No description provided for @search_filter__text__exclusive.
  ///
  /// In en, this message translates to:
  /// **'( Exclusive )'**
  String get search_filter__text__exclusive;

  /// No description provided for @search_filter__text_cat__email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get search_filter__text_cat__email;

  /// No description provided for @search_filter__text_cat__phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get search_filter__text_cat__phone;

  /// No description provided for @search_filter__text_cat__color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get search_filter__text_cat__color;

  /// No description provided for @search_filter__text_cat__struct.
  ///
  /// In en, this message translates to:
  /// **'Struct'**
  String get search_filter__text_cat__struct;

  /// No description provided for @search_filter__text__sort_by.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get search_filter__text__sort_by;

  /// No description provided for @search_filter__sort_by__last_mod.
  ///
  /// In en, this message translates to:
  /// **'Last Modified'**
  String get search_filter__sort_by__last_mod;

  /// No description provided for @search_filter__sort_by__created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get search_filter__sort_by__created;

  /// No description provided for @search_filter__sort_by__copy_count.
  ///
  /// In en, this message translates to:
  /// **'Copy Count'**
  String get search_filter__sort_by__copy_count;

  /// No description provided for @search_filter__sort_by__last_copied.
  ///
  /// In en, this message translates to:
  /// **'Last Copied'**
  String get search_filter__sort_by__last_copied;

  /// No description provided for @search_filter__text__sort_order.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get search_filter__text__sort_order;

  /// No description provided for @search_filter__sort_ord__asc.
  ///
  /// In en, this message translates to:
  /// **'Asc'**
  String get search_filter__sort_ord__asc;

  /// No description provided for @search_filter__sort_ord__desc.
  ///
  /// In en, this message translates to:
  /// **'Desc'**
  String get search_filter__sort_ord__desc;

  /// No description provided for @search_filter__tooltip__clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get search_filter__tooltip__clear;

  /// No description provided for @search_filter__empty.
  ///
  /// In en, this message translates to:
  /// **'∅'**
  String get search_filter__empty;

  /// No description provided for @search_filter__button__reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get search_filter__button__reset;

  /// No description provided for @login__local_signin__tooltip.
  ///
  /// In en, this message translates to:
  /// **'No syncing. All data stays on your device.'**
  String get login__local_signin__tooltip;

  /// No description provided for @login__local_signin__btn__label.
  ///
  /// In en, this message translates to:
  /// **'Offline Mode'**
  String get login__local_signin__btn__label;

  /// No description provided for @login__form__input__name.
  ///
  /// In en, this message translates to:
  /// **'Enter your good name'**
  String get login__form__input__name;

  /// No description provided for @login__form__input__email.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get login__form__input__email;

  /// No description provided for @login__form__input__error_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get login__form__input__error_email;

  /// No description provided for @login__form__input__password.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get login__form__input__password;

  /// No description provided for @login__form__input__error_password_length.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password that is at least 6 characters long'**
  String get login__form__input__error_password_length;

  /// No description provided for @login__form__button__signin.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get login__form__button__signin;

  /// No description provided for @login__form__button__signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get login__form__button__signup;

  /// No description provided for @login__form__button__forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get login__form__button__forgot_password;

  /// No description provided for @login__form__text__signup.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign up'**
  String get login__form__text__signup;

  /// No description provided for @login__form__text__old_user.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get login__form__text__old_user;

  /// No description provided for @login__form__text__reset_password.
  ///
  /// In en, this message translates to:
  /// **'Send password reset email'**
  String get login__form__text__reset_password;

  /// No description provided for @login__form__text__reset_ack.
  ///
  /// In en, this message translates to:
  /// **'Password reset email has been sent'**
  String get login__form__text__reset_ack;

  /// No description provided for @login__form__button__back.
  ///
  /// In en, this message translates to:
  /// **'Back to sign in'**
  String get login__form__button__back;

  /// No description provided for @login__form__button__update_password.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get login__form__button__update_password;

  /// No description provided for @login__form__text_tnc_p1.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to the following '**
  String get login__form__text_tnc_p1;

  /// No description provided for @login__form__text_tnc_p2.
  ///
  /// In en, this message translates to:
  /// **'Privacy policies'**
  String get login__form__text_tnc_p2;

  /// No description provided for @login__form__text_tnc_p3.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get login__form__text_tnc_p3;

  /// No description provided for @login__form__text_tnc_p4.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service.'**
  String get login__form__text_tnc_p4;

  /// No description provided for @home__search__hint.
  ///
  /// In en, this message translates to:
  /// **'Search in clipboard'**
  String get home__search__hint;

  /// No description provided for @collections__search__hint.
  ///
  /// In en, this message translates to:
  /// **'Search collection'**
  String get collections__search__hint;

  /// No description provided for @home__search__reset.
  ///
  /// In en, this message translates to:
  /// **'Reset Search'**
  String get home__search__reset;

  /// No description provided for @preview__vert_view__tab1_title.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview__vert_view__tab1_title;

  /// No description provided for @preview__vert_view__tab2__title.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get preview__vert_view__tab2__title;

  /// No description provided for @preview__card__missing_text.
  ///
  /// In en, this message translates to:
  /// **'This is an Empty Clip'**
  String get preview__card__missing_text;

  /// No description provided for @preview__card__video__play.
  ///
  /// In en, this message translates to:
  /// **'Play Video'**
  String get preview__card__video__play;

  /// No description provided for @preview__card__video__mute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get preview__card__video__mute;

  /// No description provided for @preview__card__video__unmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get preview__card__video__unmute;

  /// No description provided for @preview__card__video__close.
  ///
  /// In en, this message translates to:
  /// **'Close player'**
  String get preview__card__video__close;

  /// No description provided for @preview__card__file__open.
  ///
  /// In en, this message translates to:
  /// **'Open File'**
  String get preview__card__file__open;

  /// No description provided for @preview__form__title.
  ///
  /// In en, this message translates to:
  /// **'Edit Details'**
  String get preview__form__title;

  /// No description provided for @preview__inspector__lock_clip.
  ///
  /// In en, this message translates to:
  /// **'Lock Clip'**
  String get preview__inspector__lock_clip;

  /// No description provided for @preview__inspector_lock_clip_description.
  ///
  /// In en, this message translates to:
  /// **'Encrypt this clip, disable search indexing, and require authentication to view it.'**
  String get preview__inspector_lock_clip_description;

  /// No description provided for @preview__form__input__title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get preview__form__input__title;

  /// No description provided for @preview__form__input__description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get preview__form__input__description;

  /// No description provided for @preview__inspector__title.
  ///
  /// In en, this message translates to:
  /// **'Clip Details'**
  String get preview__inspector__title;

  /// No description provided for @preview__inspector__untitled.
  ///
  /// In en, this message translates to:
  /// **'Untitled Clip'**
  String get preview__inspector__untitled;

  /// No description provided for @preview__inspector__saved.
  ///
  /// In en, this message translates to:
  /// **'Details updated'**
  String get preview__inspector__saved;

  /// No description provided for @preview__inspector__save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get preview__inspector__save_changes;

  /// No description provided for @preview__inspector__decrypt.
  ///
  /// In en, this message translates to:
  /// **'Decrypt'**
  String get preview__inspector__decrypt;

  /// No description provided for @preview__inspector__open_source.
  ///
  /// In en, this message translates to:
  /// **'Open Source'**
  String get preview__inspector__open_source;

  /// No description provided for @preview__inspector__section__actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get preview__inspector__section__actions;

  /// No description provided for @preview__inspector__section__details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get preview__inspector__section__details;

  /// No description provided for @preview__inspector__section__content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get preview__inspector__section__content;

  /// No description provided for @preview__inspector__section__security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get preview__inspector__section__security;

  /// No description provided for @preview__inspector__section__organize.
  ///
  /// In en, this message translates to:
  /// **'Organize'**
  String get preview__inspector__section__organize;

  /// No description provided for @preview__inspector__label__created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get preview__inspector__label__created;

  /// No description provided for @preview__inspector__label__modified.
  ///
  /// In en, this message translates to:
  /// **'Modified'**
  String get preview__inspector__label__modified;

  /// No description provided for @preview__inspector__label__last_copied.
  ///
  /// In en, this message translates to:
  /// **'Last Copied'**
  String get preview__inspector__label__last_copied;

  /// No description provided for @preview__inspector__label__copied_count.
  ///
  /// In en, this message translates to:
  /// **'Copied Count'**
  String get preview__inspector__label__copied_count;

  /// No description provided for @preview__inspector__label__source_app.
  ///
  /// In en, this message translates to:
  /// **'Source App'**
  String get preview__inspector__label__source_app;

  /// No description provided for @preview__inspector__label__source_url.
  ///
  /// In en, this message translates to:
  /// **'Source URL'**
  String get preview__inspector__label__source_url;

  /// No description provided for @preview__inspector__label__file_size.
  ///
  /// In en, this message translates to:
  /// **'File Size'**
  String get preview__inspector__label__file_size;

  /// No description provided for @preview__inspector__label__mime_type.
  ///
  /// In en, this message translates to:
  /// **'MIME Type'**
  String get preview__inspector__label__mime_type;

  /// No description provided for @preview__inspector__label__extension.
  ///
  /// In en, this message translates to:
  /// **'Extension'**
  String get preview__inspector__label__extension;

  /// No description provided for @preview__inspector__label__characters.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get preview__inspector__label__characters;

  /// No description provided for @preview__inspector__label__lines.
  ///
  /// In en, this message translates to:
  /// **'Lines'**
  String get preview__inspector__label__lines;

  /// No description provided for @preview__inspector__label__link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get preview__inspector__label__link;

  /// No description provided for @preview__inspector__label__image_dimension.
  ///
  /// In en, this message translates to:
  /// **'Dimension'**
  String get preview__inspector__label__image_dimension;

  /// No description provided for @preview__inspector__label__device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get preview__inspector__label__device;

  /// No description provided for @preview__inspector__label__storage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get preview__inspector__label__storage;

  /// No description provided for @preview__inspector__status__encrypted.
  ///
  /// In en, this message translates to:
  /// **'Encrypted'**
  String get preview__inspector__status__encrypted;

  /// No description provided for @preview__inspector__status__local_only.
  ///
  /// In en, this message translates to:
  /// **'Local Only'**
  String get preview__inspector__status__local_only;

  /// No description provided for @preview__inspector__status__synced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get preview__inspector__status__synced;

  /// No description provided for @preview__inspector__status__not_synced.
  ///
  /// In en, this message translates to:
  /// **'Not Synced'**
  String get preview__inspector__status__not_synced;

  /// No description provided for @preview__inspector__status__download_required.
  ///
  /// In en, this message translates to:
  /// **'Download Required'**
  String get preview__inspector__status__download_required;

  /// No description provided for @preview__inspector__status__available.
  ///
  /// In en, this message translates to:
  /// **'Available Offline'**
  String get preview__inspector__status__available;

  /// No description provided for @preview__inspector__type__text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get preview__inspector__type__text;

  /// No description provided for @preview__inspector__type__media.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get preview__inspector__type__media;

  /// No description provided for @preview__inspector__type__file.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get preview__inspector__type__file;

  /// No description provided for @preview__inspector__type__link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get preview__inspector__type__link;

  /// No description provided for @reset_password__appbar__title.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get reset_password__appbar__title;

  /// No description provided for @reset_password__success_ack.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get reset_password__success_ack;

  /// No description provided for @onboarding__text__welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get onboarding__text__welcome;

  /// No description provided for @onboarding__text__lets_continue.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Continue'**
  String get onboarding__text__lets_continue;

  /// No description provided for @onboarding__button__to_login.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get onboarding__button__to_login;

  /// No description provided for @onboarding__snackbar__export_success.
  ///
  /// In en, this message translates to:
  /// **'Encryption key successfully exported.'**
  String get onboarding__snackbar__export_success;

  /// No description provided for @onboarding__dialog__skip_export__title.
  ///
  /// In en, this message translates to:
  /// **'✋ Backup Your Encryption Key'**
  String get onboarding__dialog__skip_export__title;

  /// No description provided for @onboarding__dialog__skip_export__subtitle.
  ///
  /// In en, this message translates to:
  /// **'You haven’t exported your encryption key yet. Without a backup, you won’t be able to access your encrypted clips if the key is lost or you switch devices.\n\n👉 If you already have a secure backup of your key, you can safely continue. Otherwise, we strongly recommend exporting the key now to avoid data loss. Do you still want to continue?'**
  String get onboarding__dialog__skip_export__subtitle;

  /// No description provided for @onboarding__dialog__export_info__title.
  ///
  /// In en, this message translates to:
  /// **'🤔 Why Export the Encryption Key?'**
  String get onboarding__dialog__export_info__title;

  /// No description provided for @onboarding__dialog__export_info__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Exporting your encryption key is essential for securely accessing your encrypted data on multiple devices. Without the key, your encrypted data will remain inaccessible after sync.\n\nKeep a backup of your encryption key in a secure location to prevent data loss. Remember, the key is unique to your account and cannot be recovered if lost.\n\nNote: Copycat cannot access your encrypted clips or your encryption keys. This is because we value your privacy above everything else.'**
  String get onboarding__dialog__export_info__subtitle;

  /// No description provided for @onboarding__text__export_key_headline.
  ///
  /// In en, this message translates to:
  /// **'Clipboard Encryption'**
  String get onboarding__text__export_key_headline;

  /// No description provided for @onboarding__text__export_key_title.
  ///
  /// In en, this message translates to:
  /// **'💪 Great News! Encryption is active for your clipboard'**
  String get onboarding__text__export_key_title;

  /// No description provided for @onboarding__button__export_key.
  ///
  /// In en, this message translates to:
  /// **'Export Key'**
  String get onboarding__button__export_key;

  /// No description provided for @onboarding__dialog__skip_gen_key__title.
  ///
  /// In en, this message translates to:
  /// **'✋ Your Clips Will Be Insecure'**
  String get onboarding__dialog__skip_gen_key__title;

  /// No description provided for @onboarding__dialog__skip_gen_key__subtitle.
  ///
  /// In en, this message translates to:
  /// **'You haven’t generated an encryption key yet. Without it, your clips will remain unencrypted and insecure. You can generate the key later in Settings ❯ Security. Do you still want to continue?'**
  String get onboarding__dialog__skip_gen_key__subtitle;

  /// No description provided for @onboarding__dialog__gen_key_info__title.
  ///
  /// In en, this message translates to:
  /// **'🤔 Why Do I Need Encryption?'**
  String get onboarding__dialog__gen_key_info__title;

  /// No description provided for @onboarding__dialog__gen_key_info__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Encryption protects your data by converting it into a secure format that can only be accessed with a key. Without encryption, your clips are stored in plain text, making them vulnerable to unauthorized access. Enabling encryption ensures that only you can access your sensitive data, providing an extra layer of security against potential breaches.'**
  String get onboarding__dialog__gen_key_info__subtitle;

  /// No description provided for @onboarding__text__gen_key_headline.
  ///
  /// In en, this message translates to:
  /// **'Setup Clipboard Encryption'**
  String get onboarding__text__gen_key_headline;

  /// No description provided for @onboarding__text__key_generated_title.
  ///
  /// In en, this message translates to:
  /// **'🎉 Key {keyPreview}*** successfully generated 🎉'**
  String onboarding__text__key_generated_title({required String keyPreview});

  /// No description provided for @onboarding__button__regenerate_key.
  ///
  /// In en, this message translates to:
  /// **'Re-Generate Key'**
  String get onboarding__button__regenerate_key;

  /// No description provided for @onboarding__text__no_key.
  ///
  /// In en, this message translates to:
  /// **'Your account doesn\'t have any encryption key'**
  String get onboarding__text__no_key;

  /// No description provided for @onboarding__button__generate_key.
  ///
  /// In en, this message translates to:
  /// **'Generate Key'**
  String get onboarding__button__generate_key;

  /// No description provided for @onboarding__button__do_it_later.
  ///
  /// In en, this message translates to:
  /// **'Do it later'**
  String get onboarding__button__do_it_later;

  /// No description provided for @onboarding__button__why_important.
  ///
  /// In en, this message translates to:
  /// **'Why It\'s Important?'**
  String get onboarding__button__why_important;

  /// No description provided for @onboarding__snackbar__invalid_key.
  ///
  /// In en, this message translates to:
  /// **'This is not a valid CopyCat encryption key'**
  String get onboarding__snackbar__invalid_key;

  /// No description provided for @onboarding__dialog__skip_import__title.
  ///
  /// In en, this message translates to:
  /// **'✋ Encrypted Clips Inaccessible'**
  String get onboarding__dialog__skip_import__title;

  /// No description provided for @onboarding__dialog__skip_import__subtitle.
  ///
  /// In en, this message translates to:
  /// **'You haven’t imported the encryption key yet. This means all your encrypted clips will remain inaccessible locally after sync.\n\nTo access them, import the key from Settings ❯ Security.\nDo you still want to continue?'**
  String get onboarding__dialog__skip_import__subtitle;

  /// No description provided for @onboarding__dialog__reset_key__title.
  ///
  /// In en, this message translates to:
  /// **'✋ Permanently Delete Encrypted Data'**
  String get onboarding__dialog__reset_key__title;

  /// No description provided for @onboarding__dialog__reset_key__subtitle.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible. Are you sure you want to permanently delete all encrypted data from the server?'**
  String get onboarding__dialog__reset_key__subtitle;

  /// No description provided for @onboarding__snackbar__reset_key__success.
  ///
  /// In en, this message translates to:
  /// **'Encryption successfully removed.'**
  String get onboarding__snackbar__reset_key__success;

  /// No description provided for @onboarding__dialog__import_info__title.
  ///
  /// In en, this message translates to:
  /// **'🤔 Where is my key?'**
  String get onboarding__dialog__import_info__title;

  /// No description provided for @onboarding__dialog__import_info__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your encryption key is a secure file generated during the encryption setup process. If you’ve misplaced it, check your downloads folder or any backup location where you might have saved it. Without this key, your encrypted data cannot be accessed.\n\nIf you’ve set up the encryption key on another device, you can export it by going to Settings ❯ Security ❯ E2EE Vault on that device. Transfer the key securely to this device to regain access to your encrypted data.'**
  String get onboarding__dialog__import_info__subtitle;

  /// No description provided for @onboarding__text__import_key_headline.
  ///
  /// In en, this message translates to:
  /// **'Import Clipboard Encryption Key'**
  String get onboarding__text__import_key_headline;

  /// No description provided for @onboarding__text__import_key_title.
  ///
  /// In en, this message translates to:
  /// **'Your account currently has active encryption.'**
  String get onboarding__text__import_key_title;

  /// No description provided for @onboarding__button__import_key.
  ///
  /// In en, this message translates to:
  /// **'Import Key'**
  String get onboarding__button__import_key;

  /// No description provided for @onboarding__button__reset_key.
  ///
  /// In en, this message translates to:
  /// **'Reset Encryption'**
  String get onboarding__button__reset_key;

  /// No description provided for @onboarding__button__where_key.
  ///
  /// In en, this message translates to:
  /// **'Where is the key?'**
  String get onboarding__button__where_key;

  /// No description provided for @onboarding__text__go_home.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go home'**
  String get onboarding__text__go_home;

  /// No description provided for @onboarding__restoration__failed.
  ///
  /// In en, this message translates to:
  /// **'Restoration failed: {message}'**
  String onboarding__restoration__failed({required String message});

  /// No description provided for @onboarding__restoration_warning.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Please keep this screen open during syncing to avoid data corruption or inconsistencies.'**
  String get onboarding__restoration_warning;

  /// No description provided for @sync_restore__title.
  ///
  /// In en, this message translates to:
  /// **'Restoring your workspace'**
  String get sync_restore__title;

  /// No description provided for @sync_restore__subtitle.
  ///
  /// In en, this message translates to:
  /// **'CopyCat is bringing your synced collections and clipboard history onto this device.'**
  String get sync_restore__subtitle;

  /// No description provided for @sync_restore__checking_backup.
  ///
  /// In en, this message translates to:
  /// **'Checking remote backup...'**
  String get sync_restore__checking_backup;

  /// No description provided for @sync_restore__decrypting_title.
  ///
  /// In en, this message translates to:
  /// **'Decrypting clips'**
  String get sync_restore__decrypting_title;

  /// No description provided for @sync_restore__decrypting_counting.
  ///
  /// In en, this message translates to:
  /// **'Counting encrypted clips...'**
  String get sync_restore__decrypting_counting;

  /// No description provided for @sync_restore__decrypting_progress.
  ///
  /// In en, this message translates to:
  /// **'Decrypted {decrypted} of {total}'**
  String sync_restore__decrypting_progress({
    required int decrypted,
    required int total,
  });

  /// No description provided for @sync_restore__workspace_restored.
  ///
  /// In en, this message translates to:
  /// **'Workspace restored'**
  String get sync_restore__workspace_restored;

  /// No description provided for @sync_restore__data_ready.
  ///
  /// In en, this message translates to:
  /// **'Your synced data is ready on this device.'**
  String get sync_restore__data_ready;

  /// No description provided for @sync_restore__restoring_collections.
  ///
  /// In en, this message translates to:
  /// **'Restoring collections so clipboard items keep their organization.'**
  String get sync_restore__restoring_collections;

  /// No description provided for @sync_restore__restoring_clips.
  ///
  /// In en, this message translates to:
  /// **'Collections are restored. Clipboard history is next.'**
  String get sync_restore__restoring_clips;

  /// No description provided for @sync_restore__finishing_checks.
  ///
  /// In en, this message translates to:
  /// **'Finishing restore checks.'**
  String get sync_restore__finishing_checks;

  /// No description provided for @sync_restore__no_synced_items.
  ///
  /// In en, this message translates to:
  /// **'No synced items found'**
  String get sync_restore__no_synced_items;

  /// No description provided for @sync_restore__restored_count.
  ///
  /// In en, this message translates to:
  /// **'{count} restored'**
  String sync_restore__restored_count({required int count});

  /// No description provided for @sync_restore__restored_of_total.
  ///
  /// In en, this message translates to:
  /// **'{synced} of {total} restored'**
  String sync_restore__restored_of_total({
    required int synced,
    required int total,
  });

  /// No description provided for @sync_restore__progress_estimating.
  ///
  /// In en, this message translates to:
  /// **'Estimating'**
  String get sync_restore__progress_estimating;

  /// No description provided for @sync_restore__progress_complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get sync_restore__progress_complete;

  /// No description provided for @sync_restore__status_ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get sync_restore__status_ready;

  /// No description provided for @sync_restore__status_restoring.
  ///
  /// In en, this message translates to:
  /// **'Restoring'**
  String get sync_restore__status_restoring;

  /// No description provided for @sync_restore__collections_title.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get sync_restore__collections_title;

  /// No description provided for @sync_restore__collections_description.
  ///
  /// In en, this message translates to:
  /// **'Saved groups and organization'**
  String get sync_restore__collections_description;

  /// No description provided for @sync_restore__clipboard_items_title.
  ///
  /// In en, this message translates to:
  /// **'Clipboard items'**
  String get sync_restore__clipboard_items_title;

  /// No description provided for @sync_restore__clipboard_items_description.
  ///
  /// In en, this message translates to:
  /// **'History, text, links, files, and media'**
  String get sync_restore__clipboard_items_description;

  /// No description provided for @sync_restore__count_of_total.
  ///
  /// In en, this message translates to:
  /// **'of {total}'**
  String sync_restore__count_of_total({required int total});

  /// No description provided for @sync_restore__continue_to_copycat.
  ///
  /// In en, this message translates to:
  /// **'Continue to CopyCat'**
  String get sync_restore__continue_to_copycat;

  /// No description provided for @sync_restore__failed_title.
  ///
  /// In en, this message translates to:
  /// **'Restoration failed'**
  String get sync_restore__failed_title;

  /// No description provided for @restore_clips__text__title.
  ///
  /// In en, this message translates to:
  /// **'Restore My Clipboard'**
  String get restore_clips__text__title;

  /// No description provided for @restore_clips__error__no_backup.
  ///
  /// In en, this message translates to:
  /// **'No clipboard backup found'**
  String get restore_clips__error__no_backup;

  /// No description provided for @restore_clips__text__total_count.
  ///
  /// In en, this message translates to:
  /// **'You have approximately {totalCount} {totalCount, plural, other{clips} one{clip} zero{clip}} to restore.'**
  String restore_clips__text__total_count({required int totalCount});

  /// No description provided for @restore_clips__sync_disable.
  ///
  /// In en, this message translates to:
  /// **'Syncing is currently disabled. Please enable it to continue.'**
  String get restore_clips__sync_disable;

  /// No description provided for @restore_clips__preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing to restore clips. Please wait...'**
  String get restore_clips__preparing;

  /// No description provided for @restore_clips__restored.
  ///
  /// In en, this message translates to:
  /// **'Your {syncCount} {syncCount, plural, other{clips} one{clip} zero{clip}} have been restored successfully.'**
  String restore_clips__restored({required int syncCount});

  /// No description provided for @restore_clips__restoring.
  ///
  /// In en, this message translates to:
  /// **'Restored: {synced} of {totalCount} clips.'**
  String restore_clips__restoring({
    required int synced,
    required int totalCount,
  });

  /// No description provided for @restore_collections__text__title.
  ///
  /// In en, this message translates to:
  /// **'Restore My Collections'**
  String get restore_collections__text__title;

  /// No description provided for @restore_collections__error__no_backup.
  ///
  /// In en, this message translates to:
  /// **'No collection backup found'**
  String get restore_collections__error__no_backup;

  /// No description provided for @restore_collections__text__total_count.
  ///
  /// In en, this message translates to:
  /// **'You have approximately {totalCount} {totalCount, plural, other{collections} one{collection} zero{collection}} to restore.'**
  String restore_collections__text__total_count({required int totalCount});

  /// No description provided for @restore_collections__sync_disable.
  ///
  /// In en, this message translates to:
  /// **'Syncing is currently disabled. Please enable it to continue.'**
  String get restore_collections__sync_disable;

  /// No description provided for @restore_collections__preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing to restore collections. Please wait...'**
  String get restore_collections__preparing;

  /// No description provided for @restore_collections__restored.
  ///
  /// In en, this message translates to:
  /// **'Your {syncCount} {syncCount, plural, other{collections} one{collection} zero{collection}} have been restored successfully.'**
  String restore_collections__restored({required int syncCount});

  /// No description provided for @restore_collections__restoring.
  ///
  /// In en, this message translates to:
  /// **'Restored: {synced} of {totalCount} collections.'**
  String restore_collections__restoring({
    required int synced,
    required int totalCount,
  });

  /// No description provided for @drive__snackbar__success.
  ///
  /// In en, this message translates to:
  /// **'Drive Setup is Now Complete.'**
  String get drive__snackbar__success;

  /// No description provided for @drive__text__setting_up.
  ///
  /// In en, this message translates to:
  /// **'Setting up and syncing...'**
  String get drive__text__setting_up;

  /// No description provided for @drive__text__setting_up__warning.
  ///
  /// In en, this message translates to:
  /// **'Please wait while we finish this up. Do not close the app.'**
  String get drive__text__setting_up__warning;

  /// No description provided for @create_clip__appbar__title__new.
  ///
  /// In en, this message translates to:
  /// **'New Clip'**
  String get create_clip__appbar__title__new;

  /// No description provided for @create_clip__appbar__title__edit.
  ///
  /// In en, this message translates to:
  /// **'Edit Clip'**
  String get create_clip__appbar__title__edit;

  /// No description provided for @create_clip__button__save_new.
  ///
  /// In en, this message translates to:
  /// **'Save as new'**
  String get create_clip__button__save_new;

  /// No description provided for @create_clip__input__hint.
  ///
  /// In en, this message translates to:
  /// **'Write your clip content here'**
  String get create_clip__input__hint;

  /// No description provided for @collections__text__tip.
  ///
  /// In en, this message translates to:
  /// **'To ensure your important clips are always available regardless of time, across all your devices, save them in a collection!'**
  String get collections__text__tip;

  /// No description provided for @collections__appbar__title.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections__appbar__title;

  /// No description provided for @collections__appbar__title__create.
  ///
  /// In en, this message translates to:
  /// **'Create Collection'**
  String get collections__appbar__title__create;

  /// No description provided for @collections__appbar__title__edit.
  ///
  /// In en, this message translates to:
  /// **'Edit Collection'**
  String get collections__appbar__title__edit;

  /// No description provided for @collections__input__name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get collections__input__name;

  /// No description provided for @collections__input__description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get collections__input__description;

  /// No description provided for @collections__label__emoji.
  ///
  /// In en, this message translates to:
  /// **'Collection Icon (Click to change)'**
  String get collections__label__emoji;

  /// No description provided for @collections__validation__duplicate.
  ///
  /// In en, this message translates to:
  /// **'A collection with this icon and name already exists'**
  String get collections__validation__duplicate;

  /// No description provided for @collections__validation__name_required.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get collections__validation__name_required;

  /// No description provided for @collections__validation__name_max_length.
  ///
  /// In en, this message translates to:
  /// **'Name must be 30 characters or fewer'**
  String get collections__validation__name_max_length;

  /// No description provided for @select_collection__appbar__title.
  ///
  /// In en, this message translates to:
  /// **'Select Collection'**
  String get select_collection__appbar__title;

  /// No description provided for @account__dialog__delete_confirm__title.
  ///
  /// In en, this message translates to:
  /// **'Account Delete Request'**
  String get account__dialog__delete_confirm__title;

  /// No description provided for @account__dialog__delete_confirm__description.
  ///
  /// In en, this message translates to:
  /// **'You will be redirected to the account delete request form, are you sure?'**
  String get account__dialog__delete_confirm__description;

  /// No description provided for @account__list_tile__display_name.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get account__list_tile__display_name;

  /// No description provided for @account__list_tile__email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get account__list_tile__email;

  /// No description provided for @account__list_tile__settings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get account__list_tile__settings;

  /// No description provided for @account__list_tile__danger_zone.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get account__list_tile__danger_zone;

  /// No description provided for @account__button__req_delete.
  ///
  /// In en, this message translates to:
  /// **'Request Account Deletion'**
  String get account__button__req_delete;

  /// No description provided for @account__appbar__title.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get account__appbar__title;

  /// No description provided for @settings__appbar__title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings__appbar__title;

  /// No description provided for @settings__header__appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settings__header__appearance;

  /// No description provided for @settings__header__sorting.
  ///
  /// In en, this message translates to:
  /// **'Default Sorting'**
  String get settings__header__sorting;

  /// No description provided for @settings__header__interactions.
  ///
  /// In en, this message translates to:
  /// **'Interactions'**
  String get settings__header__interactions;

  /// No description provided for @settings__tab__1.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settings__tab__1;

  /// No description provided for @settings__tab__2.
  ///
  /// In en, this message translates to:
  /// **'Customization'**
  String get settings__tab__2;

  /// No description provided for @settings__tab__3.
  ///
  /// In en, this message translates to:
  /// **'Cloud'**
  String get settings__tab__3;

  /// No description provided for @settings__tab__4.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settings__tab__4;

  /// No description provided for @settings__tab__5.
  ///
  /// In en, this message translates to:
  /// **'Experimental'**
  String get settings__tab__5;

  /// No description provided for @settings__text__encryption.
  ///
  /// In en, this message translates to:
  /// **'Encryption'**
  String get settings__text__encryption;

  /// No description provided for @settings__text__sync_not_available.
  ///
  /// In en, this message translates to:
  /// **'Sync-related configurations are not available while using the local clipboard.'**
  String get settings__text__sync_not_available;

  /// No description provided for @settings__appbar__er__title.
  ///
  /// In en, this message translates to:
  /// **'Exclusion Rules'**
  String get settings__appbar__er__title;

  /// No description provided for @settings__text__er__predefine.
  ///
  /// In en, this message translates to:
  /// **'Predefined Exclusion Rules'**
  String get settings__text__er__predefine;

  /// No description provided for @settings__text__er__pass_manager.
  ///
  /// In en, this message translates to:
  /// **'Password Managers'**
  String get settings__text__er__pass_manager;

  /// No description provided for @settings__text__er__pass_manager__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Exclude captures from password manager apps'**
  String get settings__text__er__pass_manager__subtitle;

  /// No description provided for @settings__text__er__cc.
  ///
  /// In en, this message translates to:
  /// **'Credit Card Number'**
  String get settings__text__er__cc;

  /// No description provided for @settings__text__er__cc__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Exclude detected credit card numbers'**
  String get settings__text__er__cc__subtitle;

  /// No description provided for @settings__text__er__phone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get settings__text__er__phone;

  /// No description provided for @settings__text__er__phone__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Exclude detected phone numbers'**
  String get settings__text__er__phone__subtitle;

  /// No description provided for @settings__text__er__email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get settings__text__er__email;

  /// No description provided for @settings__text__er__email__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Exclude detected email addresses'**
  String get settings__text__er__email__subtitle;

  /// No description provided for @settings__text__er__url.
  ///
  /// In en, this message translates to:
  /// **'Sensitive Url'**
  String get settings__text__er__url;

  /// No description provided for @settings__text__er__url__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Exclude captures containing sensitive URLs'**
  String get settings__text__er__url__subtitle;

  /// No description provided for @settings__text__decrypted__note.
  ///
  /// In en, this message translates to:
  /// **'🥳 Congratulations! All your clips have been successfully decrypted locally,\n so rebuilding the database is not required.'**
  String get settings__text__decrypted__note;

  /// No description provided for @settings__appbar__cer__title.
  ///
  /// In en, this message translates to:
  /// **'Custom Exclusion Rules'**
  String get settings__appbar__cer__title;

  /// No description provided for @settings__switch__drag_n_drop__title.
  ///
  /// In en, this message translates to:
  /// **'Drag and Drop'**
  String get settings__switch__drag_n_drop__title;

  /// No description provided for @settings__switch__drag_n_drop__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow items to be moved freely in both directions within the app.'**
  String get settings__switch__drag_n_drop__subtitle;

  /// No description provided for @settings__dropdown__no_copy_over_limit__title.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Auto Copy Over'**
  String get settings__dropdown__no_copy_over_limit__title;

  /// No description provided for @settings__dropdown__no_copy_over_limit__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Files and Media over a certain size ({fileSize}) will not be copied automatically.'**
  String settings__dropdown__no_copy_over_limit__subtitle({
    required String fileSize,
  });

  /// No description provided for @settings__text__5MB.
  ///
  /// In en, this message translates to:
  /// **'5 MB'**
  String get settings__text__5MB;

  /// No description provided for @settings__text__10MB.
  ///
  /// In en, this message translates to:
  /// **'10 MB'**
  String get settings__text__10MB;

  /// No description provided for @settings__text__20MB.
  ///
  /// In en, this message translates to:
  /// **'20 MB'**
  String get settings__text__20MB;

  /// No description provided for @settings__text__50MB.
  ///
  /// In en, this message translates to:
  /// **'50 MB'**
  String get settings__text__50MB;

  /// No description provided for @settings__text__100MB.
  ///
  /// In en, this message translates to:
  /// **'100 MB'**
  String get settings__text__100MB;

  /// No description provided for @settings__dropdown__no_upload_over_limit__title.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Auto Upload Over'**
  String get settings__dropdown__no_upload_over_limit__title;

  /// No description provided for @settings__dropdown__no_upload_over_limit__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Files and Media over a certain size ({fileSize}) will not be uploaded automatically.'**
  String settings__dropdown__no_upload_over_limit__subtitle({
    required String fileSize,
  });

  /// No description provided for @settings__dropdown__sync_mode__title.
  ///
  /// In en, this message translates to:
  /// **'Sync Mode'**
  String get settings__dropdown__sync_mode__title;

  /// No description provided for @settings__dropdown__sync_mode__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the syncing speed that works best for you.'**
  String get settings__dropdown__sync_mode__subtitle;

  /// No description provided for @settings__sync_mode__realtime.
  ///
  /// In en, this message translates to:
  /// **'Realtime'**
  String get settings__sync_mode__realtime;

  /// No description provided for @settings__sync_mode__balanced.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get settings__sync_mode__balanced;

  /// No description provided for @settings__dropdown__theme__title.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get settings__dropdown__theme__title;

  /// No description provided for @settings__dropdown__default_sort__title.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get settings__dropdown__default_sort__title;

  /// No description provided for @settings__dropdown__default_sort_order__title.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get settings__dropdown__default_sort_order__title;

  /// No description provided for @settings__theme__system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settings__theme__system;

  /// No description provided for @settings__theme__light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settings__theme__light;

  /// No description provided for @settings__theme__dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settings__theme__dark;

  /// No description provided for @settings__dropdown__color_mode__title.
  ///
  /// In en, this message translates to:
  /// **'Color Mode'**
  String get settings__dropdown__color_mode__title;

  /// No description provided for @settings__dropdown__color_mode__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the color mode to customize the appearance of the app. The default option is \'Tonal Spot\'.'**
  String get settings__dropdown__color_mode__subtitle;

  /// No description provided for @settings__dropdown__clipboard_feedback__title.
  ///
  /// In en, this message translates to:
  /// **'Clipboard Feedback'**
  String get settings__dropdown__clipboard_feedback__title;

  /// No description provided for @settings__dropdown__clipboard_feedback__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how CopyCat responds when a clip is captured.'**
  String get settings__dropdown__clipboard_feedback__subtitle;

  /// No description provided for @settings__clipboard_feedback__disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get settings__clipboard_feedback__disabled;

  /// No description provided for @settings__clipboard_feedback__copy_only.
  ///
  /// In en, this message translates to:
  /// **'Copy Only'**
  String get settings__clipboard_feedback__copy_only;

  /// No description provided for @settings__clipboard_feedback__sync_only.
  ///
  /// In en, this message translates to:
  /// **'Sync Only'**
  String get settings__clipboard_feedback__sync_only;

  /// No description provided for @settings__clipboard_feedback__copy_and_sync.
  ///
  /// In en, this message translates to:
  /// **'Copy & Sync'**
  String get settings__clipboard_feedback__copy_and_sync;

  /// No description provided for @settings__clipboard_feedback__toast.
  ///
  /// In en, this message translates to:
  /// **'Toast'**
  String get settings__clipboard_feedback__toast;

  /// No description provided for @settings__color_mode__tonalSpot.
  ///
  /// In en, this message translates to:
  /// **'Tonal Spot'**
  String get settings__color_mode__tonalSpot;

  /// No description provided for @settings__color_mode__content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get settings__color_mode__content;

  /// No description provided for @settings__color_mode__expressive.
  ///
  /// In en, this message translates to:
  /// **'Expressive'**
  String get settings__color_mode__expressive;

  /// No description provided for @settings__color_mode__fidelity.
  ///
  /// In en, this message translates to:
  /// **'Fidelity'**
  String get settings__color_mode__fidelity;

  /// No description provided for @settings__color_mode__fruit_salad.
  ///
  /// In en, this message translates to:
  /// **'Fruit Salad'**
  String get settings__color_mode__fruit_salad;

  /// No description provided for @settings__color_mode__monochrome.
  ///
  /// In en, this message translates to:
  /// **'Monochrome'**
  String get settings__color_mode__monochrome;

  /// No description provided for @settings__color_mode__neutral.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get settings__color_mode__neutral;

  /// No description provided for @settings__color_mode__rainbow.
  ///
  /// In en, this message translates to:
  /// **'Rainbow'**
  String get settings__color_mode__rainbow;

  /// No description provided for @settings__color_mode__vibrant.
  ///
  /// In en, this message translates to:
  /// **'Vibrant'**
  String get settings__color_mode__vibrant;

  /// No description provided for @settings__tile__cer_title.
  ///
  /// In en, this message translates to:
  /// **'Custom Rules'**
  String get settings__tile__cer_title;

  /// No description provided for @settings__tile__cer_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Exclude by app, app window/website title, website url or regex pattern'**
  String get settings__tile__cer_subtitle;

  /// No description provided for @settings__tile__er_title.
  ///
  /// In en, this message translates to:
  /// **'Exclusion Rules'**
  String get settings__tile__er_title;

  /// No description provided for @settings__tile__er_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Prevent information from copying to clipboard. Click for Advance control.'**
  String get settings__tile__er_subtitle;

  /// No description provided for @settings__switch__enable_sync__title.
  ///
  /// In en, this message translates to:
  /// **'Clipboard Syncing'**
  String get settings__switch__enable_sync__title;

  /// No description provided for @settings__switch__enable_sync__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sync your clipboard across devices effortlessly.'**
  String get settings__switch__enable_sync__subtitle;

  /// No description provided for @settings__switch__sync_file__title.
  ///
  /// In en, this message translates to:
  /// **'File and Media Syncing'**
  String get settings__switch__sync_file__title;

  /// No description provided for @settings__switch__sync_file__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Toggle to sync files and media clips across devices.'**
  String get settings__switch__sync_file__subtitle;

  /// No description provided for @settings__switch__paused__title.
  ///
  /// In en, this message translates to:
  /// **'Pause Clipboard Listener'**
  String get settings__switch__paused__title;

  /// No description provided for @settings__switch__paused__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Temporarily pause clipboard tracking until a set time.'**
  String get settings__switch__paused__subtitle;

  /// No description provided for @settings__switch__paused_active__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Paused until {time}. Tap to resume or adjust the time.'**
  String settings__switch__paused_active__subtitle({required DateTime time});

  /// No description provided for @settings__switch__smart_paste__title.
  ///
  /// In en, this message translates to:
  /// **'Smart Paste'**
  String get settings__switch__smart_paste__title;

  /// No description provided for @settings__switch__smart_paste__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Paste content directly on the focused app.'**
  String get settings__switch__smart_paste__subtitle;

  /// No description provided for @settings__switch__focus_loss_behavior__title.
  ///
  /// In en, this message translates to:
  /// **'Keep Window Open on Focus Loss'**
  String get settings__switch__focus_loss_behavior__title;

  /// No description provided for @settings__switch__focus_loss_behavior__subtitle.
  ///
  /// In en, this message translates to:
  /// **'When CopyCat loses focus, keep it open in the background instead of hiding it automatically.'**
  String get settings__switch__focus_loss_behavior__subtitle;

  /// No description provided for @settings__switch__transform_behavior__title.
  ///
  /// In en, this message translates to:
  /// **'Save Transforms as New Clips'**
  String get settings__switch__transform_behavior__title;

  /// No description provided for @settings__switch__transform_behavior__subtitle.
  ///
  /// In en, this message translates to:
  /// **'When enabled, transform actions create a new clip instead of copying or pasting immediately.'**
  String get settings__switch__transform_behavior__subtitle;

  /// No description provided for @settings__switch__type_search__title.
  ///
  /// In en, this message translates to:
  /// **'Type to Search'**
  String get settings__switch__type_search__title;

  /// No description provided for @settings__switch__type_search__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Search clips while you type in the search bar.'**
  String get settings__switch__type_search__subtitle;

  /// No description provided for @settings__switch__startup__title.
  ///
  /// In en, this message translates to:
  /// **'Launch at Startup'**
  String get settings__switch__startup__title;

  /// No description provided for @settings__switch__startup__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Automatically start the CopyCat when your device powers on.'**
  String get settings__switch__startup__subtitle;

  /// No description provided for @settings__switch__tray_icon__title.
  ///
  /// In en, this message translates to:
  /// **'Show Menu Bar Icon'**
  String get settings__switch__tray_icon__title;

  /// No description provided for @settings__switch__tray_icon__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Display the CopyCat icon in the system menu bar / tray.'**
  String get settings__switch__tray_icon__subtitle;

  /// No description provided for @settings__switch__hide_from_screen_capture__title.
  ///
  /// In en, this message translates to:
  /// **'Hide from Screen Recording'**
  String get settings__switch__hide_from_screen_capture__title;

  /// No description provided for @settings__switch__hide_from_screen_capture__subtitle.
  ///
  /// In en, this message translates to:
  /// **'When enabled, screen captures and recordings should hide CopyCat content on supported platforms.'**
  String get settings__switch__hide_from_screen_capture__subtitle;

  /// No description provided for @settings__switch__hotkey__title.
  ///
  /// In en, this message translates to:
  /// **'Toggle with Hotkey'**
  String get settings__switch__hotkey__title;

  /// No description provided for @settings__switch__hotkey__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Use a keyboard shortcut to quickly access your CopyCat Clipboard'**
  String get settings__switch__hotkey__subtitle;

  /// No description provided for @settings__switch__paste_stack_hotkey__title.
  ///
  /// In en, this message translates to:
  /// **'Paste Stack Hotkey'**
  String get settings__switch__paste_stack_hotkey__title;

  /// No description provided for @settings__switch__paste_stack_hotkey__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Use a keyboard shortcut to open or close Paste Stack'**
  String get settings__switch__paste_stack_hotkey__subtitle;

  /// No description provided for @settings__switch__quickpaste_hotkey__title.
  ///
  /// In en, this message translates to:
  /// **'Quick Paste Hotkey'**
  String get settings__switch__quickpaste_hotkey__title;

  /// No description provided for @settings__switch__quickpaste_hotkey__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Use a keyboard shortcut to instantly access your top 10 clipboard items'**
  String get settings__switch__quickpaste_hotkey__subtitle;

  /// No description provided for @settings__hotkey__unassigned.
  ///
  /// In en, this message translates to:
  /// **'Not Assigned'**
  String get settings__hotkey__unassigned;

  /// No description provided for @settings__hotkey__preview_start.
  ///
  /// In en, this message translates to:
  /// **'Press '**
  String get settings__hotkey__preview_start;

  /// No description provided for @settings__hotkey__preview_end.
  ///
  /// In en, this message translates to:
  /// **' to show or hide the app.'**
  String get settings__hotkey__preview_end;

  /// No description provided for @settings__tile__theme_color__title.
  ///
  /// In en, this message translates to:
  /// **'Theme Color'**
  String get settings__tile__theme_color__title;

  /// No description provided for @settings__tile__theme_color__subtitle.
  ///
  /// In en, this message translates to:
  /// **'This color will influence the overall look and feel of the app.'**
  String get settings__tile__theme_color__subtitle;

  /// No description provided for @settings__tile__desk_client__title.
  ///
  /// In en, this message translates to:
  /// **'Download Desktop Client'**
  String get settings__tile__desk_client__title;

  /// No description provided for @settings__tile__mobile_client__title.
  ///
  /// In en, this message translates to:
  /// **'Download Phone Client'**
  String get settings__tile__mobile_client__title;

  /// No description provided for @settings__tile__client__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Access your clipboard on all your devices.'**
  String get settings__tile__client__subtitle;

  /// No description provided for @settings__tile__e2e_setup__title.
  ///
  /// In en, this message translates to:
  /// **'End to End Encryption Setup'**
  String get settings__tile__e2e_setup__title;

  /// No description provided for @settings__tile__e2e_setup__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Configure encryption for your clips.'**
  String get settings__tile__e2e_setup__subtitle;

  /// No description provided for @settings__switch__e2e__title.
  ///
  /// In en, this message translates to:
  /// **'Enable Encryption'**
  String get settings__switch__e2e__title;

  /// No description provided for @settings__switch__e2e__subtitle.
  ///
  /// In en, this message translates to:
  /// **'When enabled, your clips will be encrypted locally before being synced to the cloud.'**
  String get settings__switch__e2e__subtitle;

  /// No description provided for @settings__switch__e2e_nonce__title.
  ///
  /// In en, this message translates to:
  /// **'High-Security Mode (Recommended)'**
  String get settings__switch__e2e_nonce__title;

  /// No description provided for @settings__switch__e2e_nonce__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Upgrades encryption to AES-GCM for superior data protection and tamper detection. (Older app versions cannot decrypt these new clips)'**
  String get settings__switch__e2e_nonce__subtitle;

  /// No description provided for @settings__dialog__conn_gdrive__title.
  ///
  /// In en, this message translates to:
  /// **'Re-Connect Google Drive?'**
  String get settings__dialog__conn_gdrive__title;

  /// No description provided for @settings__dialog__conn_gdrive__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your google drive is already connected! Would you like to reconnect?\n\nTo avoid any data loss, please ensure you use the same account as before.'**
  String get settings__dialog__conn_gdrive__subtitle;

  /// No description provided for @settings__drive__connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get settings__drive__connected;

  /// No description provided for @settings__drive__loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get settings__drive__loading;

  /// No description provided for @settings__drive__authorizing.
  ///
  /// In en, this message translates to:
  /// **'Authorizing...'**
  String get settings__drive__authorizing;

  /// No description provided for @settings__drive__connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get settings__drive__connect;

  /// No description provided for @settings__drive__disconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get settings__drive__disconnected;

  /// No description provided for @settings__text__cloud__title.
  ///
  /// In en, this message translates to:
  /// **'Cloud Drive'**
  String get settings__text__cloud__title;

  /// No description provided for @settings__text__cloud__name.
  ///
  /// In en, this message translates to:
  /// **'Google Drive'**
  String get settings__text__cloud__name;

  /// No description provided for @settings__text__gdrive__error.
  ///
  /// In en, this message translates to:
  /// **'Google Drive is not connected. File and media syncing are currently disabled.'**
  String get settings__text__gdrive__error;

  /// No description provided for @settings__text__gdrive__info.
  ///
  /// In en, this message translates to:
  /// **'Your files and media are securely synced across devices via supported cloud providers, ensuring your privacy is protected. When multiple providers are connected, you can choose the default storage for new uploads.'**
  String get settings__text__gdrive__info;

  /// No description provided for @settings__drive__default_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Default storage for uploads'**
  String get settings__drive__default_tooltip;

  /// No description provided for @settings__drive__set_default.
  ///
  /// In en, this message translates to:
  /// **'Set as default'**
  String get settings__drive__set_default;

  /// No description provided for @settings__tile__other_cloud__title.
  ///
  /// In en, this message translates to:
  /// **'Setup Other Cloud Drive'**
  String get settings__tile__other_cloud__title;

  /// No description provided for @settings__text__webdav__name.
  ///
  /// In en, this message translates to:
  /// **'WebDAV'**
  String get settings__text__webdav__name;

  /// No description provided for @settings__text__webdav__info.
  ///
  /// In en, this message translates to:
  /// **'Connect your WebDAV server (Nextcloud, ownCloud, Synology NAS, etc.) to store and sync your files and media attachments.'**
  String get settings__text__webdav__info;

  /// No description provided for @settings__dialog__webdav__title.
  ///
  /// In en, this message translates to:
  /// **'WebDAV Storage'**
  String get settings__dialog__webdav__title;

  /// No description provided for @settings__dialog__webdav__preset_provider.
  ///
  /// In en, this message translates to:
  /// **'Provider Preset'**
  String get settings__dialog__webdav__preset_provider;

  /// No description provided for @settings__dialog__webdav__server_url.
  ///
  /// In en, this message translates to:
  /// **'Server URL'**
  String get settings__dialog__webdav__server_url;

  /// No description provided for @settings__dialog__webdav__server_url_hint.
  ///
  /// In en, this message translates to:
  /// **'https://cloud.example.com/remote.php/dav/files/username/'**
  String get settings__dialog__webdav__server_url_hint;

  /// No description provided for @settings__dialog__webdav__username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get settings__dialog__webdav__username;

  /// No description provided for @settings__dialog__webdav__password.
  ///
  /// In en, this message translates to:
  /// **'Password / App Password'**
  String get settings__dialog__webdav__password;

  /// No description provided for @settings__dialog__webdav__base_path.
  ///
  /// In en, this message translates to:
  /// **'Storage Folder Path'**
  String get settings__dialog__webdav__base_path;

  /// No description provided for @settings__dialog__webdav__base_path_helper.
  ///
  /// In en, this message translates to:
  /// **'Folder path cannot be changed after setup. To change it, disconnect first.'**
  String get settings__dialog__webdav__base_path_helper;

  /// No description provided for @settings__dialog__webdav__advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get settings__dialog__webdav__advanced;

  /// No description provided for @settings__dialog__webdav__self_signed.
  ///
  /// In en, this message translates to:
  /// **'Allow Self-Signed / Insecure Certificates'**
  String get settings__dialog__webdav__self_signed;

  /// No description provided for @settings__dialog__webdav__auto_clean.
  ///
  /// In en, this message translates to:
  /// **'Auto-clean inactive files after 30 days'**
  String get settings__dialog__webdav__auto_clean;

  /// No description provided for @settings__dialog__webdav__auto_clean_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Because WebDAV credentials remain private on your device, remote files are not removed by cloud cleanup. When enabled, media files older than 30 days from last modification will be deleted from your WebDAV server. Clips in collections or locked are always protected.'**
  String get settings__dialog__webdav__auto_clean_subtitle;

  /// No description provided for @settings__dialog__webdav__test_conn.
  ///
  /// In en, this message translates to:
  /// **'Test Connection'**
  String get settings__dialog__webdav__test_conn;

  /// No description provided for @settings__dialog__webdav__testing.
  ///
  /// In en, this message translates to:
  /// **'Testing Connection...'**
  String get settings__dialog__webdav__testing;

  /// No description provided for @settings__dialog__webdav__test_success.
  ///
  /// In en, this message translates to:
  /// **'Connection successful!'**
  String get settings__dialog__webdav__test_success;

  /// No description provided for @settings__dialog__webdav__disconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get settings__dialog__webdav__disconnect;

  /// No description provided for @settings__dialog__webdav__save.
  ///
  /// In en, this message translates to:
  /// **'Save & Connect'**
  String get settings__dialog__webdav__save;

  /// No description provided for @settings__dialog__webdav__reconnect_title.
  ///
  /// In en, this message translates to:
  /// **'WebDAV Settings'**
  String get settings__dialog__webdav__reconnect_title;

  /// No description provided for @settings__dialog__webdav__reconnect_subtitle.
  ///
  /// In en, this message translates to:
  /// **'WebDAV is already connected. Update settings or disconnect?'**
  String get settings__dialog__webdav__reconnect_subtitle;

  /// No description provided for @settings__dialog__webdav__url_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid WebDAV server URL'**
  String get settings__dialog__webdav__url_required;

  /// No description provided for @settings__dialog__webdav__username_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter a username'**
  String get settings__dialog__webdav__username_required;

  /// No description provided for @settings__dialog__webdav__password_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password or app token'**
  String get settings__dialog__webdav__password_required;

  /// No description provided for @settings__app_lock__title.
  ///
  /// In en, this message translates to:
  /// **'App Lock'**
  String get settings__app_lock__title;

  /// No description provided for @settings__app_lock__tile__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Require biometric or device PIN to access the clipboard'**
  String get settings__app_lock__tile__subtitle;

  /// No description provided for @settings__app_lock__no_biometrics.
  ///
  /// In en, this message translates to:
  /// **'No biometric or device credential found. Set up a PIN or biometric in your device settings first.'**
  String get settings__app_lock__no_biometrics;

  /// No description provided for @settings__app_lock__lock_after__title.
  ///
  /// In en, this message translates to:
  /// **'Lock after'**
  String get settings__app_lock__lock_after__title;

  /// No description provided for @settings__app_lock__lock_after__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Automatically lock when the app goes to the background'**
  String get settings__app_lock__lock_after__subtitle;

  /// No description provided for @settings__app_lock__timeout__immediately.
  ///
  /// In en, this message translates to:
  /// **'Immediately'**
  String get settings__app_lock__timeout__immediately;

  /// No description provided for @settings__app_lock__timeout__minutes.
  ///
  /// In en, this message translates to:
  /// **'{count} {count, plural, one{minute} other{minutes}}'**
  String settings__app_lock__timeout__minutes({required int count});

  /// No description provided for @app_lock__screen__locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get app_lock__screen__locked;

  /// No description provided for @app_lock__screen__unlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get app_lock__screen__unlock;

  /// No description provided for @settings__lan__title.
  ///
  /// In en, this message translates to:
  /// **'LAN Network'**
  String get settings__lan__title;

  /// No description provided for @settings__lan__service_inactive.
  ///
  /// In en, this message translates to:
  /// **'Start the background service to use LAN sync'**
  String get settings__lan__service_inactive;

  /// No description provided for @settings__lan__subtitle__disabled.
  ///
  /// In en, this message translates to:
  /// **'Sync clipboard instantly with nearby devices'**
  String get settings__lan__subtitle__disabled;

  /// No description provided for @settings__lan__subtitle__mobile.
  ///
  /// In en, this message translates to:
  /// **'Background service scanning for nearby devices'**
  String get settings__lan__subtitle__mobile;

  /// No description provided for @settings__lan__searching.
  ///
  /// In en, this message translates to:
  /// **'Searching for devices…'**
  String get settings__lan__searching;

  /// No description provided for @settings__lan__devices_found.
  ///
  /// In en, this message translates to:
  /// **'{count} {count, plural, one{device} other{devices}} found on network'**
  String settings__lan__devices_found({required int count});

  /// No description provided for @settings__auto_write__title.
  ///
  /// In en, this message translates to:
  /// **'Auto-Write on Receive'**
  String get settings__auto_write__title;

  /// No description provided for @settings__auto_write__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Automatically copy incoming clips to the clipboard'**
  String get settings__auto_write__subtitle;

  /// No description provided for @settings__sync__manage_devices__title.
  ///
  /// In en, this message translates to:
  /// **'Manage Sync Devices'**
  String get settings__sync__manage_devices__title;

  /// No description provided for @settings__sync__manage_devices__subtitle.
  ///
  /// In en, this message translates to:
  /// **'View active devices and remove devices from sync access.'**
  String get settings__sync__manage_devices__subtitle;

  /// No description provided for @settings__lan_mesh__app_bar_title.
  ///
  /// In en, this message translates to:
  /// **'LAN Network'**
  String get settings__lan_mesh__app_bar_title;

  /// No description provided for @settings__lan_mesh__unknown_device.
  ///
  /// In en, this message translates to:
  /// **'Unknown Device'**
  String get settings__lan_mesh__unknown_device;

  /// No description provided for @settings__lan_mesh__searching.
  ///
  /// In en, this message translates to:
  /// **'Searching for devices on the network…'**
  String get settings__lan_mesh__searching;

  /// No description provided for @settings__lan_mesh__reachable.
  ///
  /// In en, this message translates to:
  /// **'Reachable'**
  String get settings__lan_mesh__reachable;

  /// No description provided for @settings__lan_mesh__unreachable.
  ///
  /// In en, this message translates to:
  /// **'Unreachable'**
  String get settings__lan_mesh__unreachable;

  /// No description provided for @settings__lan_mesh__disabled_banner.
  ///
  /// In en, this message translates to:
  /// **'LAN Instant Sync is disabled. Enable it from Settings to discover nearby devices.'**
  String get settings__lan_mesh__disabled_banner;

  /// No description provided for @settings__device_mgmt__app_bar_title.
  ///
  /// In en, this message translates to:
  /// **'Manage Sync Devices'**
  String get settings__device_mgmt__app_bar_title;

  /// No description provided for @settings__device_mgmt__dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Remove Sync Access'**
  String get settings__device_mgmt__dialog_title;

  /// No description provided for @settings__device_mgmt__dialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settings__device_mgmt__dialog_cancel;

  /// No description provided for @settings__device_mgmt__dialog_remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get settings__device_mgmt__dialog_remove;

  /// No description provided for @settings__device_mgmt__revoke_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove sync access.'**
  String get settings__device_mgmt__revoke_failed;

  /// No description provided for @settings__device_mgmt__active_now.
  ///
  /// In en, this message translates to:
  /// **'Active now'**
  String get settings__device_mgmt__active_now;

  /// No description provided for @settings__device_mgmt__today_at.
  ///
  /// In en, this message translates to:
  /// **'Today at {time}'**
  String settings__device_mgmt__today_at({required String time});

  /// No description provided for @settings__device_mgmt__days_ago.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String settings__device_mgmt__days_ago({required int count});

  /// No description provided for @settings__device_mgmt__load_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load devices.'**
  String get settings__device_mgmt__load_failed;

  /// No description provided for @settings__device_mgmt__retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get settings__device_mgmt__retry;

  /// No description provided for @settings__device_mgmt__empty.
  ///
  /// In en, this message translates to:
  /// **'No sync devices found.'**
  String get settings__device_mgmt__empty;

  /// No description provided for @settings__device_mgmt__max_limit_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Maximum number of devices you can sync with your current plan.'**
  String get settings__device_mgmt__max_limit_tooltip;

  /// No description provided for @settings__device_mgmt__max_limit_label.
  ///
  /// In en, this message translates to:
  /// **'Max Limit • {count}'**
  String settings__device_mgmt__max_limit_label({required int count});

  /// No description provided for @settings__device_mgmt__active_count_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Number of devices currently active.'**
  String get settings__device_mgmt__active_count_tooltip;

  /// No description provided for @settings__device_mgmt__active_count_label.
  ///
  /// In en, this message translates to:
  /// **'Active • {count}'**
  String settings__device_mgmt__active_count_label({required int count});

  /// No description provided for @settings__device_card__last_seen.
  ///
  /// In en, this message translates to:
  /// **'Last seen: {time}'**
  String settings__device_card__last_seen({required String time});

  /// No description provided for @settings__device_card__revoke.
  ///
  /// In en, this message translates to:
  /// **'Revoke'**
  String get settings__device_card__revoke;

  /// No description provided for @device_mgmt_verification_failed.
  ///
  /// In en, this message translates to:
  /// **'Sync device access could not be verified right now. Please check your internet connection and try again.'**
  String get device_mgmt_verification_failed;

  /// No description provided for @device_mgmt_limit_reached.
  ///
  /// In en, this message translates to:
  /// **'Sync is disabled on this device because your plan device limit is reached. Remove another device from Settings > Syncing > Manage Sync Devices.'**
  String get device_mgmt_limit_reached;

  /// No description provided for @custom_er__nav__1.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get custom_er__nav__1;

  /// No description provided for @custom_er__nav__2.
  ///
  /// In en, this message translates to:
  /// **'Window Title'**
  String get custom_er__nav__2;

  /// No description provided for @custom_er__nav__3.
  ///
  /// In en, this message translates to:
  /// **'Url'**
  String get custom_er__nav__3;

  /// No description provided for @custom_er__nav__4.
  ///
  /// In en, this message translates to:
  /// **'Text Pattern'**
  String get custom_er__nav__4;

  /// No description provided for @custom_er__text__not_supported.
  ///
  /// In en, this message translates to:
  /// **'This exclusion is not supported yet'**
  String get custom_er__text__not_supported;

  /// No description provided for @custom_er__tile__add_app.
  ///
  /// In en, this message translates to:
  /// **'Add an app'**
  String get custom_er__tile__add_app;

  /// No description provided for @custom_er__text__no_app.
  ///
  /// In en, this message translates to:
  /// **'No custom app excluded yet'**
  String get custom_er__text__no_app;

  /// No description provided for @custom_er__button__remove_app.
  ///
  /// In en, this message translates to:
  /// **'Remove this app'**
  String get custom_er__button__remove_app;

  /// No description provided for @custom_er__tile__pattern.
  ///
  /// In en, this message translates to:
  /// **'Prevent copy when copied content matches these patterns'**
  String get custom_er__tile__pattern;

  /// No description provided for @custom_er__text__no_pattern.
  ///
  /// In en, this message translates to:
  /// **'No custom pattern(s) excluded'**
  String get custom_er__text__no_pattern;

  /// No description provided for @custom_er__button__remove_pattern.
  ///
  /// In en, this message translates to:
  /// **'Remove this pattern'**
  String get custom_er__button__remove_pattern;

  /// No description provided for @custom_er__tile__url.
  ///
  /// In en, this message translates to:
  /// **'Prevent copy from website matching these url segments.'**
  String get custom_er__tile__url;

  /// No description provided for @custom_er__input__url_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter a url or part of a url here.'**
  String get custom_er__input__url_hint;

  /// No description provided for @custom_er__text__no_url.
  ///
  /// In en, this message translates to:
  /// **'No custom url(s) excluded'**
  String get custom_er__text__no_url;

  /// No description provided for @custom_er__button__remove_url.
  ///
  /// In en, this message translates to:
  /// **'Remove this url'**
  String get custom_er__button__remove_url;

  /// No description provided for @custom_er__tile__title.
  ///
  /// In en, this message translates to:
  /// **'Prevent copy from app or website when window title matches.'**
  String get custom_er__tile__title;

  /// No description provided for @custom_er__text__no_title.
  ///
  /// In en, this message translates to:
  /// **'No custom title(s) excluded'**
  String get custom_er__text__no_title;

  /// No description provided for @custom_er__button__remove_title.
  ///
  /// In en, this message translates to:
  /// **'Remove this title'**
  String get custom_er__button__remove_title;

  /// No description provided for @about__tile__discord.
  ///
  /// In en, this message translates to:
  /// **'Discord • Connect'**
  String get about__tile__discord;

  /// No description provided for @about__tile__youtube.
  ///
  /// In en, this message translates to:
  /// **'YouTube • Tutorial'**
  String get about__tile__youtube;

  /// No description provided for @about__tile__read_tut.
  ///
  /// In en, this message translates to:
  /// **'Read • Tutorial'**
  String get about__tile__read_tut;

  /// No description provided for @about__tile__github.
  ///
  /// In en, this message translates to:
  /// **'Github • Open Source'**
  String get about__tile__github;

  /// No description provided for @about__tile__website.
  ///
  /// In en, this message translates to:
  /// **'EntilityStudio • Website'**
  String get about__tile__website;

  /// No description provided for @about__tile__support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get about__tile__support;

  /// No description provided for @abc_title.
  ///
  /// In en, this message translates to:
  /// **'Background Clipboard'**
  String get abc_title;

  /// No description provided for @abc__tile__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Listen to the clipboard in the background'**
  String get abc__tile__subtitle;

  /// No description provided for @abc__tip__why_title.
  ///
  /// In en, this message translates to:
  /// **'Why are these permissions needed?'**
  String get abc__tip__why_title;

  /// No description provided for @abc__tip__why_subtitle.
  ///
  /// In en, this message translates to:
  /// **'These permissions ensure CopyCat works correctly in the background, allowing it to detect copied content and provide you with a seamless experience without interruptions.'**
  String get abc__tip__why_subtitle;

  /// No description provided for @abc__heading__req_perm.
  ///
  /// In en, this message translates to:
  /// **'Required Permissions'**
  String get abc__heading__req_perm;

  /// No description provided for @abc__tile__notification_title.
  ///
  /// In en, this message translates to:
  /// **'Notification Access'**
  String get abc__tile__notification_title;

  /// No description provided for @abc__tile__notification_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Displays a persistent notification to inform you that CopyCat is running in the background, ensuring transparency and privacy.'**
  String get abc__tile__notification_subtitle;

  /// No description provided for @abc__tile__battery_opt_title.
  ///
  /// In en, this message translates to:
  /// **'Battery Optimization'**
  String get abc__tile__battery_opt_title;

  /// No description provided for @abc__tile__battery_opt_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Prevents the system from shutting down CopyCat while running in the background, ensuring a seamless experience.'**
  String get abc__tile__battery_opt_subtitle;

  /// No description provided for @abc__tile__overlay_title.
  ///
  /// In en, this message translates to:
  /// **'Overlay Permission'**
  String get abc__tile__overlay_title;

  /// No description provided for @abc__tile__overlay_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Allows CopyCat to read the clipboard by briefly opening a transparent window over the screen and closing it immediately after.'**
  String get abc__tile__overlay_subtitle;

  /// No description provided for @abc__tile__acc_title.
  ///
  /// In en, this message translates to:
  /// **'Accessibility Service'**
  String get abc__tile__acc_title;

  /// No description provided for @abc__tile__acc_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Start the CopyCat background listener to detect when you copy something and ensure the service restarts automatically after a reboot.'**
  String get abc__tile__acc_subtitle;

  /// No description provided for @abc__ack__ready.
  ///
  /// In en, this message translates to:
  /// **'Setup ready to be configured.'**
  String get abc__ack__ready;

  /// No description provided for @abc__ack__preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing setup, please wait...'**
  String get abc__ack__preparing;

  /// No description provided for @abc__perm_alert_open_setting__button.
  ///
  /// In en, this message translates to:
  /// **'Open Setting'**
  String get abc__perm_alert_open_setting__button;

  /// No description provided for @abc__overlay_perm_alert__title.
  ///
  /// In en, this message translates to:
  /// **'Overlay Permission'**
  String get abc__overlay_perm_alert__title;

  /// No description provided for @abc__overlay_perm_alert__subtitle.
  ///
  /// In en, this message translates to:
  /// **'CopyCat Clipboard needs the \'Draw Over Other Apps\' permission to read clipboard content in the background.'**
  String get abc__overlay_perm_alert__subtitle;

  /// No description provided for @abc__overlay_perm_alert__p1_prefix.
  ///
  /// In en, this message translates to:
  /// **'This permission is '**
  String get abc__overlay_perm_alert__p1_prefix;

  /// No description provided for @abc__overlay_perm_alert__p1_bold.
  ///
  /// In en, this message translates to:
  /// **'used only for clipboard detection'**
  String get abc__overlay_perm_alert__p1_bold;

  /// No description provided for @abc__overlay_perm_alert__p1_suffix.
  ///
  /// In en, this message translates to:
  /// **' when you\'re copying something in the background.'**
  String get abc__overlay_perm_alert__p1_suffix;

  /// No description provided for @abc__overlay_perm_alert__p2_prefix.
  ///
  /// In en, this message translates to:
  /// **'When enabled, CopyCat '**
  String get abc__overlay_perm_alert__p2_prefix;

  /// No description provided for @abc__overlay_perm_alert__p2_bold.
  ///
  /// In en, this message translates to:
  /// **'creates a 0-pixel transparent window'**
  String get abc__overlay_perm_alert__p2_bold;

  /// No description provided for @abc__overlay_perm_alert__p2_suffix.
  ///
  /// In en, this message translates to:
  /// **' to briefly bring the app to the foreground to read clipboard data.'**
  String get abc__overlay_perm_alert__p2_suffix;

  /// No description provided for @abc__overlay_perm_alert__p3_prefix.
  ///
  /// In en, this message translates to:
  /// **'The app '**
  String get abc__overlay_perm_alert__p3_prefix;

  /// No description provided for @abc__overlay_perm_alert__p3_bold.
  ///
  /// In en, this message translates to:
  /// **'does not show anything'**
  String get abc__overlay_perm_alert__p3_bold;

  /// No description provided for @abc__overlay_perm_alert__p3_suffix.
  ///
  /// In en, this message translates to:
  /// **' on your screen during this process.'**
  String get abc__overlay_perm_alert__p3_suffix;

  /// No description provided for @abc__overlay_perm_alert__p4_prefix.
  ///
  /// In en, this message translates to:
  /// **'On some devices, the system may show a toast message '**
  String get abc__overlay_perm_alert__p4_prefix;

  /// No description provided for @abc__overlay_perm_alert__p4_bold.
  ///
  /// In en, this message translates to:
  /// **'\'CopyCat pasted from your clipboard\''**
  String get abc__overlay_perm_alert__p4_bold;

  /// No description provided for @abc__overlay_perm_alert__p4_suffix.
  ///
  /// In en, this message translates to:
  /// **' when CopyCat reads your clipboard content.'**
  String get abc__overlay_perm_alert__p4_suffix;

  /// No description provided for @abc__overlay_perm_alert__agree.
  ///
  /// In en, this message translates to:
  /// **'By granting this permission, you agree to the above usage.'**
  String get abc__overlay_perm_alert__agree;

  /// No description provided for @abc__accessibility_perm_alert__title.
  ///
  /// In en, this message translates to:
  /// **'Accessibility Permission'**
  String get abc__accessibility_perm_alert__title;

  /// No description provided for @abc__accessibility_perm_alert__subtitle.
  ///
  /// In en, this message translates to:
  /// **'CopyCat Clipboard requires the Accessibility Service to run in the background for real-time clipboard detection and syncing.'**
  String get abc__accessibility_perm_alert__subtitle;

  /// No description provided for @abc__accessibility_perm_alert__p1_prefix.
  ///
  /// In en, this message translates to:
  /// **'This service is '**
  String get abc__accessibility_perm_alert__p1_prefix;

  /// No description provided for @abc__accessibility_perm_alert__p1_bold.
  ///
  /// In en, this message translates to:
  /// **'only used'**
  String get abc__accessibility_perm_alert__p1_bold;

  /// No description provided for @abc__accessibility_perm_alert__p1_suffix.
  ///
  /// In en, this message translates to:
  /// **' for detecting clipboard content and syncing it across devices when enabled.'**
  String get abc__accessibility_perm_alert__p1_suffix;

  /// No description provided for @abc__accessibility_perm_alert__p2_prefix.
  ///
  /// In en, this message translates to:
  /// **'You can '**
  String get abc__accessibility_perm_alert__p2_prefix;

  /// No description provided for @abc__accessibility_perm_alert__p2_bold.
  ///
  /// In en, this message translates to:
  /// **'exclude specific apps'**
  String get abc__accessibility_perm_alert__p2_bold;

  /// No description provided for @abc__accessibility_perm_alert__p2_suffix.
  ///
  /// In en, this message translates to:
  /// **' using the Exclusion Rules feature.'**
  String get abc__accessibility_perm_alert__p2_suffix;

  /// No description provided for @abc__accessibility_perm_alert__p3_prefix.
  ///
  /// In en, this message translates to:
  /// **'The app '**
  String get abc__accessibility_perm_alert__p3_prefix;

  /// No description provided for @abc__accessibility_perm_alert__p3_bold.
  ///
  /// In en, this message translates to:
  /// **'does not access any other data'**
  String get abc__accessibility_perm_alert__p3_bold;

  /// No description provided for @abc__accessibility_perm_alert__p3_suffix.
  ///
  /// In en, this message translates to:
  /// **' beyond clipboard content.'**
  String get abc__accessibility_perm_alert__p3_suffix;

  /// No description provided for @abc__accessibility_perm_alert__p4_prefix.
  ///
  /// In en, this message translates to:
  /// **'Clipboard data '**
  String get abc__accessibility_perm_alert__p4_prefix;

  /// No description provided for @abc__accessibility_perm_alert__p4_bold.
  ///
  /// In en, this message translates to:
  /// **'is not shared externally'**
  String get abc__accessibility_perm_alert__p4_bold;

  /// No description provided for @abc__accessibility_perm_alert__p4_suffix.
  ///
  /// In en, this message translates to:
  /// **' and remains private to your devices.'**
  String get abc__accessibility_perm_alert__p4_suffix;

  /// No description provided for @abc__accessibility_perm_alert__p5_prefix.
  ///
  /// In en, this message translates to:
  /// **'Clipboard data '**
  String get abc__accessibility_perm_alert__p5_prefix;

  /// No description provided for @abc__accessibility_perm_alert__p5_bold.
  ///
  /// In en, this message translates to:
  /// **'is end-to-end encrypted'**
  String get abc__accessibility_perm_alert__p5_bold;

  /// No description provided for @abc__accessibility_perm_alert__p5_suffix.
  ///
  /// In en, this message translates to:
  /// **' (if enabled) in transit and at rest, ensuring privacy across devices.'**
  String get abc__accessibility_perm_alert__p5_suffix;

  /// No description provided for @abc__accessibility_perm_alert__agree.
  ///
  /// In en, this message translates to:
  /// **'By enabling the Accessibility Service, you acknowledge and agree to the above terms.'**
  String get abc__accessibility_perm_alert__agree;

  /// No description provided for @abc__other_setting__title.
  ///
  /// In en, this message translates to:
  /// **'Other Settings'**
  String get abc__other_setting__title;

  /// No description provided for @abc__tile__two_way_sync__title.
  ///
  /// In en, this message translates to:
  /// **'2-Way Sync'**
  String get abc__tile__two_way_sync__title;

  /// No description provided for @abc__tile__two_way_sync__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Keeps your clipboard synced across devices instantly.\n{warning}'**
  String abc__tile__two_way_sync__subtitle({required String warning});

  /// No description provided for @abc__tile__two_way_sync__realtime_required.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Realtime mode required.'**
  String get abc__tile__two_way_sync__realtime_required;

  /// No description provided for @abc__ack__detection_mode_cleared.
  ///
  /// In en, this message translates to:
  /// **'Detection mode cleared'**
  String get abc__ack__detection_mode_cleared;

  /// No description provided for @abc__ack__detection_mode_updated.
  ///
  /// In en, this message translates to:
  /// **'Detection mode updated'**
  String get abc__ack__detection_mode_updated;

  /// No description provided for @abc__ack__detection_mode_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update detection mode: {message}'**
  String abc__ack__detection_mode_update_failed({required String message});

  /// No description provided for @abc__detection_mode__title.
  ///
  /// In en, this message translates to:
  /// **'Detection Mode'**
  String get abc__detection_mode__title;

  /// No description provided for @abc__detection_mode__subtitle__enabled.
  ///
  /// In en, this message translates to:
  /// **'Choose how CopyCat detects copy actions in other apps. CopyCat stays inactive until you pick a mode.'**
  String get abc__detection_mode__subtitle__enabled;

  /// No description provided for @abc__detection_mode__subtitle__disabled.
  ///
  /// In en, this message translates to:
  /// **'Enable accessibility service first, then choose a detection mode.'**
  String get abc__detection_mode__subtitle__disabled;

  /// No description provided for @abc__detection_mode__mode_1.
  ///
  /// In en, this message translates to:
  /// **'Efficient'**
  String get abc__detection_mode__mode_1;

  /// No description provided for @abc__detection_mode__mode_2.
  ///
  /// In en, this message translates to:
  /// **'Maximum Compatibility'**
  String get abc__detection_mode__mode_2;

  /// No description provided for @abc__network__header.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get abc__network__header;

  /// No description provided for @current_time__local.
  ///
  /// In en, this message translates to:
  /// **'Local: {time}'**
  String current_time__local({required String time});

  /// No description provided for @current_time__utc.
  ///
  /// In en, this message translates to:
  /// **'UTC: {time}'**
  String current_time__utc({required String time});

  /// No description provided for @encrypted_stat__summary.
  ///
  /// In en, this message translates to:
  /// **'You currently have {count} encrypted clips that are inaccessible.'**
  String encrypted_stat__summary({required int count});

  /// No description provided for @encrypted_stat__all_decrypted.
  ///
  /// In en, this message translates to:
  /// **'🥳 Congratulations! All your clips have been successfully decrypted locally, so rebuilding the database is not required.'**
  String get encrypted_stat__all_decrypted;

  /// No description provided for @encrypted_stat__rebuild_database.
  ///
  /// In en, this message translates to:
  /// **'Rebuild Database'**
  String get encrypted_stat__rebuild_database;

  /// No description provided for @tray__tooltip__paused_till.
  ///
  /// In en, this message translates to:
  /// **'CopyCat Clipboard - Paused till {time}'**
  String tray__tooltip__paused_till({required String time});

  /// No description provided for @tray__menu__resume_copycat.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get tray__menu__resume_copycat;

  /// No description provided for @tray__menu__pause_copycat.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get tray__menu__pause_copycat;

  /// No description provided for @tray__menu__paste_stack.
  ///
  /// In en, this message translates to:
  /// **'Paste Stack'**
  String get tray__menu__paste_stack;

  /// No description provided for @tray__menu__restart_app.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get tray__menu__restart_app;

  /// No description provided for @tray__dialog__quit__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to quit?'**
  String get tray__dialog__quit__subtitle;

  /// No description provided for @splash__checking_authentication.
  ///
  /// In en, this message translates to:
  /// **'Checking for authentication...'**
  String get splash__checking_authentication;

  /// No description provided for @paste_stack__title.
  ///
  /// In en, this message translates to:
  /// **'Paste Stack • {count}'**
  String paste_stack__title({required int count});

  /// No description provided for @paste_stack__reorder_hint.
  ///
  /// In en, this message translates to:
  /// **'You can drag item to reorder.'**
  String get paste_stack__reorder_hint;

  /// No description provided for @paste_stack__reverse_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Reverse Stack'**
  String get paste_stack__reverse_tooltip;

  /// No description provided for @paste_stack__limit_note.
  ///
  /// In en, this message translates to:
  /// **'You have a limit of {count} items'**
  String paste_stack__limit_note({required int count});

  /// No description provided for @multi_paste__title.
  ///
  /// In en, this message translates to:
  /// **'Multi Paste Setup'**
  String get multi_paste__title;

  /// No description provided for @multi_paste__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Control how selected clips are merged and paced.'**
  String get multi_paste__subtitle;

  /// No description provided for @multi_paste__stat__selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get multi_paste__stat__selected;

  /// No description provided for @multi_paste__stat__text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get multi_paste__stat__text;

  /// No description provided for @multi_paste__stat__non_text.
  ///
  /// In en, this message translates to:
  /// **'Non-text'**
  String get multi_paste__stat__non_text;

  /// No description provided for @multi_paste__merge__title.
  ///
  /// In en, this message translates to:
  /// **'Merge consecutive text clips'**
  String get multi_paste__merge__title;

  /// No description provided for @multi_paste__merge__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Text clips merge until a non-text clip interrupts the sequence.'**
  String get multi_paste__merge__subtitle;

  /// No description provided for @multi_paste__separator__title.
  ///
  /// In en, this message translates to:
  /// **'Separator'**
  String get multi_paste__separator__title;

  /// No description provided for @multi_paste__separator__new_line.
  ///
  /// In en, this message translates to:
  /// **'New line'**
  String get multi_paste__separator__new_line;

  /// No description provided for @multi_paste__separator__space.
  ///
  /// In en, this message translates to:
  /// **'Space'**
  String get multi_paste__separator__space;

  /// No description provided for @multi_paste__separator__custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get multi_paste__separator__custom;

  /// No description provided for @multi_paste__separator__custom_label.
  ///
  /// In en, this message translates to:
  /// **'Custom separator'**
  String get multi_paste__separator__custom_label;

  /// No description provided for @multi_paste__separator__custom_hint.
  ///
  /// In en, this message translates to:
  /// **'Supports escape sequences like \\n and \\t'**
  String get multi_paste__separator__custom_hint;

  /// No description provided for @multi_paste__pacing__title.
  ///
  /// In en, this message translates to:
  /// **'Paste pacing'**
  String get multi_paste__pacing__title;

  /// No description provided for @multi_paste__pacing__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Increase the delay if the target app misses paste events.'**
  String get multi_paste__pacing__subtitle;

  /// No description provided for @multi_paste__wait_between_pastes.
  ///
  /// In en, this message translates to:
  /// **'Wait time between pastes'**
  String get multi_paste__wait_between_pastes;

  /// No description provided for @multi_paste__validation__wait_positive.
  ///
  /// In en, this message translates to:
  /// **'Wait time must be a positive number.'**
  String get multi_paste__validation__wait_positive;

  /// No description provided for @multi_paste__validation__custom_separator_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter a custom separator.'**
  String get multi_paste__validation__custom_separator_required;

  /// No description provided for @settings__tile__backup_restore__title.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get settings__tile__backup_restore__title;

  /// No description provided for @settings__tile__backup_restore__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create .ccbkup backups and restore locally'**
  String get settings__tile__backup_restore__subtitle;

  /// No description provided for @settings__switch__rich_data_capture__title.
  ///
  /// In en, this message translates to:
  /// **'Rich Data Capture'**
  String get settings__switch__rich_data_capture__title;

  /// No description provided for @settings__switch__rich_data_capture__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep formatting when you copy and paste between apps.'**
  String get settings__switch__rich_data_capture__subtitle;

  /// No description provided for @settings__decrypt__title.
  ///
  /// In en, this message translates to:
  /// **'Clipboard Decryption'**
  String get settings__decrypt__title;

  /// No description provided for @settings__decrypt__count.
  ///
  /// In en, this message translates to:
  /// **'Currently you have {count} encrypted clips locally.'**
  String settings__decrypt__count({required int count});

  /// No description provided for @settings__decrypt__progress.
  ///
  /// In en, this message translates to:
  /// **'Decrypted: {decrypted} of {total} clips.'**
  String settings__decrypt__progress({
    required int decrypted,
    required int total,
  });

  /// No description provided for @settings__decrypt__warning.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Please keep this screen open during this process to avoid data corruption or inconsistencies.'**
  String get settings__decrypt__warning;

  /// No description provided for @not_found__title.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get not_found__title;

  /// No description provided for @not_found__subtitle.
  ///
  /// In en, this message translates to:
  /// **'The page you are looking for is not found.'**
  String get not_found__subtitle;

  /// No description provided for @not_found__go_home.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get not_found__go_home;

  /// No description provided for @backup_restore__dialog__save_as.
  ///
  /// In en, this message translates to:
  /// **'Save Backup As'**
  String get backup_restore__dialog__save_as;

  /// No description provided for @backup_restore__busy__creating.
  ///
  /// In en, this message translates to:
  /// **'Creating backup...'**
  String get backup_restore__busy__creating;

  /// No description provided for @backup_restore__error__encryption_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Encryption is enabled but currently unavailable. Please unlock E2EE and try again.'**
  String get backup_restore__error__encryption_unavailable;

  /// No description provided for @backup_restore__snackbar__saved.
  ///
  /// In en, this message translates to:
  /// **'Backup saved to {outputPath}'**
  String backup_restore__snackbar__saved({required String outputPath});

  /// No description provided for @backup_restore__snackbar__create_failed.
  ///
  /// In en, this message translates to:
  /// **'Backup failed: {message}'**
  String backup_restore__snackbar__create_failed({required String message});

  /// No description provided for @backup_restore__dialog__select_file.
  ///
  /// In en, this message translates to:
  /// **'Select Backup File'**
  String get backup_restore__dialog__select_file;

  /// No description provided for @backup_restore__dialog__restore_title.
  ///
  /// In en, this message translates to:
  /// **'Restore Backup'**
  String get backup_restore__dialog__restore_title;

  /// No description provided for @backup_restore__dialog__restore_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter password if this backup is password-protected.'**
  String get backup_restore__dialog__restore_subtitle;

  /// No description provided for @backup_restore__dialog__restore_action.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get backup_restore__dialog__restore_action;

  /// No description provided for @backup_restore__busy__restoring.
  ///
  /// In en, this message translates to:
  /// **'Restoring backup...'**
  String get backup_restore__busy__restoring;

  /// No description provided for @backup_restore__snackbar__restore_completed.
  ///
  /// In en, this message translates to:
  /// **'Restore completed: {clips} clips, {collections} collections.'**
  String backup_restore__snackbar__restore_completed({
    required int clips,
    required int collections,
  });

  /// No description provided for @backup_restore__snackbar__restore_failed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed: {message}'**
  String backup_restore__snackbar__restore_failed({required String message});

  /// No description provided for @backup_restore__error__select_clip_type.
  ///
  /// In en, this message translates to:
  /// **'Select at least one clip type.'**
  String get backup_restore__error__select_clip_type;

  /// No description provided for @backup_restore__error__from_after_to.
  ///
  /// In en, this message translates to:
  /// **'From date must be earlier than To date.'**
  String get backup_restore__error__from_after_to;

  /// No description provided for @backup_restore__dialog__options__description.
  ///
  /// In en, this message translates to:
  /// **'Choose what to include in this backup archive.'**
  String get backup_restore__dialog__options__description;

  /// No description provided for @backup_restore__section__clip_types.
  ///
  /// In en, this message translates to:
  /// **'Clip Types'**
  String get backup_restore__section__clip_types;

  /// No description provided for @backup_restore__section__cached_files.
  ///
  /// In en, this message translates to:
  /// **'Cached Files'**
  String get backup_restore__section__cached_files;

  /// No description provided for @backup_restore__input__max_cached_file_size.
  ///
  /// In en, this message translates to:
  /// **'Max cached file size (MB)'**
  String get backup_restore__input__max_cached_file_size;

  /// No description provided for @backup_restore__input__max_cached_file_size__hint.
  ///
  /// In en, this message translates to:
  /// **'Optional, e.g. 50'**
  String get backup_restore__input__max_cached_file_size__hint;

  /// No description provided for @backup_restore__error__positive_number.
  ///
  /// In en, this message translates to:
  /// **'Enter a positive number.'**
  String get backup_restore__error__positive_number;

  /// No description provided for @backup_restore__text__select_file_media_for_cache_limit.
  ///
  /// In en, this message translates to:
  /// **'Select File or Media clip types to configure a max cached file size.'**
  String get backup_restore__text__select_file_media_for_cache_limit;

  /// No description provided for @backup_restore__section__date_range.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get backup_restore__section__date_range;

  /// No description provided for @backup_restore__from_date.
  ///
  /// In en, this message translates to:
  /// **'From date'**
  String get backup_restore__from_date;

  /// No description provided for @backup_restore__to_date.
  ///
  /// In en, this message translates to:
  /// **'To date'**
  String get backup_restore__to_date;

  /// No description provided for @backup_restore__no_minimum_date.
  ///
  /// In en, this message translates to:
  /// **'No minimum date'**
  String get backup_restore__no_minimum_date;

  /// No description provided for @backup_restore__no_maximum_date.
  ///
  /// In en, this message translates to:
  /// **'No maximum date'**
  String get backup_restore__no_maximum_date;

  /// No description provided for @backup_restore__clear_date_filter.
  ///
  /// In en, this message translates to:
  /// **'Clear date filter'**
  String get backup_restore__clear_date_filter;

  /// No description provided for @backup_restore__section__security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get backup_restore__section__security;

  /// No description provided for @backup_restore__toggle__password_protect.
  ///
  /// In en, this message translates to:
  /// **'Protect backup with password'**
  String get backup_restore__toggle__password_protect;

  /// No description provided for @backup_restore__input__password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get backup_restore__input__password;

  /// No description provided for @backup_restore__input__password__hint.
  ///
  /// In en, this message translates to:
  /// **'At least 6 characters'**
  String get backup_restore__input__password__hint;

  /// No description provided for @backup_restore__error__password_min_length.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters.'**
  String get backup_restore__error__password_min_length;

  /// No description provided for @backup_restore__dialog__create_manual_title.
  ///
  /// In en, this message translates to:
  /// **'Create Manual Backup'**
  String get backup_restore__dialog__create_manual_title;

  /// No description provided for @backup_restore__appbar__title.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get backup_restore__appbar__title;

  /// No description provided for @backup_restore__card__title.
  ///
  /// In en, this message translates to:
  /// **'Manual Backup & Restore'**
  String get backup_restore__card__title;

  /// No description provided for @backup_restore__card__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create local .ccbkup archives with optional password protection and restore them locally with best-effort dedupe.'**
  String get backup_restore__card__subtitle;

  /// No description provided for @backup_restore__actions__title.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get backup_restore__actions__title;

  /// No description provided for @backup_restore__button__create.
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get backup_restore__button__create;

  /// No description provided for @backup_restore__button__restore.
  ///
  /// In en, this message translates to:
  /// **'Restore Backup'**
  String get backup_restore__button__restore;

  /// No description provided for @backup_restore__snapshot__backup_title.
  ///
  /// In en, this message translates to:
  /// **'Latest Backup Snapshot'**
  String get backup_restore__snapshot__backup_title;

  /// No description provided for @backup_restore__snapshot__restore_title.
  ///
  /// In en, this message translates to:
  /// **'Latest Restore Snapshot'**
  String get backup_restore__snapshot__restore_title;

  /// No description provided for @backup_restore__snapshot__restore_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Best-effort dedupe and integrity report'**
  String get backup_restore__snapshot__restore_subtitle;

  /// No description provided for @backup_restore__empty_session.
  ///
  /// In en, this message translates to:
  /// **'No backup or restore has been run in this session yet.'**
  String get backup_restore__empty_session;

  /// No description provided for @backup_restore__label__collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get backup_restore__label__collections;

  /// No description provided for @backup_restore__label__clips.
  ///
  /// In en, this message translates to:
  /// **'Clips'**
  String get backup_restore__label__clips;

  /// No description provided for @backup_restore__label__files_included.
  ///
  /// In en, this message translates to:
  /// **'Files Included'**
  String get backup_restore__label__files_included;

  /// No description provided for @backup_restore__label__files_missing.
  ///
  /// In en, this message translates to:
  /// **'Files Missing'**
  String get backup_restore__label__files_missing;

  /// No description provided for @backup_restore__label__files_skipped_by_size.
  ///
  /// In en, this message translates to:
  /// **'Skipped by Size'**
  String get backup_restore__label__files_skipped_by_size;

  /// No description provided for @backup_restore__label__encrypted_clips.
  ///
  /// In en, this message translates to:
  /// **'Encrypted Clips'**
  String get backup_restore__label__encrypted_clips;

  /// No description provided for @backup_restore__label__collections_restored.
  ///
  /// In en, this message translates to:
  /// **'Collections Restored'**
  String get backup_restore__label__collections_restored;

  /// No description provided for @backup_restore__label__collections_duplicates.
  ///
  /// In en, this message translates to:
  /// **'Collections Duplicates'**
  String get backup_restore__label__collections_duplicates;

  /// No description provided for @backup_restore__label__collections_failed.
  ///
  /// In en, this message translates to:
  /// **'Collections Failed'**
  String get backup_restore__label__collections_failed;

  /// No description provided for @backup_restore__label__clips_restored.
  ///
  /// In en, this message translates to:
  /// **'Clips Restored'**
  String get backup_restore__label__clips_restored;

  /// No description provided for @backup_restore__label__clips_duplicates.
  ///
  /// In en, this message translates to:
  /// **'Clips Duplicates'**
  String get backup_restore__label__clips_duplicates;

  /// No description provided for @backup_restore__label__clips_failed.
  ///
  /// In en, this message translates to:
  /// **'Clips Failed'**
  String get backup_restore__label__clips_failed;

  /// No description provided for @backup_restore__label__attachments_restored.
  ///
  /// In en, this message translates to:
  /// **'Attachments Restored'**
  String get backup_restore__label__attachments_restored;

  /// No description provided for @backup_restore__label__attachments_missing.
  ///
  /// In en, this message translates to:
  /// **'Attachments Missing'**
  String get backup_restore__label__attachments_missing;

  /// No description provided for @backup_restore__label__attachments_failed.
  ///
  /// In en, this message translates to:
  /// **'Attachments Failed'**
  String get backup_restore__label__attachments_failed;

  /// No description provided for @backup_restore__label__corrupt_entries.
  ///
  /// In en, this message translates to:
  /// **'Corrupt Entries'**
  String get backup_restore__label__corrupt_entries;

  /// No description provided for @subscription__loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get subscription__loading;

  /// No description provided for @review__dialog__title.
  ///
  /// In en, this message translates to:
  /// **'Liking CopyCat so far?'**
  String get review__dialog__title;

  /// No description provided for @review__dialog__message.
  ///
  /// In en, this message translates to:
  /// **'A quick rating helps more people discover CopyCat and keeps new features coming.'**
  String get review__dialog__message;

  /// No description provided for @review__dialog__never.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get review__dialog__never;

  /// No description provided for @review__dialog__remind_later.
  ///
  /// In en, this message translates to:
  /// **'Remind me in 7 days'**
  String get review__dialog__remind_later;

  /// No description provided for @review__dialog__rate_now.
  ///
  /// In en, this message translates to:
  /// **'Give a Quick Rating'**
  String get review__dialog__rate_now;

  /// No description provided for @settings__tile__review__title.
  ///
  /// In en, this message translates to:
  /// **'Rate CopyCat'**
  String get settings__tile__review__title;

  /// No description provided for @settings__tile__review__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Leave a review on the App Store'**
  String get settings__tile__review__subtitle;

  /// No description provided for @collections__read_only__banner.
  ///
  /// In en, this message translates to:
  /// **'Read-only on your current plan. Upgrade to edit this collection.'**
  String get collections__read_only__banner;

  /// No description provided for @collections__read_only__toast.
  ///
  /// In en, this message translates to:
  /// **'This collection is read-only on your current plan. Upgrade to edit all collections.'**
  String get collections__read_only__toast;

  /// No description provided for @collections__read_only__upgrade_action.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get collections__read_only__upgrade_action;

  /// No description provided for @collections__locked_section__label.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get collections__locked_section__label;

  /// No description provided for @transform__section__text_core.
  ///
  /// In en, this message translates to:
  /// **'Text Core'**
  String get transform__section__text_core;

  /// No description provided for @transform__section__text_utilities.
  ///
  /// In en, this message translates to:
  /// **'Text Utilities'**
  String get transform__section__text_utilities;

  /// No description provided for @transform__section__struct.
  ///
  /// In en, this message translates to:
  /// **'Struct'**
  String get transform__section__struct;

  /// No description provided for @transform__section__urls.
  ///
  /// In en, this message translates to:
  /// **'URLs'**
  String get transform__section__urls;

  /// No description provided for @transform__section__colors.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get transform__section__colors;

  /// No description provided for @transform__section__emails_phones.
  ///
  /// In en, this message translates to:
  /// **'Emails / Phones'**
  String get transform__section__emails_phones;

  /// No description provided for @transform__section__structured_text.
  ///
  /// In en, this message translates to:
  /// **'Structured Text'**
  String get transform__section__structured_text;

  /// No description provided for @transform__label__uppercase.
  ///
  /// In en, this message translates to:
  /// **'Uppercase'**
  String get transform__label__uppercase;

  /// No description provided for @transform__label__lowercase.
  ///
  /// In en, this message translates to:
  /// **'Lowercase'**
  String get transform__label__lowercase;

  /// No description provided for @transform__label__capitalize.
  ///
  /// In en, this message translates to:
  /// **'Capitalize'**
  String get transform__label__capitalize;

  /// No description provided for @transform__label__trim_whitespace.
  ///
  /// In en, this message translates to:
  /// **'Trim whitespace'**
  String get transform__label__trim_whitespace;

  /// No description provided for @transform__label__remove_line_breaks.
  ///
  /// In en, this message translates to:
  /// **'Remove line breaks'**
  String get transform__label__remove_line_breaks;

  /// No description provided for @transform__label__normalize_spaces.
  ///
  /// In en, this message translates to:
  /// **'Normalize spaces'**
  String get transform__label__normalize_spaces;

  /// No description provided for @transform__label__reverse_text.
  ///
  /// In en, this message translates to:
  /// **'Reverse text'**
  String get transform__label__reverse_text;

  /// No description provided for @transform__label__deduplicate_lines.
  ///
  /// In en, this message translates to:
  /// **'Deduplicate lines'**
  String get transform__label__deduplicate_lines;

  /// No description provided for @transform__label__json_prettify.
  ///
  /// In en, this message translates to:
  /// **'JSON → prettify'**
  String get transform__label__json_prettify;

  /// No description provided for @transform__label__json_minify.
  ///
  /// In en, this message translates to:
  /// **'JSON → minify'**
  String get transform__label__json_minify;

  /// No description provided for @transform__label__url_encode.
  ///
  /// In en, this message translates to:
  /// **'URL encode'**
  String get transform__label__url_encode;

  /// No description provided for @transform__label__url_decode.
  ///
  /// In en, this message translates to:
  /// **'URL decode'**
  String get transform__label__url_decode;

  /// No description provided for @transform__label__base64_encode.
  ///
  /// In en, this message translates to:
  /// **'Base64 encode'**
  String get transform__label__base64_encode;

  /// No description provided for @transform__label__base64_decode.
  ///
  /// In en, this message translates to:
  /// **'Base64 decode'**
  String get transform__label__base64_decode;

  /// No description provided for @transform__label__remove_tracking_params.
  ///
  /// In en, this message translates to:
  /// **'Remove tracking params'**
  String get transform__label__remove_tracking_params;

  /// No description provided for @transform__label__extract_domain.
  ///
  /// In en, this message translates to:
  /// **'Extract domain'**
  String get transform__label__extract_domain;

  /// No description provided for @transform__label__hex_to_rgb.
  ///
  /// In en, this message translates to:
  /// **'HEX → RGB'**
  String get transform__label__hex_to_rgb;

  /// No description provided for @transform__label__rgb_to_hex.
  ///
  /// In en, this message translates to:
  /// **'RGB → HEX'**
  String get transform__label__rgb_to_hex;

  /// No description provided for @transform__label__hex_to_hsl.
  ///
  /// In en, this message translates to:
  /// **'HEX → HSL'**
  String get transform__label__hex_to_hsl;

  /// No description provided for @transform__label__copy_cleaned.
  ///
  /// In en, this message translates to:
  /// **'Copy cleaned'**
  String get transform__label__copy_cleaned;

  /// No description provided for @transform__label__extract_emails.
  ///
  /// In en, this message translates to:
  /// **'Extract emails'**
  String get transform__label__extract_emails;

  /// No description provided for @transform__label__extract_urls.
  ///
  /// In en, this message translates to:
  /// **'Extract URLs'**
  String get transform__label__extract_urls;

  /// No description provided for @transform__label__extract_numbers.
  ///
  /// In en, this message translates to:
  /// **'Extract numbers'**
  String get transform__label__extract_numbers;

  /// No description provided for @transfer__scan_qr.
  ///
  /// In en, this message translates to:
  /// **'Scan QR'**
  String get transfer__scan_qr;

  /// No description provided for @transfer__show_qr.
  ///
  /// In en, this message translates to:
  /// **'Show QR'**
  String get transfer__show_qr;

  /// No description provided for @transfer__enter_passcode.
  ///
  /// In en, this message translates to:
  /// **'Enter Passcode'**
  String get transfer__enter_passcode;

  /// No description provided for @transfer__six_digit_passcode.
  ///
  /// In en, this message translates to:
  /// **'6-digit passcode'**
  String get transfer__six_digit_passcode;

  /// No description provided for @transfer__securely_transfer_via_qr.
  ///
  /// In en, this message translates to:
  /// **'Securely transfer to nearby device via QR (Recommended)'**
  String get transfer__securely_transfer_via_qr;

  /// No description provided for @transfer__nearby_device.
  ///
  /// In en, this message translates to:
  /// **'Transfer to Nearby Device'**
  String get transfer__nearby_device;

  /// No description provided for @transfer__scan_qr_and_enter_passcode.
  ///
  /// In en, this message translates to:
  /// **'Scan this QR on your other device, then enter the passcode.'**
  String get transfer__scan_qr_and_enter_passcode;

  /// No description provided for @transfer__enter_passcode_on_other_device.
  ///
  /// In en, this message translates to:
  /// **'Enter this passcode on the other device.'**
  String get transfer__enter_passcode_on_other_device;

  /// No description provided for @transfer__show_passcode.
  ///
  /// In en, this message translates to:
  /// **'Show Passcode'**
  String get transfer__show_passcode;

  /// No description provided for @transfer__device_has_no_camera_use_file_import.
  ///
  /// In en, this message translates to:
  /// **'This device does not have a camera. Use the file import option instead.'**
  String get transfer__device_has_no_camera_use_file_import;

  /// No description provided for @transfer__scan_qr_from_other_device.
  ///
  /// In en, this message translates to:
  /// **'Scan the QR from your other device.'**
  String get transfer__scan_qr_from_other_device;

  /// No description provided for @settings__personal_drive__title.
  ///
  /// In en, this message translates to:
  /// **'Personal Drive'**
  String get settings__personal_drive__title;

  /// No description provided for @settings__personal_drive__subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sync your file clips to your personal cloud for secure backup and access across devices.'**
  String get settings__personal_drive__subtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return lookupAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'pt',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<AppLocalizations> lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return app_localizations_de.loadLibrary().then(
        (dynamic _) => app_localizations_de.AppLocalizationsDe(),
      );
    case 'en':
      return app_localizations_en.loadLibrary().then(
        (dynamic _) => app_localizations_en.AppLocalizationsEn(),
      );
    case 'es':
      return app_localizations_es.loadLibrary().then(
        (dynamic _) => app_localizations_es.AppLocalizationsEs(),
      );
    case 'fr':
      return app_localizations_fr.loadLibrary().then(
        (dynamic _) => app_localizations_fr.AppLocalizationsFr(),
      );
    case 'pt':
      return app_localizations_pt.loadLibrary().then(
        (dynamic _) => app_localizations_pt.AppLocalizationsPt(),
      );
    case 'zh':
      return app_localizations_zh.loadLibrary().then(
        (dynamic _) => app_localizations_zh.AppLocalizationsZh(),
      );
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
