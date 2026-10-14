// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app__name => 'CopyCat Clipboard';

  @override
  String get app__slogan => 'One Clipboard, Limitless Possibility';

  @override
  String get app__start_indexing => 'Start Indexing';

  @override
  String get app__stop_indexing => 'Stop Indexing';

  @override
  String get app__image_not_found => 'Image not found';

  @override
  String get app__unknown_error => 'An unexpected error occurred';

  @override
  String get app__downloading => 'Downloading...';

  @override
  String get app__download => 'Download';

  @override
  String get app__follow_link => 'Follow Link';

  @override
  String get app__edit => 'Edit';

  @override
  String get app__export => 'Export';

  @override
  String get app__delete => 'Delete';

  @override
  String get app__later => 'Skip';

  @override
  String get app__select => 'Select';

  @override
  String get app__change => 'Change';

  @override
  String get app__confirm => 'Confirm';

  @override
  String get app__action_required => 'Action Required';

  @override
  String get app__feature_unavailable =>
      'This feature is not available for your platform.';

  @override
  String get app__preview => 'Preview';

  @override
  String get app__open_file => 'Open file';

  @override
  String get app__change_collection => 'Change Collection';

  @override
  String get app__no_name => 'No Name';

  @override
  String get app__share => 'Share';

  @override
  String get app__clip_actions => 'Clip Actions';

  @override
  String get app__copy_content => 'Copy Content';

  @override
  String get app__paste_content => 'Paste Content';

  @override
  String get app__loading => 'Loading...';

  @override
  String get app__uploading => 'Uploading...';

  @override
  String get app__syncing => 'Syncing...';

  @override
  String app__sync_cooldown({required String time}) {
    return 'Sync is on cooldown. Please wait $time before syncing again.';
  }

  @override
  String get app__sync => 'Sync';

  @override
  String get app__queued => 'Queued';

  @override
  String get app__local => 'Local';

  @override
  String get app__utc => 'UTC';

  @override
  String get app__send_message => 'Send Message';

  @override
  String get app__send_email => 'Send Email';

  @override
  String get app__empty_clipboard => 'Your clipboard is empty.';

  @override
  String get app__load_more => 'Fetch More';

  @override
  String get app__more => 'More';

  @override
  String get app__search => 'Search';

  @override
  String get app__no_results => 'No results found';

  @override
  String get app__locale_en => 'English';

  @override
  String get app__locale_es => 'Spanish';

  @override
  String get app__locale_fr => 'French';

  @override
  String get app__locale_de => 'German';

  @override
  String get app__locale_zh => 'Chinese';

  @override
  String get app__locale_pt => 'Portuguese';

  @override
  String get app__language => 'Language';

  @override
  String get app__yes => 'Yes';

  @override
  String get app__no => 'No';

  @override
  String get app__quit => 'Quit';

  @override
  String get app__clear => 'Clear';

  @override
  String get app__reset => 'Reset';

  @override
  String get app__continue => 'Continue';

  @override
  String get app__paste => 'Paste';

  @override
  String get app__copycat_logo => 'CopyCat Logo';

  @override
  String get app__logout => 'Logout';

  @override
  String get app__no_collection => 'No Collection Found';

  @override
  String get app__create_collection => 'Create Collection';

  @override
  String get app__create => 'Create';

  @override
  String get app__pro_tip => 'Pro Tip';

  @override
  String get app__try_again => 'Try Again';

  @override
  String get app__realtime_connected => 'Realtime Connected';

  @override
  String get app__realtime_disconnected => 'Realtime Disconnected';

  @override
  String get app__realtime_connecting => 'Realtime Connecting...';

  @override
  String get app__ack__exported => 'Exported';

  @override
  String get app__ack__copied => 'Copied';

  @override
  String app__ack__copied_from_device({required String device}) {
    return 'Copied from $device';
  }

  @override
  String app__ack__received_from_device({required String device}) {
    return 'Received from $device';
  }

  @override
  String get app__ack__excluded => 'Excluded';

  @override
  String app__ack__excluded_with_reason({required String reason}) {
    return 'Excluded • $reason';
  }

  @override
  String get app__ack__reason_phone => 'Phone';

  @override
  String get app__ack__reason_email => 'Email';

  @override
  String get app__ack__reason_credit_card => 'Credit Card';

  @override
  String get app__ack__reason_sensitive_url => 'Sensitive URL';

  @override
  String get app__ack__reason_app => 'Sensitive App';

  @override
  String get app__ack__reason_pattern => 'Pattern';

  @override
  String get app__ack__reason_title => 'Sensitive Window';

  @override
  String get app__ack__pasted => 'Pasted';

  @override
  String get app__ack__pasting => 'Pasting';

  @override
  String get app__ack__done => 'Done';

  @override
  String get app__ack__quit_app => 'Quit App';

  @override
  String get app__ack__deleted => 'Deleted';

  @override
  String get app__ack__internet_connected => 'Internet Connected';

  @override
  String get app__ack__internet_disconnected => 'Internet Disconnected';

  @override
  String get app__ack__logout_success => 'You are successfully logged out.';

  @override
  String get app__ack__no_app_for_file =>
      'No application found to open this file.';

  @override
  String get app__ack__perm_fail_to_open_file =>
      'Permission to open this file not granted.';

  @override
  String get app__ack__missing_e2e_setup => 'Missing encryption setup';

  @override
  String app__ack__failed_to_sync({
    required String entityType,
    required String message,
  }) {
    return 'Failed to sync $entityType: $message';
  }

  @override
  String app__index_pending({required int total}) {
    return '⚠️ Index $total clips to make them searchable. It only takes a moment.';
  }

  @override
  String get app__indexing_completed =>
      '🎉 Search indexing completed. Your clips are now searchable.';

  @override
  String get dialog__delete_clip__title => 'Delete Clip';

  @override
  String dialog__delete_clip__subtitle({required int itemCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      one: 'Are you sure you want to delete this clip?',
      other: 'Are you sure you want to delete these clips?',
    );
    return '$_temp0';
  }

  @override
  String get dialog__e2e__title => 'End to End Encryption';

  @override
  String get dialog__text__e2e_key_export =>
      'Congratulations, you have successfully configured the end-to-end encryption.';

  @override
  String get dialog__text__e2e_key_export__note =>
      'Click the button below to export your encryption key.\nSave the key in a secure location to ensure you can set up other devices to access your encrypted information.';

  @override
  String get dialog__text__e2e_key_generate =>
      'Generate an encryption key and store it securely. This key is required to set up other devices for accessing your encrypted data.';

  @override
  String get dialog__button__e2e_generating_key => 'Generating';

  @override
  String get dialog__button__e2e_generate_key => 'Generated';

  @override
  String get dialog__text__invalid_e2e_key => 'The imported key is invalid!';

  @override
  String get dialog__text__e2e_key_import__note =>
      'Import your encryption key below to access your encrypted data on this device.';

  @override
  String get dialog__button__e2e_importing_key => 'Importing';

  @override
  String get dialog__button__e2e_import_key => 'Import';

  @override
  String get dialog__button__e2e_clear_key => 'Clear Key';

  @override
  String get dialog__title__e2e_clear_key => 'Clear Encryption Key';

  @override
  String get dialog__text__e2e_clear_key__confirm =>
      'Are you sure you want to remove the encryption key from this device? You will not be able to decrypt encrypted clips until you import the key again.';

  @override
  String get dialog__text__inconsistent_time__title => 'Time Sync Warning';

  @override
  String get dialog__text__inconsistent_time__content =>
      'Inconsistent Device Time Detected\n\nTo ensure accurate clipboard syncing, please check and correct your device\'s time settings.\n\nInconsistent time settings may cause synchronization issues.';

  @override
  String get dialog__text__inconsistent_time__still_off =>
      'Clock is still out of sync. Please update your system time manually.';

  @override
  String get dialog__text__inconsistent_time__ntp_unreachable =>
      'Could not reach time server. Please check your internet connection and sync your clock manually.';

  @override
  String get dialog__text__inconsistent_time__check_failed =>
      'Time check failed. Please update your system clock manually.';

  @override
  String get dialog__button__try_again => 'Check Again';

  @override
  String get dialog__button__try_fix => 'Try Auto-Fix';

  @override
  String get dialog__record_keys__title => 'Record Keyboard Shortcut';

  @override
  String get dialog__record_keys__subtitle =>
      'Type your shortcut using your keyboard and click ';

  @override
  String dialog__delete_collection__title({required String collectionName}) {
    return 'Delete $collectionName';
  }

  @override
  String get dialog__delete_collection__subtitle =>
      'Are you sure to delete this collection?';

  @override
  String get dialog__ack__sub_updated => 'Subscription Updated';

  @override
  String get dialog__grant_entitlement__title => 'Granted Entitlement';

  @override
  String get dialog__grant_entitlement__subtitle_p1 =>
      'Granted Entitlement Codes are shared with specific individuals for custom entitlements. You can check if invitations are still available by ';

  @override
  String get dialog__grant_entitlement__subtitle_p2 => 'Clicking Here.';

  @override
  String get dialog__grant_entitlement__enter_code =>
      'Enter the code and press Submit';

  @override
  String get dialog__grant_entitlement__code_label => 'Code';

  @override
  String get dialog__grant_entitlement__apply_code => 'Apply';

  @override
  String get view_button__switch_to_grid => 'Switch to Grid Layout';

  @override
  String get view_button__switch_to_list => 'Switch to List Layout';

  @override
  String get view_button__change_view => 'Change View';

  @override
  String get view_button__view_window => 'Windowed';

  @override
  String get view_button__view_dock_right => 'Dock Right';

  @override
  String get view_button__view_dock_bottom => 'Dock Bottom';

  @override
  String get view_button__view_dock_left => 'Dock Left';

  @override
  String get view_button__view_dock_top => 'Dock Top';

  @override
  String get view_button__pin => 'Pin to top';

  @override
  String get view_button__unpin => 'Unpin';

  @override
  String get sub_dialog__text__included => 'Included';

  @override
  String get sub_dialog__f1__title => 'Unlimited Clipboard Items';

  @override
  String get sub_dialog__f1__subtitle =>
      'Never run out of space with unlimited clipboard items, ensuring you always have access to your most recent copies.';

  @override
  String get sub_dialog__f2__title => 'Support all major platforms';

  @override
  String get sub_dialog__f2__subtitle =>
      'Seamlessly sync across all major platforms—Android, iOS, Windows, macOS, and Linux —for uninterrupted productivity anywhere.';

  @override
  String get sub_dialog__f3__title => 'Supports Apple Universal Clipboard';

  @override
  String get sub_dialog__f3__subtitle =>
      'Effortlessly transfer clipboard content between your Apple devices with support for Apple\'s Universal Clipboard.';

  @override
  String get sub_dialog__f4__title => 'On-Device Storage';

  @override
  String get sub_dialog__f4__subtitle =>
      'Keep your data secure with on-device storage, ensuring your clipboard items are always within reach and under your control.';

  @override
  String get sub_dialog__f5__title => 'Google Drive Integration';

  @override
  String get sub_dialog__f5__subtitle =>
      'Securely store files and media on Google Drive, integrating seamlessly with CopyCat Clipboard for enhanced data management.';

  @override
  String get sub_dialog__f6__title => 'Instant Search';

  @override
  String get sub_dialog__f6__subtitle =>
      'Find what you need instantly with powerful instant search capabilities, making retrieval of clipboard items fast and efficient.';

  @override
  String get sub_dialog__f7__title => 'Syncing Up to the Last 24 Hours';

  @override
  String get sub_dialog__f7__subtitle =>
      'Access and sync your clipboard history across all your devices for the past 24 hours. This ensures you never lose important copied items, making your workflow seamless and efficient.';

  @override
  String get sub_dialog__f8__title => 'Up to 3 Collections';

  @override
  String get sub_dialog__f8__subtitle =>
      'Organize your clipboard items into up to 3 collections, providing simple categorization for better workflow management.';

  @override
  String get sub_dialog__f9__title => 'Background Sync';

  @override
  String get sub_dialog__f9__subtitle =>
      'Core syncing runs on a best-effort basis and may take up to 15 minutes depending on server load.';

  @override
  String get sub_dialog__f10__title => 'Support End-to-End Encryption';

  @override
  String get sub_dialog__f10__subtitle =>
      'E2EE will make everything encrypted for superior privacy.';

  @override
  String get sub_dialog__text__pro_title => 'With PRO';

  @override
  String get sub_dialog__text__pro_subtitle => 'Everything included in Core +';

  @override
  String get sub_dialog__f11__title => 'Up to 50 Collections';

  @override
  String get sub_dialog__f11__subtitle =>
      'Organize your clipboard items into up to 50 collections for ultimate management.';

  @override
  String get sub_dialog__f12__title => 'Syncing Up to the Last 30 Days';

  @override
  String get sub_dialog__f12__subtitle =>
      'Clipboard history is synced across all your devices for clips created within the last 30 days. This means you can access any clip you copied in the past month, no matter which device you are using.';

  @override
  String get sub_dialog__f13__title => 'Real Time Synchronization';

  @override
  String get sub_dialog__f13__subtitle => 'Experience lightning-fast syncing.';

  @override
  String get sub_dialog__f14__title => 'Faster and Priority Support';

  @override
  String get sub_dialog__f14__subtitle =>
      'Get prompt and prioritized support as a PRO user.';

  @override
  String get sub_dialog__f15__title => 'Early Access to New Features';

  @override
  String get sub_dialog__f15__subtitle =>
      'Be the first to try out new features and updates.';

  @override
  String get sub_dialog__f16__title => 'Custom Exclusion Rules';

  @override
  String get sub_dialog__f16__subtitle =>
      'Precise control over your clipboard. Allows you to define what to copy, from where to copy and when to copy.';

  @override
  String get sub_dialog__f17__title => 'Drag & Drop';

  @override
  String get sub_dialog__f17__subtitle =>
      'Seamlessly move items in any direction on your Desktop and Tablet devices.';

  @override
  String get sub_dialog__f18__title => 'Theming';

  @override
  String get sub_dialog__f18__subtitle =>
      'Customize the entire look and feel of the app to match your preferences.';

  @override
  String get paywall_dialog__text__month => 'month';

  @override
  String get paywall_dialog__text__year => 'year';

  @override
  String get paywall_dialog__text__subscription => 'Subscription';

  @override
  String get paywall_dialog__text__supported_platform =>
      'To access premium features on Copycat Clipboard, please subscribe through the Play Store or Apple App Store. Your subscription will be synced across all your devices, including Linux and Windows.';

  @override
  String get paywall_dialog__text__unlock_pro => 'Unlock CopyCat PRO';

  @override
  String get paywall_dialog__text__unlock_pro_p1 =>
      'Enjoy over 30 days of synced history, over 50 collections, end-to-end encryption, real-time syncing, access to the newest features, and much more.';

  @override
  String get paywall_dialog__text__try_again => 'Please try again';

  @override
  String get paywall_dialog__text__current_plan => 'Current Plan';

  @override
  String get paywall_dialog__text__expired_plan => 'Current Plan • Expired';

  @override
  String paywall_dialog__text__trial_till({required DateTime till}) {
    final intl.DateFormat tillDateFormat = intl.DateFormat.yMMMd(localeName);
    final String tillString = tillDateFormat.format(till);

    return 'Trial till $tillString';
  }

  @override
  String get paywall_dialog__text__upgrade => 'Upgrade';

  @override
  String fab__create_collection({required String remaining}) {
    return 'Create Collection ( $remaining Remaining )';
  }

  @override
  String get fab__sync => 'Sync';

  @override
  String get fab__sync_unavailable => 'Sync Unavailable';

  @override
  String get fab__sync_up_to_date => 'Already up to date.';

  @override
  String fab__sync_failed({required String message}) {
    return 'Sync failed : $message';
  }

  @override
  String get layout__navbar__clipboard => 'Clipboard';

  @override
  String get layout__navbar__collections => 'Collections';

  @override
  String get layout__navbar__settings => 'Settings';

  @override
  String get search__tooltip__filter => 'Search filters';

  @override
  String manage_sub__ack__promo_sub({required String till}) {
    return 'You are using a promo subscription till $till';
  }

  @override
  String get manage_sub__button__text => 'Manage Subscriptions';

  @override
  String get my_account__button__tooltip => 'My Account';

  @override
  String get badges__tooltip__experimental =>
      'This feature is experimental and might not work as expected.';

  @override
  String get badges__label__pro => 'Pro';

  @override
  String get badges__tooltip__pro_only =>
      'This feature is available for Pro users only.';

  @override
  String get collection_selector__tile__no_collection => 'No Collection';

  @override
  String get collection_selector__button__remove_collection =>
      'Remove Collection';

  @override
  String get dialog__logout__title => 'Logout';

  @override
  String get dialog__logout__subtitle =>
      '⚠️ WARNING ⚠️\n\nLogging out will delete unsynced changes in the local database. Are you sure you want to proceed?';

  @override
  String get dialog__logging_out__ack => 'Logging you out! Please wait...';

  @override
  String get reset_pass__text__label => 'Reset your password';

  @override
  String get dnd__text__drop_here => 'Drop Here';

  @override
  String dnd__ack__error_max_drop_count({required int count}) {
    return 'Maximum $count drop items are allowed at once.';
  }

  @override
  String get search_filter__text__title => 'Filters';

  @override
  String get search_filter__button__apply => 'Apply';

  @override
  String get search_filter__text__from => 'From';

  @override
  String get search_filter__text__select => 'Select';

  @override
  String get search_filter__text__to => 'To';

  @override
  String get search_filter__text__now => 'Now';

  @override
  String get search_filter__text__including => 'Including';

  @override
  String get search_filter__chip__text => 'Text';

  @override
  String get search_filter__chip__url => 'URL';

  @override
  String get search_filter__chip__media => 'Media';

  @override
  String get search_filter__chip__docs => 'Docs';

  @override
  String get search_filter__text__textCategories => 'Text Categories';

  @override
  String get search_filter__text__exclusive => '( Exclusive )';

  @override
  String get search_filter__text_cat__email => 'Email';

  @override
  String get search_filter__text_cat__phone => 'Phone';

  @override
  String get search_filter__text_cat__color => 'Color';

  @override
  String get search_filter__text_cat__struct => 'Struct';

  @override
  String get search_filter__text__sort_by => 'Sort By';

  @override
  String get search_filter__sort_by__last_mod => 'Last Modified';

  @override
  String get search_filter__sort_by__created => 'Created';

  @override
  String get search_filter__sort_by__copy_count => 'Copy Count';

  @override
  String get search_filter__sort_by__last_copied => 'Last Copied';

  @override
  String get search_filter__text__sort_order => 'Sort Order';

  @override
  String get search_filter__sort_ord__asc => 'Asc';

  @override
  String get search_filter__sort_ord__desc => 'Desc';

  @override
  String get search_filter__tooltip__clear => 'Clear';

  @override
  String get search_filter__empty => '∅';

  @override
  String get search_filter__button__reset => 'Reset';

  @override
  String get login__local_signin__tooltip =>
      'No syncing. All data stays on your device.';

  @override
  String get login__local_signin__btn__label => 'Offline Mode';

  @override
  String get login__form__input__name => 'Enter your good name';

  @override
  String get login__form__input__email => 'Enter your email';

  @override
  String get login__form__input__error_email =>
      'Please enter a valid email address';

  @override
  String get login__form__input__password => 'Enter your password';

  @override
  String get login__form__input__error_password_length =>
      'Please enter a password that is at least 6 characters long';

  @override
  String get login__form__button__signin => 'Sign In';

  @override
  String get login__form__button__signup => 'Sign Up';

  @override
  String get login__form__button__forgot_password => 'Forgot your password?';

  @override
  String get login__form__text__signup => 'Don\'t have an account? Sign up';

  @override
  String get login__form__text__old_user => 'Already have an account? Sign in';

  @override
  String get login__form__text__reset_password => 'Send password reset email';

  @override
  String get login__form__text__reset_ack =>
      'Password reset email has been sent';

  @override
  String get login__form__button__back => 'Back to sign in';

  @override
  String get login__form__button__update_password => 'Update Password';

  @override
  String get login__form__text_tnc_p1 =>
      'By continuing you agree to the following ';

  @override
  String get login__form__text_tnc_p2 => 'Privacy policies';

  @override
  String get login__form__text_tnc_p3 => ' and ';

  @override
  String get login__form__text_tnc_p4 => 'Terms of Service.';

  @override
  String get home__search__hint => 'Search in clipboard';

  @override
  String get collections__search__hint => 'Search collection';

  @override
  String get home__search__reset => 'Reset Search';

  @override
  String get preview__vert_view__tab1_title => 'Preview';

  @override
  String get preview__vert_view__tab2__title => 'Details';

  @override
  String get preview__card__missing_text => 'This is an Empty Clip';

  @override
  String get preview__card__video__play => 'Play Video';

  @override
  String get preview__card__video__mute => 'Mute';

  @override
  String get preview__card__video__unmute => 'Unmute';

  @override
  String get preview__card__video__close => 'Close player';

  @override
  String get preview__card__file__open => 'Open File';

  @override
  String get preview__form__title => 'Edit Details';

  @override
  String get preview__inspector__lock_clip => 'Lock Clip';

  @override
  String get preview__inspector_lock_clip_description =>
      'Encrypt this clip, disable search indexing, and require authentication to view it.';

  @override
  String get preview__form__input__title => 'Title';

  @override
  String get preview__form__input__description => 'Description';

  @override
  String get preview__inspector__title => 'Clip Details';

  @override
  String get preview__inspector__untitled => 'Untitled Clip';

  @override
  String get preview__inspector__saved => 'Details updated';

  @override
  String get preview__inspector__save_changes => 'Save changes';

  @override
  String get preview__inspector__decrypt => 'Decrypt';

  @override
  String get preview__inspector__open_source => 'Open Source';

  @override
  String get preview__inspector__section__actions => 'Actions';

  @override
  String get preview__inspector__section__details => 'Details';

  @override
  String get preview__inspector__section__content => 'Content';

  @override
  String get preview__inspector__section__security => 'Security';

  @override
  String get preview__inspector__section__organize => 'Organize';

  @override
  String get preview__inspector__label__created => 'Created';

  @override
  String get preview__inspector__label__modified => 'Modified';

  @override
  String get preview__inspector__label__last_copied => 'Last Copied';

  @override
  String get preview__inspector__label__copied_count => 'Copied Count';

  @override
  String get preview__inspector__label__source_app => 'Source App';

  @override
  String get preview__inspector__label__source_url => 'Source URL';

  @override
  String get preview__inspector__label__file_size => 'File Size';

  @override
  String get preview__inspector__label__mime_type => 'MIME Type';

  @override
  String get preview__inspector__label__extension => 'Extension';

  @override
  String get preview__inspector__label__characters => 'Characters';

  @override
  String get preview__inspector__label__lines => 'Lines';

  @override
  String get preview__inspector__label__link => 'Link';

  @override
  String get preview__inspector__label__image_dimension => 'Dimension';

  @override
  String get preview__inspector__label__device => 'Device';

  @override
  String get preview__inspector__label__storage => 'Storage';

  @override
  String get preview__inspector__status__encrypted => 'Encrypted';

  @override
  String get preview__inspector__status__local_only => 'Local Only';

  @override
  String get preview__inspector__status__synced => 'Synced';

  @override
  String get preview__inspector__status__not_synced => 'Not Synced';

  @override
  String get preview__inspector__status__download_required =>
      'Download Required';

  @override
  String get preview__inspector__status__available => 'Available Offline';

  @override
  String get preview__inspector__type__text => 'Text';

  @override
  String get preview__inspector__type__media => 'Media';

  @override
  String get preview__inspector__type__file => 'File';

  @override
  String get preview__inspector__type__link => 'Link';

  @override
  String get reset_password__appbar__title => 'Reset your password';

  @override
  String get reset_password__success_ack => 'Password reset successfully';

  @override
  String get onboarding__text__welcome => 'Welcome to';

  @override
  String get onboarding__text__lets_continue => 'Let\'s Continue';

  @override
  String get onboarding__button__to_login => 'Sign in';

  @override
  String get onboarding__snackbar__export_success =>
      'Encryption key successfully exported.';

  @override
  String get onboarding__dialog__skip_export__title =>
      '✋ Backup Your Encryption Key';

  @override
  String get onboarding__dialog__skip_export__subtitle =>
      'You haven’t exported your encryption key yet. Without a backup, you won’t be able to access your encrypted clips if the key is lost or you switch devices.\n\n👉 If you already have a secure backup of your key, you can safely continue. Otherwise, we strongly recommend exporting the key now to avoid data loss. Do you still want to continue?';

  @override
  String get onboarding__dialog__export_info__title =>
      '🤔 Why Export the Encryption Key?';

  @override
  String get onboarding__dialog__export_info__subtitle =>
      'Exporting your encryption key is essential for securely accessing your encrypted data on multiple devices. Without the key, your encrypted data will remain inaccessible after sync.\n\nKeep a backup of your encryption key in a secure location to prevent data loss. Remember, the key is unique to your account and cannot be recovered if lost.\n\nNote: Copycat cannot access your encrypted clips or your encryption keys. This is because we value your privacy above everything else.';

  @override
  String get onboarding__text__export_key_headline => 'Clipboard Encryption';

  @override
  String get onboarding__text__export_key_title =>
      '💪 Great News! Encryption is active for your clipboard';

  @override
  String get onboarding__button__export_key => 'Export Key';

  @override
  String get onboarding__dialog__skip_gen_key__title =>
      '✋ Your Clips Will Be Insecure';

  @override
  String get onboarding__dialog__skip_gen_key__subtitle =>
      'You haven’t generated an encryption key yet. Without it, your clips will remain unencrypted and insecure. You can generate the key later in Settings ❯ Security. Do you still want to continue?';

  @override
  String get onboarding__dialog__gen_key_info__title =>
      '🤔 Why Do I Need Encryption?';

  @override
  String get onboarding__dialog__gen_key_info__subtitle =>
      'Encryption protects your data by converting it into a secure format that can only be accessed with a key. Without encryption, your clips are stored in plain text, making them vulnerable to unauthorized access. Enabling encryption ensures that only you can access your sensitive data, providing an extra layer of security against potential breaches.';

  @override
  String get onboarding__text__gen_key_headline => 'Setup Clipboard Encryption';

  @override
  String onboarding__text__key_generated_title({required String keyPreview}) {
    return '🎉 Key $keyPreview*** successfully generated 🎉';
  }

  @override
  String get onboarding__button__regenerate_key => 'Re-Generate Key';

  @override
  String get onboarding__text__no_key =>
      'Your account doesn\'t have any encryption key';

  @override
  String get onboarding__button__generate_key => 'Generate Key';

  @override
  String get onboarding__button__do_it_later => 'Do it later';

  @override
  String get onboarding__button__why_important => 'Why It\'s Important?';

  @override
  String get onboarding__snackbar__invalid_key =>
      'This is not a valid CopyCat encryption key';

  @override
  String get onboarding__dialog__skip_import__title =>
      '✋ Encrypted Clips Inaccessible';

  @override
  String get onboarding__dialog__skip_import__subtitle =>
      'You haven’t imported the encryption key yet. This means all your encrypted clips will remain inaccessible locally after sync.\n\nTo access them, import the key from Settings ❯ Security.\nDo you still want to continue?';

  @override
  String get onboarding__dialog__reset_key__title =>
      '✋ Permanently Delete Encrypted Data';

  @override
  String get onboarding__dialog__reset_key__subtitle =>
      'This action is irreversible. Are you sure you want to permanently delete all encrypted data from the server?';

  @override
  String get onboarding__snackbar__reset_key__success =>
      'Encryption successfully removed.';

  @override
  String get onboarding__dialog__import_info__title => '🤔 Where is my key?';

  @override
  String get onboarding__dialog__import_info__subtitle =>
      'Your encryption key is a secure file generated during the encryption setup process. If you’ve misplaced it, check your downloads folder or any backup location where you might have saved it. Without this key, your encrypted data cannot be accessed.\n\nIf you’ve set up the encryption key on another device, you can export it by going to Settings ❯ Security ❯ E2EE Vault on that device. Transfer the key securely to this device to regain access to your encrypted data.';

  @override
  String get onboarding__text__import_key_headline =>
      'Import Clipboard Encryption Key';

  @override
  String get onboarding__text__import_key_title =>
      'Your account currently has active encryption.';

  @override
  String get onboarding__button__import_key => 'Import Key';

  @override
  String get onboarding__button__reset_key => 'Reset Encryption';

  @override
  String get onboarding__button__where_key => 'Where is the key?';

  @override
  String get onboarding__text__go_home => 'Let\'s go home';

  @override
  String onboarding__restoration__failed({required String message}) {
    return 'Restoration failed: $message';
  }

  @override
  String get onboarding__restoration_warning =>
      '⚠️ Please keep this screen open during syncing to avoid data corruption or inconsistencies.';

  @override
  String get sync_restore__title => 'Restoring your workspace';

  @override
  String get sync_restore__subtitle =>
      'CopyCat is bringing your synced collections and clipboard history onto this device.';

  @override
  String get sync_restore__checking_backup => 'Checking remote backup...';

  @override
  String get sync_restore__decrypting_title => 'Decrypting clips';

  @override
  String get sync_restore__decrypting_counting => 'Counting encrypted clips...';

  @override
  String sync_restore__decrypting_progress({
    required int decrypted,
    required int total,
  }) {
    return 'Decrypted $decrypted of $total';
  }

  @override
  String get sync_restore__workspace_restored => 'Workspace restored';

  @override
  String get sync_restore__data_ready =>
      'Your synced data is ready on this device.';

  @override
  String get sync_restore__restoring_collections =>
      'Restoring collections so clipboard items keep their organization.';

  @override
  String get sync_restore__restoring_clips =>
      'Collections are restored. Clipboard history is next.';

  @override
  String get sync_restore__finishing_checks => 'Finishing restore checks.';

  @override
  String get sync_restore__no_synced_items => 'No synced items found';

  @override
  String sync_restore__restored_count({required int count}) {
    return '$count restored';
  }

  @override
  String sync_restore__restored_of_total({
    required int synced,
    required int total,
  }) {
    return '$synced of $total restored';
  }

  @override
  String get sync_restore__progress_estimating => 'Estimating';

  @override
  String get sync_restore__progress_complete => 'Complete';

  @override
  String get sync_restore__status_ready => 'Ready';

  @override
  String get sync_restore__status_restoring => 'Restoring';

  @override
  String get sync_restore__collections_title => 'Collections';

  @override
  String get sync_restore__collections_description =>
      'Saved groups and organization';

  @override
  String get sync_restore__clipboard_items_title => 'Clipboard items';

  @override
  String get sync_restore__clipboard_items_description =>
      'History, text, links, files, and media';

  @override
  String sync_restore__count_of_total({required int total}) {
    return 'of $total';
  }

  @override
  String get sync_restore__continue_to_copycat => 'Continue to CopyCat';

  @override
  String get sync_restore__failed_title => 'Restoration failed';

  @override
  String get restore_clips__text__title => 'Restore My Clipboard';

  @override
  String get restore_clips__error__no_backup => 'No clipboard backup found';

  @override
  String restore_clips__text__total_count({required int totalCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      totalCount,
      locale: localeName,
      zero: 'clip',
      one: 'clip',
      other: 'clips',
    );
    return 'You have approximately $totalCount $_temp0 to restore.';
  }

  @override
  String get restore_clips__sync_disable =>
      'Syncing is currently disabled. Please enable it to continue.';

  @override
  String get restore_clips__preparing =>
      'Preparing to restore clips. Please wait...';

  @override
  String restore_clips__restored({required int syncCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      syncCount,
      locale: localeName,
      zero: 'clip',
      one: 'clip',
      other: 'clips',
    );
    return 'Your $syncCount $_temp0 have been restored successfully.';
  }

  @override
  String restore_clips__restoring({
    required int synced,
    required int totalCount,
  }) {
    return 'Restored: $synced of $totalCount clips.';
  }

  @override
  String get restore_collections__text__title => 'Restore My Collections';

  @override
  String get restore_collections__error__no_backup =>
      'No collection backup found';

  @override
  String restore_collections__text__total_count({required int totalCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      totalCount,
      locale: localeName,
      zero: 'collection',
      one: 'collection',
      other: 'collections',
    );
    return 'You have approximately $totalCount $_temp0 to restore.';
  }

  @override
  String get restore_collections__sync_disable =>
      'Syncing is currently disabled. Please enable it to continue.';

  @override
  String get restore_collections__preparing =>
      'Preparing to restore collections. Please wait...';

  @override
  String restore_collections__restored({required int syncCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      syncCount,
      locale: localeName,
      zero: 'collection',
      one: 'collection',
      other: 'collections',
    );
    return 'Your $syncCount $_temp0 have been restored successfully.';
  }

  @override
  String restore_collections__restoring({
    required int synced,
    required int totalCount,
  }) {
    return 'Restored: $synced of $totalCount collections.';
  }

  @override
  String get drive__snackbar__success => 'Drive Setup is Now Complete.';

  @override
  String get drive__text__setting_up => 'Setting up and syncing...';

  @override
  String get drive__text__setting_up__warning =>
      'Please wait while we finish this up. Do not close the app.';

  @override
  String get create_clip__appbar__title__new => 'New Clip';

  @override
  String get create_clip__appbar__title__edit => 'Edit Clip';

  @override
  String get create_clip__button__save_new => 'Save as new';

  @override
  String get create_clip__input__hint => 'Write your clip content here';

  @override
  String get collections__text__tip =>
      'To ensure your important clips are always available regardless of time, across all your devices, save them in a collection!';

  @override
  String get collections__appbar__title => 'Collections';

  @override
  String get collections__appbar__title__create => 'Create Collection';

  @override
  String get collections__appbar__title__edit => 'Edit Collection';

  @override
  String get collections__input__name => 'Name';

  @override
  String get collections__input__description => 'Description';

  @override
  String get collections__label__emoji => 'Collection Icon (Click to change)';

  @override
  String get collections__validation__duplicate =>
      'A collection with this icon and name already exists';

  @override
  String get collections__validation__name_required => 'Name is required';

  @override
  String get collections__validation__name_max_length =>
      'Name must be 30 characters or fewer';

  @override
  String get select_collection__appbar__title => 'Select Collection';

  @override
  String get account__dialog__delete_confirm__title => 'Account Delete Request';

  @override
  String get account__dialog__delete_confirm__description =>
      'You will be redirected to the account delete request form, are you sure?';

  @override
  String get account__list_tile__display_name => 'Display Name';

  @override
  String get account__list_tile__email => 'Email';

  @override
  String get account__list_tile__settings => 'Account Settings';

  @override
  String get account__list_tile__danger_zone => 'Danger Zone';

  @override
  String get account__button__req_delete => 'Request Account Deletion';

  @override
  String get account__appbar__title => 'My Account';

  @override
  String get settings__appbar__title => 'Settings';

  @override
  String get settings__header__appearance => 'Appearance';

  @override
  String get settings__header__sorting => 'Default Sorting';

  @override
  String get settings__header__interactions => 'Interactions';

  @override
  String get settings__tab__1 => 'General';

  @override
  String get settings__tab__2 => 'Customization';

  @override
  String get settings__tab__3 => 'Cloud';

  @override
  String get settings__tab__4 => 'Security';

  @override
  String get settings__tab__5 => 'Experimental';

  @override
  String get settings__text__encryption => 'Encryption';

  @override
  String get settings__text__sync_not_available =>
      'Sync-related configurations are not available while using the local clipboard.';

  @override
  String get settings__appbar__er__title => 'Exclusion Rules';

  @override
  String get settings__text__er__predefine => 'Predefined Exclusion Rules';

  @override
  String get settings__text__er__pass_manager => 'Password Managers';

  @override
  String get settings__text__er__pass_manager__subtitle =>
      'Exclude captures from password manager apps';

  @override
  String get settings__text__er__cc => 'Credit Card Number';

  @override
  String get settings__text__er__cc__subtitle =>
      'Exclude detected credit card numbers';

  @override
  String get settings__text__er__phone => 'Phone number';

  @override
  String get settings__text__er__phone__subtitle =>
      'Exclude detected phone numbers';

  @override
  String get settings__text__er__email => 'Email Address';

  @override
  String get settings__text__er__email__subtitle =>
      'Exclude detected email addresses';

  @override
  String get settings__text__er__url => 'Sensitive Url';

  @override
  String get settings__text__er__url__subtitle =>
      'Exclude captures containing sensitive URLs';

  @override
  String get settings__text__decrypted__note =>
      '🥳 Congratulations! All your clips have been successfully decrypted locally,\n so rebuilding the database is not required.';

  @override
  String get settings__appbar__cer__title => 'Custom Exclusion Rules';

  @override
  String get settings__switch__drag_n_drop__title => 'Drag and Drop';

  @override
  String get settings__switch__drag_n_drop__subtitle =>
      'Allow items to be moved freely in both directions within the app.';

  @override
  String get settings__dropdown__no_copy_over_limit__title =>
      'Don\'t Auto Copy Over';

  @override
  String settings__dropdown__no_copy_over_limit__subtitle({
    required String fileSize,
  }) {
    return 'Files and Media over a certain size ($fileSize) will not be copied automatically.';
  }

  @override
  String get settings__text__5MB => '5 MB';

  @override
  String get settings__text__10MB => '10 MB';

  @override
  String get settings__text__20MB => '20 MB';

  @override
  String get settings__text__50MB => '50 MB';

  @override
  String get settings__text__100MB => '100 MB';

  @override
  String get settings__dropdown__no_upload_over_limit__title =>
      'Don\'t Auto Upload Over';

  @override
  String settings__dropdown__no_upload_over_limit__subtitle({
    required String fileSize,
  }) {
    return 'Files and Media over a certain size ($fileSize) will not be uploaded automatically.';
  }

  @override
  String get settings__dropdown__sync_mode__title => 'Sync Mode';

  @override
  String get settings__dropdown__sync_mode__subtitle =>
      'Select the syncing speed that works best for you.';

  @override
  String get settings__sync_mode__realtime => 'Realtime';

  @override
  String get settings__sync_mode__balanced => 'Balanced';

  @override
  String get settings__dropdown__theme__title => 'Theme Mode';

  @override
  String get settings__dropdown__default_sort__title => 'Sort By';

  @override
  String get settings__dropdown__default_sort_order__title => 'Sort Order';

  @override
  String get settings__theme__system => 'System';

  @override
  String get settings__theme__light => 'Light';

  @override
  String get settings__theme__dark => 'Dark';

  @override
  String get settings__dropdown__color_mode__title => 'Color Mode';

  @override
  String get settings__dropdown__color_mode__subtitle =>
      'Select the color mode to customize the appearance of the app. The default option is \'Tonal Spot\'.';

  @override
  String get settings__dropdown__clipboard_feedback__title =>
      'Clipboard Feedback';

  @override
  String get settings__dropdown__clipboard_feedback__subtitle =>
      'Choose how CopyCat responds when a clip is captured.';

  @override
  String get settings__clipboard_feedback__disabled => 'Disabled';

  @override
  String get settings__clipboard_feedback__copy_only => 'Copy Only';

  @override
  String get settings__clipboard_feedback__sync_only => 'Sync Only';

  @override
  String get settings__clipboard_feedback__copy_and_sync => 'Copy & Sync';

  @override
  String get settings__clipboard_feedback__toast => 'Toast';

  @override
  String get settings__color_mode__tonalSpot => 'Tonal Spot';

  @override
  String get settings__color_mode__content => 'Content';

  @override
  String get settings__color_mode__expressive => 'Expressive';

  @override
  String get settings__color_mode__fidelity => 'Fidelity';

  @override
  String get settings__color_mode__fruit_salad => 'Fruit Salad';

  @override
  String get settings__color_mode__monochrome => 'Monochrome';

  @override
  String get settings__color_mode__neutral => 'Neutral';

  @override
  String get settings__color_mode__rainbow => 'Rainbow';

  @override
  String get settings__color_mode__vibrant => 'Vibrant';

  @override
  String get settings__tile__cer_title => 'Custom Rules';

  @override
  String get settings__tile__cer_subtitle =>
      'Exclude by app, app window/website title, website url or regex pattern';

  @override
  String get settings__tile__er_title => 'Exclusion Rules';

  @override
  String get settings__tile__er_subtitle =>
      'Prevent information from copying to clipboard. Click for Advance control.';

  @override
  String get settings__switch__enable_sync__title => 'Clipboard Syncing';

  @override
  String get settings__switch__enable_sync__subtitle =>
      'Sync your clipboard across devices effortlessly.';

  @override
  String get settings__switch__sync_file__title => 'File and Media Syncing';

  @override
  String get settings__switch__sync_file__subtitle =>
      'Toggle to sync files and media clips across devices.';

  @override
  String get settings__switch__paused__title => 'Pause Clipboard Listener';

  @override
  String get settings__switch__paused__subtitle =>
      'Temporarily pause clipboard tracking until a set time.';

  @override
  String settings__switch__paused_active__subtitle({required DateTime time}) {
    final intl.DateFormat timeDateFormat = intl.DateFormat(
      'h:mm a',
      localeName,
    );
    final String timeString = timeDateFormat.format(time);

    return 'Paused until $timeString. Tap to resume or adjust the time.';
  }

  @override
  String get settings__switch__smart_paste__title => 'Smart Paste';

  @override
  String get settings__switch__smart_paste__subtitle =>
      'Paste content directly on the focused app.';

  @override
  String get settings__switch__focus_loss_behavior__title =>
      'Keep Window Open on Focus Loss';

  @override
  String get settings__switch__focus_loss_behavior__subtitle =>
      'When CopyCat loses focus, keep it open in the background instead of hiding it automatically.';

  @override
  String get settings__switch__transform_behavior__title =>
      'Save Transforms as New Clips';

  @override
  String get settings__switch__transform_behavior__subtitle =>
      'When enabled, transform actions create a new clip instead of copying or pasting immediately.';

  @override
  String get settings__switch__type_search__title => 'Type to Search';

  @override
  String get settings__switch__type_search__subtitle =>
      'Search clips while you type in the search bar.';

  @override
  String get settings__switch__startup__title => 'Launch at Startup';

  @override
  String get settings__switch__startup__subtitle =>
      'Automatically start the CopyCat when your device powers on.';

  @override
  String get settings__switch__tray_icon__title => 'Show Menu Bar Icon';

  @override
  String get settings__switch__tray_icon__subtitle =>
      'Display the CopyCat icon in the system menu bar / tray.';

  @override
  String get settings__switch__hide_from_screen_capture__title =>
      'Hide from Screen Recording';

  @override
  String get settings__switch__hide_from_screen_capture__subtitle =>
      'When enabled, screen captures and recordings should hide CopyCat content on supported platforms.';

  @override
  String get settings__switch__hotkey__title => 'Toggle with Hotkey';

  @override
  String get settings__switch__hotkey__subtitle =>
      'Use a keyboard shortcut to quickly access your CopyCat Clipboard';

  @override
  String get settings__switch__paste_stack_hotkey__title =>
      'Paste Stack Hotkey';

  @override
  String get settings__switch__paste_stack_hotkey__subtitle =>
      'Use a keyboard shortcut to open or close Paste Stack';

  @override
  String get settings__switch__quickpaste_hotkey__title => 'Quick Paste Hotkey';

  @override
  String get settings__switch__quickpaste_hotkey__subtitle =>
      'Use a keyboard shortcut to instantly access your top 10 clipboard items';

  @override
  String get settings__hotkey__unassigned => 'Not Assigned';

  @override
  String get settings__hotkey__preview_start => 'Press ';

  @override
  String get settings__hotkey__preview_end => ' to show or hide the app.';

  @override
  String get settings__tile__theme_color__title => 'Theme Color';

  @override
  String get settings__tile__theme_color__subtitle =>
      'This color will influence the overall look and feel of the app.';

  @override
  String get settings__tile__desk_client__title => 'Download Desktop Client';

  @override
  String get settings__tile__mobile_client__title => 'Download Phone Client';

  @override
  String get settings__tile__client__subtitle =>
      'Access your clipboard on all your devices.';

  @override
  String get settings__tile__e2e_setup__title => 'End to End Encryption Setup';

  @override
  String get settings__tile__e2e_setup__subtitle =>
      'Configure encryption for your clips.';

  @override
  String get settings__switch__e2e__title => 'Enable Encryption';

  @override
  String get settings__switch__e2e__subtitle =>
      'When enabled, your clips will be encrypted locally before being synced to the cloud.';

  @override
  String get settings__switch__e2e_nonce__title =>
      'High-Security Mode (Recommended)';

  @override
  String get settings__switch__e2e_nonce__subtitle =>
      'Upgrades encryption to AES-GCM for superior data protection and tamper detection. (Older app versions cannot decrypt these new clips)';

  @override
  String get settings__dialog__conn_gdrive__title => 'Re-Connect Google Drive?';

  @override
  String get settings__dialog__conn_gdrive__subtitle =>
      'Your google drive is already connected! Would you like to reconnect?\n\nTo avoid any data loss, please ensure you use the same account as before.';

  @override
  String get settings__drive__connected => 'Connected';

  @override
  String get settings__drive__loading => 'Loading...';

  @override
  String get settings__drive__authorizing => 'Authorizing...';

  @override
  String get settings__drive__connect => 'Connect';

  @override
  String get settings__drive__disconnected => 'Disconnected';

  @override
  String get settings__text__cloud__title => 'Cloud Drive';

  @override
  String get settings__text__cloud__name => 'Google Drive';

  @override
  String get settings__text__gdrive__error =>
      'Google Drive is not connected. File and media syncing are currently disabled.';

  @override
  String get settings__text__gdrive__info =>
      'Your files and media are securely synced across devices via supported cloud providers, ensuring your privacy is protected. When multiple providers are connected, you can choose the default storage for new uploads.';

  @override
  String get settings__drive__default_tooltip => 'Default storage for uploads';

  @override
  String get settings__drive__set_default => 'Set as default';

  @override
  String get settings__tile__other_cloud__title => 'Setup Other Cloud Drive';

  @override
  String get settings__text__webdav__name => 'WebDAV';

  @override
  String get settings__text__webdav__info =>
      'Connect your WebDAV server (Nextcloud, ownCloud, Synology NAS, etc.) to store and sync your files and media attachments.';

  @override
  String get settings__dialog__webdav__title => 'WebDAV Storage';

  @override
  String get settings__dialog__webdav__preset_provider => 'Provider Preset';

  @override
  String get settings__dialog__webdav__server_url => 'Server URL';

  @override
  String get settings__dialog__webdav__server_url_hint =>
      'https://cloud.example.com/remote.php/dav/files/username/';

  @override
  String get settings__dialog__webdav__username => 'Username';

  @override
  String get settings__dialog__webdav__password => 'Password / App Password';

  @override
  String get settings__dialog__webdav__base_path => 'Storage Folder Path';

  @override
  String get settings__dialog__webdav__base_path_helper =>
      'Folder path cannot be changed after setup. To change it, disconnect first.';

  @override
  String get settings__dialog__webdav__advanced => 'Advanced';

  @override
  String get settings__dialog__webdav__self_signed =>
      'Allow Self-Signed / Insecure Certificates';

  @override
  String get settings__dialog__webdav__auto_clean =>
      'Auto-clean inactive files after 30 days';

  @override
  String get settings__dialog__webdav__auto_clean_subtitle =>
      'Because WebDAV credentials remain private on your device, remote files are not removed by cloud cleanup. When enabled, media files older than 30 days from last modification will be deleted from your WebDAV server. Clips in collections or locked are always protected.';

  @override
  String get settings__dialog__webdav__test_conn => 'Test Connection';

  @override
  String get settings__dialog__webdav__testing => 'Testing Connection...';

  @override
  String get settings__dialog__webdav__test_success => 'Connection successful!';

  @override
  String get settings__dialog__webdav__disconnect => 'Disconnect';

  @override
  String get settings__dialog__webdav__save => 'Save & Connect';

  @override
  String get settings__dialog__webdav__reconnect_title => 'WebDAV Settings';

  @override
  String get settings__dialog__webdav__reconnect_subtitle =>
      'WebDAV is already connected. Update settings or disconnect?';

  @override
  String get settings__dialog__webdav__url_required =>
      'Please enter a valid WebDAV server URL';

  @override
  String get settings__dialog__webdav__username_required =>
      'Please enter a username';

  @override
  String get settings__dialog__webdav__password_required =>
      'Please enter a password or app token';

  @override
  String get settings__app_lock__title => 'App Lock';

  @override
  String get settings__app_lock__tile__subtitle =>
      'Require biometric or device PIN to access the clipboard';

  @override
  String get settings__app_lock__no_biometrics =>
      'No biometric or device credential found. Set up a PIN or biometric in your device settings first.';

  @override
  String get settings__app_lock__lock_after__title => 'Lock after';

  @override
  String get settings__app_lock__lock_after__subtitle =>
      'Automatically lock when the app goes to the background';

  @override
  String get settings__app_lock__timeout__immediately => 'Immediately';

  @override
  String settings__app_lock__timeout__minutes({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'minutes',
      one: 'minute',
    );
    return '$count $_temp0';
  }

  @override
  String get app_lock__screen__locked => 'Locked';

  @override
  String get app_lock__screen__unlock => 'Unlock';

  @override
  String get settings__lan__title => 'LAN Network';

  @override
  String get settings__lan__service_inactive =>
      'Start the background service to use LAN sync';

  @override
  String get settings__lan__subtitle__disabled =>
      'Sync clipboard instantly with nearby devices';

  @override
  String get settings__lan__subtitle__mobile =>
      'Background service scanning for nearby devices';

  @override
  String get settings__lan__searching => 'Searching for devices…';

  @override
  String settings__lan__devices_found({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'devices',
      one: 'device',
    );
    return '$count $_temp0 found on network';
  }

  @override
  String get settings__auto_write__title => 'Auto-Write on Receive';

  @override
  String get settings__auto_write__subtitle =>
      'Automatically copy incoming clips to the clipboard';

  @override
  String get settings__sync__manage_devices__title => 'Manage Sync Devices';

  @override
  String get settings__sync__manage_devices__subtitle =>
      'View active devices and remove devices from sync access.';

  @override
  String get settings__lan_mesh__app_bar_title => 'LAN Network';

  @override
  String get settings__lan_mesh__unknown_device => 'Unknown Device';

  @override
  String get settings__lan_mesh__searching =>
      'Searching for devices on the network…';

  @override
  String get settings__lan_mesh__reachable => 'Reachable';

  @override
  String get settings__lan_mesh__unreachable => 'Unreachable';

  @override
  String get settings__lan_mesh__disabled_banner =>
      'LAN Instant Sync is disabled. Enable it from Settings to discover nearby devices.';

  @override
  String get settings__device_mgmt__app_bar_title => 'Manage Sync Devices';

  @override
  String get settings__device_mgmt__dialog_title => 'Remove Sync Access';

  @override
  String get settings__device_mgmt__dialog_cancel => 'Cancel';

  @override
  String get settings__device_mgmt__dialog_remove => 'Remove';

  @override
  String get settings__device_mgmt__revoke_failed =>
      'Failed to remove sync access.';

  @override
  String get settings__device_mgmt__active_now => 'Active now';

  @override
  String settings__device_mgmt__today_at({required String time}) {
    return 'Today at $time';
  }

  @override
  String settings__device_mgmt__days_ago({required int count}) {
    return '${count}d ago';
  }

  @override
  String get settings__device_mgmt__load_failed => 'Failed to load devices.';

  @override
  String get settings__device_mgmt__retry => 'Retry';

  @override
  String get settings__device_mgmt__empty => 'No sync devices found.';

  @override
  String get settings__device_mgmt__max_limit_tooltip =>
      'Maximum number of devices you can sync with your current plan.';

  @override
  String settings__device_mgmt__max_limit_label({required int count}) {
    return 'Max Limit • $count';
  }

  @override
  String get settings__device_mgmt__active_count_tooltip =>
      'Number of devices currently active.';

  @override
  String settings__device_mgmt__active_count_label({required int count}) {
    return 'Active • $count';
  }

  @override
  String settings__device_card__last_seen({required String time}) {
    return 'Last seen: $time';
  }

  @override
  String get settings__device_card__revoke => 'Revoke';

  @override
  String get device_mgmt_verification_failed =>
      'Sync device access could not be verified right now. Please check your internet connection and try again.';

  @override
  String get device_mgmt_limit_reached =>
      'Sync is disabled on this device because your plan device limit is reached. Remove another device from Settings > Syncing > Manage Sync Devices.';

  @override
  String get custom_er__nav__1 => 'App';

  @override
  String get custom_er__nav__2 => 'Window Title';

  @override
  String get custom_er__nav__3 => 'Url';

  @override
  String get custom_er__nav__4 => 'Text Pattern';

  @override
  String get custom_er__text__not_supported =>
      'This exclusion is not supported yet';

  @override
  String get custom_er__tile__add_app => 'Add an app';

  @override
  String get custom_er__text__no_app => 'No custom app excluded yet';

  @override
  String get custom_er__button__remove_app => 'Remove this app';

  @override
  String get custom_er__tile__pattern =>
      'Prevent copy when copied content matches these patterns';

  @override
  String get custom_er__text__no_pattern => 'No custom pattern(s) excluded';

  @override
  String get custom_er__button__remove_pattern => 'Remove this pattern';

  @override
  String get custom_er__tile__url =>
      'Prevent copy from website matching these url segments.';

  @override
  String get custom_er__input__url_hint => 'Enter a url or part of a url here.';

  @override
  String get custom_er__text__no_url => 'No custom url(s) excluded';

  @override
  String get custom_er__button__remove_url => 'Remove this url';

  @override
  String get custom_er__tile__title =>
      'Prevent copy from app or website when window title matches.';

  @override
  String get custom_er__text__no_title => 'No custom title(s) excluded';

  @override
  String get custom_er__button__remove_title => 'Remove this title';

  @override
  String get about__tile__discord => 'Discord • Connect';

  @override
  String get about__tile__youtube => 'YouTube • Tutorial';

  @override
  String get about__tile__read_tut => 'Read • Tutorial';

  @override
  String get about__tile__github => 'Github • Open Source';

  @override
  String get about__tile__website => 'EntilityStudio • Website';

  @override
  String get about__tile__support => 'Support';

  @override
  String get abc_title => 'Background Clipboard';

  @override
  String get abc__tile__subtitle => 'Listen to the clipboard in the background';

  @override
  String get abc__tip__why_title => 'Why are these permissions needed?';

  @override
  String get abc__tip__why_subtitle =>
      'These permissions ensure CopyCat works correctly in the background, allowing it to detect copied content and provide you with a seamless experience without interruptions.';

  @override
  String get abc__heading__req_perm => 'Required Permissions';

  @override
  String get abc__tile__notification_title => 'Notification Access';

  @override
  String get abc__tile__notification_subtitle =>
      'Displays a persistent notification to inform you that CopyCat is running in the background, ensuring transparency and privacy.';

  @override
  String get abc__tile__battery_opt_title => 'Battery Optimization';

  @override
  String get abc__tile__battery_opt_subtitle =>
      'Prevents the system from shutting down CopyCat while running in the background, ensuring a seamless experience.';

  @override
  String get abc__tile__overlay_title => 'Overlay Permission';

  @override
  String get abc__tile__overlay_subtitle =>
      'Allows CopyCat to read the clipboard by briefly opening a transparent window over the screen and closing it immediately after.';

  @override
  String get abc__tile__acc_title => 'Accessibility Service';

  @override
  String get abc__tile__acc_subtitle =>
      'Start the CopyCat background listener to detect when you copy something and ensure the service restarts automatically after a reboot.';

  @override
  String get abc__ack__ready => 'Setup ready to be configured.';

  @override
  String get abc__ack__preparing => 'Preparing setup, please wait...';

  @override
  String get abc__perm_alert_open_setting__button => 'Open Setting';

  @override
  String get abc__overlay_perm_alert__title => 'Overlay Permission';

  @override
  String get abc__overlay_perm_alert__subtitle =>
      'CopyCat Clipboard needs the \'Draw Over Other Apps\' permission to read clipboard content in the background.';

  @override
  String get abc__overlay_perm_alert__p1_prefix => 'This permission is ';

  @override
  String get abc__overlay_perm_alert__p1_bold =>
      'used only for clipboard detection';

  @override
  String get abc__overlay_perm_alert__p1_suffix =>
      ' when you\'re copying something in the background.';

  @override
  String get abc__overlay_perm_alert__p2_prefix => 'When enabled, CopyCat ';

  @override
  String get abc__overlay_perm_alert__p2_bold =>
      'creates a 0-pixel transparent window';

  @override
  String get abc__overlay_perm_alert__p2_suffix =>
      ' to briefly bring the app to the foreground to read clipboard data.';

  @override
  String get abc__overlay_perm_alert__p3_prefix => 'The app ';

  @override
  String get abc__overlay_perm_alert__p3_bold => 'does not show anything';

  @override
  String get abc__overlay_perm_alert__p3_suffix =>
      ' on your screen during this process.';

  @override
  String get abc__overlay_perm_alert__p4_prefix =>
      'On some devices, the system may show a toast message ';

  @override
  String get abc__overlay_perm_alert__p4_bold =>
      '\'CopyCat pasted from your clipboard\'';

  @override
  String get abc__overlay_perm_alert__p4_suffix =>
      ' when CopyCat reads your clipboard content.';

  @override
  String get abc__overlay_perm_alert__agree =>
      'By granting this permission, you agree to the above usage.';

  @override
  String get abc__accessibility_perm_alert__title => 'Accessibility Permission';

  @override
  String get abc__accessibility_perm_alert__subtitle =>
      'CopyCat Clipboard requires the Accessibility Service to run in the background for real-time clipboard detection and syncing.';

  @override
  String get abc__accessibility_perm_alert__p1_prefix => 'This service is ';

  @override
  String get abc__accessibility_perm_alert__p1_bold => 'only used';

  @override
  String get abc__accessibility_perm_alert__p1_suffix =>
      ' for detecting clipboard content and syncing it across devices when enabled.';

  @override
  String get abc__accessibility_perm_alert__p2_prefix => 'You can ';

  @override
  String get abc__accessibility_perm_alert__p2_bold => 'exclude specific apps';

  @override
  String get abc__accessibility_perm_alert__p2_suffix =>
      ' using the Exclusion Rules feature.';

  @override
  String get abc__accessibility_perm_alert__p3_prefix => 'The app ';

  @override
  String get abc__accessibility_perm_alert__p3_bold =>
      'does not access any other data';

  @override
  String get abc__accessibility_perm_alert__p3_suffix =>
      ' beyond clipboard content.';

  @override
  String get abc__accessibility_perm_alert__p4_prefix => 'Clipboard data ';

  @override
  String get abc__accessibility_perm_alert__p4_bold =>
      'is not shared externally';

  @override
  String get abc__accessibility_perm_alert__p4_suffix =>
      ' and remains private to your devices.';

  @override
  String get abc__accessibility_perm_alert__p5_prefix => 'Clipboard data ';

  @override
  String get abc__accessibility_perm_alert__p5_bold =>
      'is end-to-end encrypted';

  @override
  String get abc__accessibility_perm_alert__p5_suffix =>
      ' (if enabled) in transit and at rest, ensuring privacy across devices.';

  @override
  String get abc__accessibility_perm_alert__agree =>
      'By enabling the Accessibility Service, you acknowledge and agree to the above terms.';

  @override
  String get abc__other_setting__title => 'Other Settings';

  @override
  String get abc__tile__two_way_sync__title => '2-Way Sync';

  @override
  String abc__tile__two_way_sync__subtitle({required String warning}) {
    return 'Keeps your clipboard synced across devices instantly.\n$warning';
  }

  @override
  String get abc__tile__two_way_sync__realtime_required =>
      '⚠️ Realtime mode required.';

  @override
  String get abc__ack__detection_mode_cleared => 'Detection mode cleared';

  @override
  String get abc__ack__detection_mode_updated => 'Detection mode updated';

  @override
  String abc__ack__detection_mode_update_failed({required String message}) {
    return 'Failed to update detection mode: $message';
  }

  @override
  String get abc__detection_mode__title => 'Detection Mode';

  @override
  String get abc__detection_mode__subtitle__enabled =>
      'Choose how CopyCat detects copy actions in other apps. CopyCat stays inactive until you pick a mode.';

  @override
  String get abc__detection_mode__subtitle__disabled =>
      'Enable accessibility service first, then choose a detection mode.';

  @override
  String get abc__detection_mode__mode_1 => 'Efficient';

  @override
  String get abc__detection_mode__mode_2 => 'Maximum Compatibility';

  @override
  String get abc__network__header => 'Network';

  @override
  String current_time__local({required String time}) {
    return 'Local: $time';
  }

  @override
  String current_time__utc({required String time}) {
    return 'UTC: $time';
  }

  @override
  String encrypted_stat__summary({required int count}) {
    return 'You currently have $count encrypted clips that are inaccessible.';
  }

  @override
  String get encrypted_stat__all_decrypted =>
      '🥳 Congratulations! All your clips have been successfully decrypted locally, so rebuilding the database is not required.';

  @override
  String get encrypted_stat__rebuild_database => 'Rebuild Database';

  @override
  String tray__tooltip__paused_till({required String time}) {
    return 'CopyCat Clipboard - Paused till $time';
  }

  @override
  String get tray__menu__resume_copycat => 'Resume';

  @override
  String get tray__menu__pause_copycat => 'Pause';

  @override
  String get tray__menu__paste_stack => 'Paste Stack';

  @override
  String get tray__menu__restart_app => 'Restart';

  @override
  String get tray__dialog__quit__subtitle => 'Are you sure you want to quit?';

  @override
  String get splash__checking_authentication =>
      'Checking for authentication...';

  @override
  String paste_stack__title({required int count}) {
    return 'Paste Stack • $count';
  }

  @override
  String get paste_stack__reorder_hint => 'You can drag item to reorder.';

  @override
  String get paste_stack__reverse_tooltip => 'Reverse Stack';

  @override
  String paste_stack__limit_note({required int count}) {
    return 'You have a limit of $count items';
  }

  @override
  String get multi_paste__title => 'Multi Paste Setup';

  @override
  String get multi_paste__subtitle =>
      'Control how selected clips are merged and paced.';

  @override
  String get multi_paste__stat__selected => 'Selected';

  @override
  String get multi_paste__stat__text => 'Text';

  @override
  String get multi_paste__stat__non_text => 'Non-text';

  @override
  String get multi_paste__merge__title => 'Merge consecutive text clips';

  @override
  String get multi_paste__merge__subtitle =>
      'Text clips merge until a non-text clip interrupts the sequence.';

  @override
  String get multi_paste__separator__title => 'Separator';

  @override
  String get multi_paste__separator__new_line => 'New line';

  @override
  String get multi_paste__separator__space => 'Space';

  @override
  String get multi_paste__separator__custom => 'Custom';

  @override
  String get multi_paste__separator__custom_label => 'Custom separator';

  @override
  String get multi_paste__separator__custom_hint =>
      'Supports escape sequences like \\n and \\t';

  @override
  String get multi_paste__pacing__title => 'Paste pacing';

  @override
  String get multi_paste__pacing__subtitle =>
      'Increase the delay if the target app misses paste events.';

  @override
  String get multi_paste__wait_between_pastes => 'Wait time between pastes';

  @override
  String get multi_paste__validation__wait_positive =>
      'Wait time must be a positive number.';

  @override
  String get multi_paste__validation__custom_separator_required =>
      'Please enter a custom separator.';

  @override
  String get settings__tile__backup_restore__title => 'Backup & Restore';

  @override
  String get settings__tile__backup_restore__subtitle =>
      'Create .ccbkup backups and restore locally';

  @override
  String get settings__switch__rich_data_capture__title => 'Rich Data Capture';

  @override
  String get settings__switch__rich_data_capture__subtitle =>
      'Keep formatting when you copy and paste between apps.';

  @override
  String get settings__decrypt__title => 'Clipboard Decryption';

  @override
  String settings__decrypt__count({required int count}) {
    return 'Currently you have $count encrypted clips locally.';
  }

  @override
  String settings__decrypt__progress({
    required int decrypted,
    required int total,
  }) {
    return 'Decrypted: $decrypted of $total clips.';
  }

  @override
  String get settings__decrypt__warning =>
      '⚠️ Please keep this screen open during this process to avoid data corruption or inconsistencies.';

  @override
  String get not_found__title => 'Page Not Found';

  @override
  String get not_found__subtitle =>
      'The page you are looking for is not found.';

  @override
  String get not_found__go_home => 'Go Home';

  @override
  String get backup_restore__dialog__save_as => 'Save Backup As';

  @override
  String get backup_restore__busy__creating => 'Creating backup...';

  @override
  String get backup_restore__error__encryption_unavailable =>
      'Encryption is enabled but currently unavailable. Please unlock E2EE and try again.';

  @override
  String backup_restore__snackbar__saved({required String outputPath}) {
    return 'Backup saved to $outputPath';
  }

  @override
  String backup_restore__snackbar__create_failed({required String message}) {
    return 'Backup failed: $message';
  }

  @override
  String get backup_restore__dialog__select_file => 'Select Backup File';

  @override
  String get backup_restore__dialog__restore_title => 'Restore Backup';

  @override
  String get backup_restore__dialog__restore_subtitle =>
      'Enter password if this backup is password-protected.';

  @override
  String get backup_restore__dialog__restore_action => 'Restore';

  @override
  String get backup_restore__busy__restoring => 'Restoring backup...';

  @override
  String backup_restore__snackbar__restore_completed({
    required int clips,
    required int collections,
  }) {
    return 'Restore completed: $clips clips, $collections collections.';
  }

  @override
  String backup_restore__snackbar__restore_failed({required String message}) {
    return 'Restore failed: $message';
  }

  @override
  String get backup_restore__error__select_clip_type =>
      'Select at least one clip type.';

  @override
  String get backup_restore__error__from_after_to =>
      'From date must be earlier than To date.';

  @override
  String get backup_restore__dialog__options__description =>
      'Choose what to include in this backup archive.';

  @override
  String get backup_restore__section__clip_types => 'Clip Types';

  @override
  String get backup_restore__section__cached_files => 'Cached Files';

  @override
  String get backup_restore__input__max_cached_file_size =>
      'Max cached file size (MB)';

  @override
  String get backup_restore__input__max_cached_file_size__hint =>
      'Optional, e.g. 50';

  @override
  String get backup_restore__error__positive_number =>
      'Enter a positive number.';

  @override
  String get backup_restore__text__select_file_media_for_cache_limit =>
      'Select File or Media clip types to configure a max cached file size.';

  @override
  String get backup_restore__section__date_range => 'Date Range';

  @override
  String get backup_restore__from_date => 'From date';

  @override
  String get backup_restore__to_date => 'To date';

  @override
  String get backup_restore__no_minimum_date => 'No minimum date';

  @override
  String get backup_restore__no_maximum_date => 'No maximum date';

  @override
  String get backup_restore__clear_date_filter => 'Clear date filter';

  @override
  String get backup_restore__section__security => 'Security';

  @override
  String get backup_restore__toggle__password_protect =>
      'Protect backup with password';

  @override
  String get backup_restore__input__password => 'Password';

  @override
  String get backup_restore__input__password__hint => 'At least 6 characters';

  @override
  String get backup_restore__error__password_min_length =>
      'Password must be at least 6 characters.';

  @override
  String get backup_restore__dialog__create_manual_title =>
      'Create Manual Backup';

  @override
  String get backup_restore__appbar__title => 'Backup & Restore';

  @override
  String get backup_restore__card__title => 'Manual Backup & Restore';

  @override
  String get backup_restore__card__subtitle =>
      'Create local .ccbkup archives with optional password protection and restore them locally with best-effort dedupe.';

  @override
  String get backup_restore__actions__title => 'Actions';

  @override
  String get backup_restore__button__create => 'Create Backup';

  @override
  String get backup_restore__button__restore => 'Restore Backup';

  @override
  String get backup_restore__snapshot__backup_title => 'Latest Backup Snapshot';

  @override
  String get backup_restore__snapshot__restore_title =>
      'Latest Restore Snapshot';

  @override
  String get backup_restore__snapshot__restore_subtitle =>
      'Best-effort dedupe and integrity report';

  @override
  String get backup_restore__empty_session =>
      'No backup or restore has been run in this session yet.';

  @override
  String get backup_restore__label__collections => 'Collections';

  @override
  String get backup_restore__label__clips => 'Clips';

  @override
  String get backup_restore__label__files_included => 'Files Included';

  @override
  String get backup_restore__label__files_missing => 'Files Missing';

  @override
  String get backup_restore__label__files_skipped_by_size => 'Skipped by Size';

  @override
  String get backup_restore__label__encrypted_clips => 'Encrypted Clips';

  @override
  String get backup_restore__label__collections_restored =>
      'Collections Restored';

  @override
  String get backup_restore__label__collections_duplicates =>
      'Collections Duplicates';

  @override
  String get backup_restore__label__collections_failed => 'Collections Failed';

  @override
  String get backup_restore__label__clips_restored => 'Clips Restored';

  @override
  String get backup_restore__label__clips_duplicates => 'Clips Duplicates';

  @override
  String get backup_restore__label__clips_failed => 'Clips Failed';

  @override
  String get backup_restore__label__attachments_restored =>
      'Attachments Restored';

  @override
  String get backup_restore__label__attachments_missing =>
      'Attachments Missing';

  @override
  String get backup_restore__label__attachments_failed => 'Attachments Failed';

  @override
  String get backup_restore__label__corrupt_entries => 'Corrupt Entries';

  @override
  String get subscription__loading => 'Loading...';

  @override
  String get review__dialog__title => 'Liking CopyCat so far?';

  @override
  String get review__dialog__message =>
      'A quick rating helps more people discover CopyCat and keeps new features coming.';

  @override
  String get review__dialog__never => 'Never';

  @override
  String get review__dialog__remind_later => 'Remind me in 7 days';

  @override
  String get review__dialog__rate_now => 'Give a Quick Rating';

  @override
  String get settings__tile__review__title => 'Rate CopyCat';

  @override
  String get settings__tile__review__subtitle =>
      'Leave a review on the App Store';

  @override
  String get collections__read_only__banner =>
      'Read-only on your current plan. Upgrade to edit this collection.';

  @override
  String get collections__read_only__toast =>
      'This collection is read-only on your current plan. Upgrade to edit all collections.';

  @override
  String get collections__read_only__upgrade_action => 'Upgrade';

  @override
  String get collections__locked_section__label => 'Locked';

  @override
  String get transform__section__text_core => 'Text Core';

  @override
  String get transform__section__text_utilities => 'Text Utilities';

  @override
  String get transform__section__struct => 'Struct';

  @override
  String get transform__section__urls => 'URLs';

  @override
  String get transform__section__colors => 'Colors';

  @override
  String get transform__section__emails_phones => 'Emails / Phones';

  @override
  String get transform__section__structured_text => 'Structured Text';

  @override
  String get transform__label__uppercase => 'Uppercase';

  @override
  String get transform__label__lowercase => 'Lowercase';

  @override
  String get transform__label__capitalize => 'Capitalize';

  @override
  String get transform__label__trim_whitespace => 'Trim whitespace';

  @override
  String get transform__label__remove_line_breaks => 'Remove line breaks';

  @override
  String get transform__label__normalize_spaces => 'Normalize spaces';

  @override
  String get transform__label__reverse_text => 'Reverse text';

  @override
  String get transform__label__deduplicate_lines => 'Deduplicate lines';

  @override
  String get transform__label__json_prettify => 'JSON → prettify';

  @override
  String get transform__label__json_minify => 'JSON → minify';

  @override
  String get transform__label__url_encode => 'URL encode';

  @override
  String get transform__label__url_decode => 'URL decode';

  @override
  String get transform__label__base64_encode => 'Base64 encode';

  @override
  String get transform__label__base64_decode => 'Base64 decode';

  @override
  String get transform__label__remove_tracking_params =>
      'Remove tracking params';

  @override
  String get transform__label__extract_domain => 'Extract domain';

  @override
  String get transform__label__hex_to_rgb => 'HEX → RGB';

  @override
  String get transform__label__rgb_to_hex => 'RGB → HEX';

  @override
  String get transform__label__hex_to_hsl => 'HEX → HSL';

  @override
  String get transform__label__copy_cleaned => 'Copy cleaned';

  @override
  String get transform__label__extract_emails => 'Extract emails';

  @override
  String get transform__label__extract_urls => 'Extract URLs';

  @override
  String get transform__label__extract_numbers => 'Extract numbers';

  @override
  String get transfer__scan_qr => 'Scan QR';

  @override
  String get transfer__show_qr => 'Show QR';

  @override
  String get transfer__enter_passcode => 'Enter Passcode';

  @override
  String get transfer__six_digit_passcode => '6-digit passcode';

  @override
  String get transfer__securely_transfer_via_qr =>
      'Securely transfer to nearby device via QR (Recommended)';

  @override
  String get transfer__nearby_device => 'Transfer to Nearby Device';

  @override
  String get transfer__scan_qr_and_enter_passcode =>
      'Scan this QR on your other device, then enter the passcode.';

  @override
  String get transfer__enter_passcode_on_other_device =>
      'Enter this passcode on the other device.';

  @override
  String get transfer__show_passcode => 'Show Passcode';

  @override
  String get transfer__device_has_no_camera_use_file_import =>
      'This device does not have a camera. Use the file import option instead.';

  @override
  String get transfer__scan_qr_from_other_device =>
      'Scan the QR from your other device.';

  @override
  String get settings__personal_drive__title => 'Personal Drive';

  @override
  String get settings__personal_drive__subtitle =>
      'Sync your file clips to your personal cloud for secure backup and access across devices.';
}
