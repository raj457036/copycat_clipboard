import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'CopyCat';

  @override
  String get en => 'Englisch';

  @override
  String get es => 'Spanisch';

  @override
  String get fr => 'Französisch';

  @override
  String get de => 'Deutsch';

  @override
  String get language => 'Sprache';

  @override
  String get enterEmail => 'Geben Sie Ihre E-Mail-Adresse ein';

  @override
  String get validEmailError =>
      'Bitte geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get enterPassword => 'Geben Sie Ihr Passwort ein';

  @override
  String get passwordLengthError =>
      'Bitte geben Sie ein Passwort mit mindestens 6 Zeichen ein';

  @override
  String get signIn => 'Anmelden';

  @override
  String get signUp => 'Registrieren';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get dontHaveAccount => 'Haben Sie kein Konto? Registrieren';

  @override
  String get haveAccount => 'Haben Sie bereits ein Konto? Anmelden';

  @override
  String get sendPasswordReset => 'Passwort-Reset-E-Mail senden';

  @override
  String get backToSignIn => 'Zurück zur Anmeldung';

  @override
  String get updatePassword => 'Passwort aktualisieren';

  @override
  String get unexpectedError => 'Ein unerwarteter Fehler ist aufgetreten';

  @override
  String get passwordResetSent => 'Passwort-Reset-E-Mail wurde gesendet';

  @override
  String get collections => 'Sammlungen';

  @override
  String get collection => 'Sammlung';

  @override
  String get createCollection => 'Sammlung erstellen';

  @override
  String get editCollection => 'Sammlung bearbeiten';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get description => 'Beschreibung';

  @override
  String get noDescription => 'Keine Beschreibung';

  @override
  String get noResultsWereFound => 'Keine Ergebnisse gefunden';

  @override
  String get driveSetupDone => 'Laufwerk-Setup abgeschlossen 🥳';

  @override
  String get pleaseWaitWhileWeSetupSyncing =>
      'Bitte warten, während wir die Synchronisierung einrichten';

  @override
  String get driveSetupMayTakeFewMin =>
      'Dies kann etwa eine Minute dauern.\n(Bitte schließen Sie die App nicht)';

  @override
  String get refreshNow => 'Jetzt aktualisieren';

  @override
  String newUpdates(int ADDED, int UPDATED, int DELETED) {
    return 'Änderungen verfügbar:\n $ADDED hinzugefügt, $UPDATED aktualisiert und $DELETED gelöscht';
  }

  @override
  String get itemDeleted => 'Element gelöscht';

  @override
  String get deletingFromCloud => 'Aus der Cloud löschen';

  @override
  String get emptyClipboard => 'Ihr Zwischenspeicher ist leer';

  @override
  String get loadMore => 'Mehr laden';

  @override
  String get clipboard => 'Zwischenspeicher';

  @override
  String get search => 'Suche';

  @override
  String get share => 'Teilen';

  @override
  String get export => 'Exportieren';

  @override
  String get searchClipboard => 'Zwischenspeicher durchsuchen';

  @override
  String get settings => 'Einstellungen';

  @override
  String get copyCatClipboard => 'CopyCat Zwischenspeicher';

  @override
  String get oneClipboardLimitlessPosibility =>
      'Ein Zwischenspeicher, unbegrenzte Möglichkeiten';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get preview => 'Vorschau';

  @override
  String get editDetails => 'Details bearbeiten';

  @override
  String get title => 'Titel';

  @override
  String get nothingHere => 'Nichts hier';

  @override
  String get downloading => 'Herunterladen';

  @override
  String get downloadForOffline => 'Für die Offline-Nutzung herunterladen';

  @override
  String get copyToClipboard => 'In den Zwischenspeicher kopieren';

  @override
  String get delete => 'Löschen';

  @override
  String get resetYourPassword => 'Setzen Sie Ihr Passwort zurück';

  @override
  String get passwordResetSuccess => 'Passwort erfolgreich zurückgesetzt';

  @override
  String get findWhateverYouLooking => 'Finden Sie, wonach Sie suchen...';

  @override
  String get noResults => 'Keine Ergebnisse gefunden.';

  @override
  String get searchInClipboard => 'Im Zwischenspeicher suchen';

  @override
  String get basicLocal => 'Basis • Lokal';

  @override
  String get localSettingsDesc =>
      'Diese Einstellungen gelten nur für dieses Gerät.';

  @override
  String get theme => 'Thema';

  @override
  String get syncLocal => 'Synchronisieren • Lokal';

  @override
  String get dontAutoCopyOver => 'Nicht automatisch kopieren';

  @override
  String dontAutoCopyOverDesc(String SIZE) {
    return 'Dateien und Medien über einer bestimmten Größe ($SIZE) werden nicht automatisch kopiert.';
  }

  @override
  String get dontAutoUploadOver => 'Nicht automatisch hochladen';

  @override
  String dontAutoUploadOverDesc(String SIZE) {
    return 'Dateien und Medien über einer bestimmten Größe ($SIZE) werden nicht automatisch hochgeladen.';
  }

  @override
  String get enableSync => 'Synchronisierung aktivieren';

  @override
  String get enableSyncDesc =>
      'Halten Sie Ihre Dateien auf allen Geräten aktuell';

  @override
  String get syncFiles => 'Dateien und Medien synchronisieren';

  @override
  String get syncFilesDesc =>
      'Halten Sie Ihre Dateien und Medien auf allen Geräten aktuell.';

  @override
  String get connected => 'Verbunden';

  @override
  String get loading => 'Laden...';

  @override
  String get authorizing => 'Autorisierung...';

  @override
  String get connectNow => 'Jetzt verbinden';

  @override
  String get tips => 'ⓘ Tipps';

  @override
  String get cloudStorageInfoDefault =>
      '\n\nGoogle Drive nicht verbunden, Datei- und Mediensynchronisierung ist deaktiviert.';

  @override
  String cloudStorageInfo(String INFO) {
    return '${INFO}Ihre Dateien und Medien werden sicher über Google Drive synchronisiert, um Ihre Privatsphäre zu schützen.';
  }

  @override
  String get attentionNeeded => '⚠ Aufmerksamkeit erforderlich!';

  @override
  String get isPaused => 'Ist pausiert?';

  @override
  String isPausedDesc(String isPaused, String TILL) {
    String _temp0 = intl.Intl.selectLogic(
      isPaused,
      {
        'true': 'Automatisches Kopieren ist nicht pausiert',
        'other': 'Automatisches Kopieren ist bis $TILL pausiert',
      },
    );
    return '$_temp0';
  }

  @override
  String get paste => 'Einfügen';

  @override
  String get copy => 'Kopieren';

  @override
  String get previewEdit => 'Vorschau & Bearbeiten';

  @override
  String get pastingTheSharedContent =>
      'Eingefügter Inhalt in den Zwischenspeicher';

  @override
  String get smartPaste => 'Intelligentes Einfügen';

  @override
  String get smartPasteDesc =>
      'Aktivieren Sie das direkte Einfügen von Clips in das zuletzt fokussierte Fenster.';

  @override
  String get launchAtStartup => 'Beim Start starten';

  @override
  String get launchAtStartupDesc =>
      'Aktivieren Sie die automatische Starten der App beim Start Ihres Geräts.';

  @override
  String get autoSyncInterval => 'Automatisches Synchronisierungsintervall';

  @override
  String autoSyncIntervalDesc(String TIME) {
    return 'Der Zwischenspeicher wird alle $TIME automatisch synchronisiert';
  }

  @override
  String get clipboardShortcut => 'Zwischenspeicher-Kurzbefehle';

  @override
  String get clipboardShortcutDesc =>
      'Zwischenspeicher überall problemlos aufrufen';

  @override
  String clipboardShortcutPreview(String KEY) {
    return 'Aktuelle Kurzbefehlstaste: $KEY';
  }

  @override
  String get unassigned => 'Nicht zugewiesen';

  @override
  String get system => 'System';

  @override
  String get light => 'Hell';

  @override
  String get dark => 'Dunkel';

  @override
  String get local => 'Lokal';

  @override
  String get uploading => 'Hochladen...';

  @override
  String get pleaseWait => 'Bitte warten...';

  @override
  String get open => 'Öffnen';

  @override
  String get noCollection => 'Keine Sammlung';

  @override
  String get chooseCollection => 'Sammlung auswählen';

  @override
  String get changeCollection => 'Sammlung ändern';

  @override
  String get removeFromCollection => 'Aus der Sammlung entfernen';

  @override
  String get compactMode => 'Kompaktmodus';

  @override
  String createACollection(int LEFT) {
    return 'Erstellen Sie eine neue Sammlung ( $LEFT übrig )';
  }

  @override
  String get logout => 'Abmelden';

  @override
  String get logoutMessage =>
      '⚠️ WARNUNG ⚠️\n\nDas Abmelden löscht nicht synchronisierte Änderungen in der lokalen Datenbank. Möchten Sie wirklich fortfahren?';

  @override
  String get loggingYouOut => 'Sie werden abgemeldet! Bitte warten...';

  @override
  String get logoutSuccess => 'Erfolgreich abgemeldet';

  @override
  String get internetConnected => 'Internet verbunden';

  @override
  String get internetDisconnected => 'Internet getrennt';

  @override
  String get noCollectionFound => 'Keine Sammlung gefunden';

  @override
  String get pinToTop => 'Oben anheften';

  @override
  String get done => 'Fertig';

  @override
  String get failed => 'Fehlgeschlagen';

  @override
  String get syncNow => 'Jetzt synchronisieren';

  @override
  String get syncNotAvailable => 'Synchronisierung nicht verfügbar';

  @override
  String get checkingForRecord => 'Überprüfen der Aufzeichnungen';

  @override
  String get sync => 'Synchronisieren';

  @override
  String syncing(String PROGRESS) {
    return 'Synchronisieren $PROGRESS';
  }

  @override
  String syncingCheckFailed(String MESSAGE) {
    return 'Synchronisierungsüberprüfung fehlgeschlagen: $MESSAGE';
  }

  @override
  String lastSynced(String TIMESTAMP) {
    return 'Zuletzt synchronisiert um $TIMESTAMP';
  }

  @override
  String get showWindow => 'Fenster anzeigen';

  @override
  String get hideWindow => 'Fenster ausblenden';

  @override
  String get hideWindowDesc =>
      'Tipp: Verwenden Sie die Tastenkombination, um den Zwischenspeicher anzuzeigen.';

  @override
  String get quit => 'Beenden';

  @override
  String get quitDesc => 'Sind Sie sicher, dass Sie beenden möchten?';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get openInBrowser => 'Im Browser öffnen';

  @override
  String get makePhoneCall => 'Einen Anruf tätigen';

  @override
  String get selectCollection => 'Sammlung auswählen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get recordKeyboardShortcut => 'Tastenkombination aufzeichnen.';

  @override
  String get recordKeyboardShortcutDesc =>
      'Geben Sie Ihre Tastenkombination über Ihre Tastatur ein und klicken Sie ';

  @override
  String get subscription => 'Abonnement';

  @override
  String get beta => 'BETA';

  @override
  String get featureListDetail =>
      'CopyCat Clipboard befindet sich derzeit in der Beta-Phase. Obwohl wir uns bemühen, eine nahtlose Erfahrung zu bieten, können gelegentlich Fehler auftreten. Bleiben Sie dran für zukünftige Funktionen und Verbesserungen.';

  @override
  String get currentPlan => 'Aktueller Plan';

  @override
  String currentPlanLabel(String LABEL) {
    return 'Aktueller Plan • $LABEL';
  }

  @override
  String get included => 'Inklusive';

  @override
  String get unlimitedClipboardItems =>
      '• Unbegrenzte Zwischenspeicherelemente';

  @override
  String get supportAllMajorPlatforms =>
      '• Unterstützung aller wichtigen Plattformen';

  @override
  String get supportsAppleUniversalClipboard =>
      '• Unterstützung von Apples Universal-Zwischenspeicher';

  @override
  String get onDeviceStorage => '• Gerätespeicher';

  @override
  String get googleDriveIntegration => '• Google Drive-Integration';

  @override
  String get instantSearch => '• Sofortsuche';

  @override
  String get syncingUpToLast24Hours =>
      '• Synchronisierung bis zu den letzten 24 Stunden';

  @override
  String get upTo3Collections => '• Bis zu 3 Sammlungen';

  @override
  String get autoSyncEvery30Seconds =>
      '• Automatische Synchronisierung alle 30 Sekunden';

  @override
  String get termsAgreeP1 => 'Durch die Fortsetzung stimmen Sie den folgenden ';

  @override
  String get privacyPolicies => 'Datenschutzrichtlinien';

  @override
  String get and => ' und ';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get termsAgreeP2 => ' zu.';

  @override
  String get backToApp => 'Zurück zur App';

  @override
  String get experimental => '🧪';

  @override
  String get experimentalDescription =>
      'Diese Funktion ist experimentell und könnte nicht wie erwartet funktionieren.';

  @override
  String get selectAnOption => 'Wählen Sie eine Option';

  @override
  String get advanceSecurity => 'Erweiterte Sicherheit';

  @override
  String get endToEndVault => 'Ende-zu-Ende-Verschlüsselung Tresor';

  @override
  String get accessE2eeVault =>
      'Greifen Sie auf Ihre E2EE-Tresoreinstellungen zu';

  @override
  String get encryptClipboard => 'Zwischenablage verschlüsseln';

  @override
  String get encryptClipboardDesc =>
      'Verschlüsseln Sie die Zwischenablage, bevor Sie sie mit der Cloud synchronisieren.';

  @override
  String get $5Sec => '5 Sek';

  @override
  String get $15Sec => '15 Sek';

  @override
  String get $30Sec => '30 Sek';

  @override
  String get $60Sec => '60 Sek';

  @override
  String get $90Sec => '90 Sek';

  @override
  String get e2eeNotSetup => 'E2EE noch nicht eingerichtet.';

  @override
  String get settingE2eeVault => 'Einrichten des E2EE-Tresors';

  @override
  String get e2eeSetupWarning =>
      'Wenn Sie Ihren E2EE-Schlüssel verlieren und keine Sicherung haben, sind Ihre verschlüsselten Daten dauerhaft unzugänglich. Bewahren Sie Ihren Schlüssel sicher und gesichert auf.';

  @override
  String get e2eeSetupDesc =>
      'Erstellen Sie Ihren E2EE-Tresorschlüssel und speichern Sie ihn an einem sicheren Ort. Sie benötigen diesen Schlüssel, um andere Geräte einzurichten, um auf Ihre verschlüsselten Informationen zuzugreifen.';

  @override
  String get generating => 'Erstellen...';

  @override
  String get generateKey => 'E2EE-Tresorschlüssel erstellen';

  @override
  String get importE2eeKey => 'E2EE-Tresorschlüssel importieren';

  @override
  String get importE2eeInvalidKey =>
      '⚠️ Der importierte Schlüssel ist ungültig!';

  @override
  String get importE2eeDesc =>
      'Importieren Sie unten Ihren E2EE-Tresorschlüssel, um den Zugriff auf Ihre verschlüsselten Informationen auf diesem Gerät zu ermöglichen. Stellen Sie sicher, dass der Schlüssel sicher gespeichert ist und nicht weitergegeben wird.';

  @override
  String get importing => 'Importieren...';

  @override
  String get importKey => 'E2EE-Tresorschlüssel importieren';

  @override
  String get e2eeVault => 'E2EE-Tresor';

  @override
  String get e2eeExportNote =>
      'Herzlichen Glückwunsch, Sie haben die Ende-zu-Ende-Verschlüsselung erfolgreich eingerichtet.';

  @override
  String get e2eeExportDesc =>
      'Klicken Sie unten auf die Schaltfläche, um Ihren E2EE-Tresorschlüssel zu exportieren.\nSpeichern Sie den Schlüssel an einem sicheren Ort, um sicherzustellen, dass Sie andere Geräte einrichten können, um auf Ihre verschlüsselten Informationen zuzugreifen.';

  @override
  String get exportKey => 'E2EE-Tresorschlüssel exportieren';

  @override
  String get exportSuccess =>
      '✅ Erfolgreich den E2EE-Tresorschlüssel exportiert';
}
