import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'CopyCat';

  @override
  String get en => 'Anglais';

  @override
  String get es => 'Espagnol';

  @override
  String get fr => 'Français';

  @override
  String get de => 'Allemand';

  @override
  String get language => 'Langue';

  @override
  String get enterEmail => 'Entrez votre e-mail';

  @override
  String get validEmailError => 'Veuillez entrer une adresse e-mail valide';

  @override
  String get enterPassword => 'Entrez votre mot de passe';

  @override
  String get passwordLengthError =>
      'Veuillez entrer un mot de passe d\'au moins 6 caractères';

  @override
  String get signIn => 'Se Connecter';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get forgotPassword => 'Mot de passe oublié?';

  @override
  String get dontHaveAccount => 'Vous n\'avez pas de compte? Inscrivez-vous';

  @override
  String get haveAccount => 'Vous avez déjà un compte? Connectez-vous';

  @override
  String get sendPasswordReset =>
      'Envoyer un e-mail de réinitialisation du mot de passe';

  @override
  String get backToSignIn => 'Retour à la connexion';

  @override
  String get updatePassword => 'Mettre à jour le mot de passe';

  @override
  String get unexpectedError => 'Une erreur inattendue s\'est produite';

  @override
  String get passwordResetSent =>
      'L\'e-mail de réinitialisation du mot de passe a été envoyé';

  @override
  String get collections => 'Collections';

  @override
  String get collection => 'Collection';

  @override
  String get createCollection => 'Créer une Collection';

  @override
  String get editCollection => 'Modifier la Collection';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Sauvegarder';

  @override
  String get edit => 'Modifier';

  @override
  String get description => 'Description';

  @override
  String get noDescription => 'Pas de description';

  @override
  String get noResultsWereFound => 'Aucun résultat trouvé';

  @override
  String get driveSetupDone => 'Configuration du Drive terminée 🥳';

  @override
  String get pleaseWaitWhileWeSetupSyncing =>
      'Veuillez patienter pendant que nous configurons\nla synchronisation';

  @override
  String get driveSetupMayTakeFewMin =>
      'Cela peut prendre environ une minute pour terminer.\n( Veuillez ne pas fermer l\'application )';

  @override
  String get refreshNow => 'Actualiser Maintenant';

  @override
  String newUpdates(int ADDED, int UPDATED, int DELETED) {
    return 'Modifications Disponibles:\n $ADDED Ajouté, $UPDATED Mis à jour et $DELETED Supprimé';
  }

  @override
  String get itemDeleted => 'Élément supprimé';

  @override
  String get deletingFromCloud => 'Suppression du Cloud';

  @override
  String get emptyClipboard => 'Votre presse-papiers est vide';

  @override
  String get loadMore => 'Charger Plus';

  @override
  String get clipboard => 'Presse-papiers';

  @override
  String get search => 'Recherche';

  @override
  String get share => 'Partager';

  @override
  String get export => 'Exporter';

  @override
  String get searchClipboard => 'Rechercher dans le presse-papiers';

  @override
  String get settings => 'Paramètres';

  @override
  String get copyCatClipboard => 'Presse-papiers CopyCat';

  @override
  String get oneClipboardLimitlessPosibility =>
      'Un Presse-papiers, Possibilités Illimitées';

  @override
  String get fullName => 'Nom Complet';

  @override
  String get preview => 'Aperçu';

  @override
  String get editDetails => 'Modifier les Détails';

  @override
  String get title => 'Titre';

  @override
  String get nothingHere => 'Rien ici';

  @override
  String get downloading => 'Téléchargement';

  @override
  String get downloadForOffline =>
      'Téléchargement pour une utilisation hors ligne';

  @override
  String get copyToClipboard => 'Copier dans le presse-papiers';

  @override
  String get delete => 'Supprimer';

  @override
  String get resetYourPassword => 'Réinitialisez votre mot de passe';

  @override
  String get passwordResetSuccess => 'Mot de passe réinitialisé avec succès';

  @override
  String get findWhateverYouLooking => 'Trouvez ce que vous cherchez...';

  @override
  String get noResults => 'Aucun résultat trouvé.';

  @override
  String get searchInClipboard => 'Rechercher dans le presse-papiers';

  @override
  String get basicLocal => 'Basique • Local';

  @override
  String get localSettingsDesc =>
      'Ces paramètres s\'appliquent uniquement à cet appareil.';

  @override
  String get theme => 'Thème';

  @override
  String get syncLocal => 'Synchroniser • Local';

  @override
  String get dontAutoCopyOver => 'Ne pas Copier Automatiquement';

  @override
  String dontAutoCopyOverDesc(String SIZE) {
    return 'Les fichiers et médias de plus d\'une certaine taille ($SIZE) ne seront pas copiés automatiquement.';
  }

  @override
  String get dontAutoUploadOver => 'Ne pas Télécharger Automatiquement';

  @override
  String dontAutoUploadOverDesc(String SIZE) {
    return 'Les fichiers et médias de plus d\'une certaine taille ($SIZE) ne seront pas téléchargés automatiquement.';
  }

  @override
  String get enableSync => 'Activer la Synchronisation';

  @override
  String get enableSyncDesc =>
      'Gardez vos fichiers à jour sur tous vos appareils';

  @override
  String get syncFiles => 'Synchroniser les Fichiers et Médias';

  @override
  String get syncFilesDesc =>
      'Gardez vos fichiers et éléments multimédias à jour sur tous vos appareils.';

  @override
  String get connected => 'Connecté';

  @override
  String get loading => 'Chargement...';

  @override
  String get authorizing => 'Autorisation...';

  @override
  String get connectNow => 'Connecter Maintenant';

  @override
  String get tips => 'ⓘ Conseils';

  @override
  String get cloudStorageInfoDefault =>
      '\n\nGoogle Drive non connecté, la synchronisation des fichiers et des médias est désactivée.';

  @override
  String cloudStorageInfo(String INFO) {
    return '${INFO}Vos fichiers et médias sont synchronisés en toute sécurité sur tous vos appareils en utilisant Google Drive pour protéger votre confidentialité.';
  }

  @override
  String get attentionNeeded => '⚠ Attention Requise!';

  @override
  String get isPaused => 'Est en Pause?';

  @override
  String isPausedDesc(String isPaused, String TILL) {
    String _temp0 = intl.Intl.selectLogic(
      isPaused,
      {
        'true': 'La copie automatique n\'est pas en pause',
        'other': 'La copie automatique est en pause jusqu\'à $TILL',
      },
    );
    return '$_temp0';
  }

  @override
  String get paste => 'Coller';

  @override
  String get copy => 'Copier';

  @override
  String get previewEdit => 'Aperçu et Modifier';

  @override
  String get pastingTheSharedContent =>
      'Collage du contenu partagé dans le presse-papiers';

  @override
  String get smartPaste => 'Collage Intelligent';

  @override
  String get smartPasteDesc =>
      'Permet de coller les clips directement dans la dernière fenêtre active.';

  @override
  String get launchAtStartup => 'Lancer au Démarrage';

  @override
  String get launchAtStartupDesc =>
      'Permet de démarrer l\'application automatiquement au démarrage de votre appareil.';

  @override
  String get autoSyncInterval => 'Intervalle de Synchronisation Automatique';

  @override
  String autoSyncIntervalDesc(String TIME) {
    return 'Le presse-papiers sera automatiquement synchronisé toutes les $TIME';
  }

  @override
  String get clipboardShortcut => 'Raccourci du Presse-papiers';

  @override
  String get clipboardShortcutDesc =>
      'Accédez facilement au presse-papiers partout';

  @override
  String clipboardShortcutPreview(String KEY) {
    return 'Touche de raccourci actuelle : $KEY';
  }

  @override
  String get unassigned => 'Non assigné';

  @override
  String get system => 'Système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get local => 'Local';

  @override
  String get uploading => 'Téléchargement...';

  @override
  String get pleaseWait => 'Veuillez patienter...';

  @override
  String get open => 'Ouvrir';

  @override
  String get noCollection => 'Aucune Collection';

  @override
  String get chooseCollection => 'Choisir une Collection';

  @override
  String get changeCollection => 'Changer de Collection';

  @override
  String get removeFromCollection => 'Retirer de la collection';

  @override
  String get compactMode => 'Mode Compact';

  @override
  String createACollection(int LEFT) {
    return 'Créer une nouvelle collection ( $LEFT restant )';
  }

  @override
  String get logout => 'Se Déconnecter';

  @override
  String get logoutMessage =>
      '⚠️ AVERTISSEMENT ⚠️\n\nLa déconnexion supprimera les modifications non synchronisées dans la base de données locale. Êtes-vous sûr de vouloir continuer?';

  @override
  String get loggingYouOut => 'Déconnexion en cours! Veuillez patienter...';

  @override
  String get logoutSuccess => 'Déconnexion réussie';

  @override
  String get internetConnected => 'Internet Connecté';

  @override
  String get internetDisconnected => 'Internet Déconnecté';

  @override
  String get noCollectionFound => 'Aucune collection trouvée';

  @override
  String get pinToTop => 'Épingler en Haut';

  @override
  String get done => 'Terminé';

  @override
  String get failed => 'Échoué';

  @override
  String get syncNow => 'Synchroniser Maintenant';

  @override
  String get syncNotAvailable => 'Synchronisation Non Disponible';

  @override
  String get checkingForRecord => 'Vérification des Enregistrements';

  @override
  String get sync => 'Synchroniser';

  @override
  String syncing(String PROGRESS) {
    return 'Synchronisation en cours $PROGRESS';
  }

  @override
  String syncingCheckFailed(String MESSAGE) {
    return 'Échec de la vérification de synchronisation : $MESSAGE';
  }

  @override
  String lastSynced(String TIMESTAMP) {
    return 'Dernière synchronisation à $TIMESTAMP';
  }

  @override
  String get showWindow => 'Afficher la Fenêtre';

  @override
  String get hideWindow => 'Masquer la Fenêtre';

  @override
  String get hideWindowDesc =>
      'Conseil : Utilisez le raccourci clavier pour afficher le presse-papiers.';

  @override
  String get quit => 'Quitter';

  @override
  String get quitDesc => 'Êtes-vous sûr de vouloir quitter?';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get openInBrowser => 'Ouvrir dans le navigateur';

  @override
  String get makePhoneCall => 'Passer un appel téléphonique';

  @override
  String get selectCollection => 'Sélectionner une collection';

  @override
  String get confirm => 'Confirmer';

  @override
  String get recordKeyboardShortcut => 'Enregistrer le raccourci clavier.';

  @override
  String get recordKeyboardShortcutDesc =>
      'Tapez votre raccourci à l\'aide de votre clavier et cliquez ';

  @override
  String get subscription => 'Abonnement';

  @override
  String get beta => 'BETA';

  @override
  String get featureListDetail =>
      'CopyCat Clipboard est actuellement en phase Beta. Bien que nous nous efforcions d\'offrir une expérience sans faille, vous pourriez rencontrer des bugs occasionnels. Restez à l\'écoute pour les futures fonctionnalités et améliorations.';

  @override
  String get currentPlan => 'Plan Actuel';

  @override
  String currentPlanLabel(String LABEL) {
    return 'Plan Actuel • $LABEL';
  }

  @override
  String get included => 'Inclus';

  @override
  String get unlimitedClipboardItems =>
      '• Éléments de Presse-papiers Illimités';

  @override
  String get supportAllMajorPlatforms =>
      '• Prend en charge toutes les principales plateformes';

  @override
  String get supportsAppleUniversalClipboard =>
      '• Prend en charge le Presse-papiers Universel d\'Apple';

  @override
  String get onDeviceStorage => '• Stockage sur l\'Appareil';

  @override
  String get googleDriveIntegration => '• Intégration Google Drive';

  @override
  String get instantSearch => '• Recherche Instantanée';

  @override
  String get syncingUpToLast24Hours =>
      '• Synchronisation jusqu\'aux dernières 24 heures';

  @override
  String get upTo3Collections => '• Jusqu\'à 3 Collections';

  @override
  String get autoSyncEvery30Seconds =>
      '• Synchronisation Automatique Toutes les 30 Secondes';

  @override
  String get termsAgreeP1 => 'En continuant, vous acceptez les ';

  @override
  String get privacyPolicies => 'Politiques de confidentialité';

  @override
  String get and => ' et les ';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get termsAgreeP2 => ' suivantes.';
}
