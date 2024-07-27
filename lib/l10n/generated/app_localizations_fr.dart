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
  String get autoSyncIntervalDesc =>
      'El portapapeles se sincronizará automáticamente';

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
  String get synced => '✅ Changements Synchronisés';

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
  String get beta => 'PUBLIC BETA';

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
  String get unlimitedClipboardItems => 'Éléments de Presse-papiers Illimités';

  @override
  String get unlimitedClipboardItemsDesc =>
      'Ne manquez jamais d\'espace avec des éléments de presse-papiers illimités, garantissant que vous avez toujours accès à vos copies les plus récentes.';

  @override
  String get supportAllMajorPlatforms =>
      'Prise en charge de toutes les principales plateformes';

  @override
  String get supportAllMajorPlatformsDesc =>
      'Synchronisation transparente sur toutes les principales plateformes—Android, iOS, Windows, macOS et Linux—pour une productivité ininterrompue partout.';

  @override
  String get supportsAppleUniversalClipboard =>
      'Prend en charge le presse-papiers universel Apple';

  @override
  String get supportsAppleUniversalClipboardDesc =>
      'Transférez facilement le contenu du presse-papiers entre vos appareils Apple avec la prise en charge du Presse-papiers Universel d\'Apple.';

  @override
  String get onDeviceStorage => 'Stockage sur l\'Appareil';

  @override
  String get onDeviceStorageDesc =>
      'Gardez vos données sécurisées avec un stockage sur l\'appareil, garantissant que les éléments de votre presse-papiers sont toujours à portée de main et sous votre contrôle.';

  @override
  String get googleDriveIntegration => 'Intégration Google Drive';

  @override
  String get googleDriveIntegrationDesc =>
      'Stockez en toute sécurité des fichiers et des médias sur Google Drive, en s\'intégrant parfaitement avec CopyCat Clipboard pour une gestion améliorée des données.';

  @override
  String get instantSearch => 'Recherche Instantanée';

  @override
  String get instantSearchDesc =>
      'Trouvez ce dont vous avez besoin instantanément avec de puissantes capacités de recherche instantanée, rendant la récupération des éléments du presse-papiers rapide et efficace.';

  @override
  String get syncingUpToLast24Hours =>
      'Synchronisation des dernières 24 heures';

  @override
  String get syncingUpToLast24HoursDesc =>
      'Accédez à l\'historique de votre presse-papiers et synchronisez-le sur tous vos appareils au cours des dernières 24 heures. Cela garantit que vous ne perdez jamais d\'éléments copiés importants, rendant votre flux de travail fluide et efficace.';

  @override
  String get upTo3Collections => 'Jusqu\'à 3 Collections';

  @override
  String get upTo3CollectionsDesc =>
      'Organisez les éléments de votre presse-papiers en jusqu\'à 3 collections, offrant une catégorisation simple pour une meilleure gestion du flux de travail.';

  @override
  String get autoSyncEvery60Seconds =>
      'Synchronisation Automatique Toutes les 60 Secondes';

  @override
  String get autoSyncEvery60SecondsDesc =>
      'Profitez de la synchronisation automatique des éléments du presse-papiers toutes les 60 secondes, gardant vos appareils à jour sans intervention manuelle.';

  @override
  String get withPro => 'Avec PRO ✨';

  @override
  String get withProDesc => 'Tout inclus dans Gratuit +';

  @override
  String get supportE2EE => 'Prise en Charge du Chiffrement de Bout en Bout';

  @override
  String get supportE2EEDesc =>
      'E2EE chiffrera tout pour une confidentialité supérieure.';

  @override
  String get upto50Collection => 'Jusqu\'à 50 Collections';

  @override
  String get upto50CollectionDesc =>
      'Organisez les éléments de votre presse-papiers en jusqu\'à 50 collections pour une gestion optimale.';

  @override
  String get syncLast720Hr => 'Synchronisation des 30 derniers jours';

  @override
  String get syncLast720HrDesc =>
      'L\'historique du presse-papiers est synchronisé sur tous vos appareils pour les clips créés au cours des 30 derniers jours. Cela signifie que vous pouvez accéder à tout clip que vous avez copié au cours du mois dernier, quel que soit l\'appareil que vous utilisez.';

  @override
  String get realtimeSync => 'Synchronisation en Temps Réel';

  @override
  String get realtimeSyncDesc =>
      'Expérimentez une synchronisation ultra-rapide.';

  @override
  String get prioritySupport => 'Support Rapide et Prioritaire';

  @override
  String get prioritySupportDesc =>
      'Obtenez un support rapide et prioritaire en tant qu\'utilisateur PRO.';

  @override
  String get earlyAccessToNewFeature =>
      'Accès Anticipé aux Nouvelles Fonctionnalités';

  @override
  String get earlyAccessToNewFeatureDesc =>
      'Soyez le premier à essayer les nouvelles fonctionnalités et mises à jour.';

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

  @override
  String get backToApp => 'Retour à l\'application';

  @override
  String get experimental => '🧪';

  @override
  String get experimentalDescription =>
      'Cette fonctionnalité est expérimentale et pourrait ne pas fonctionner comme prévu.';

  @override
  String get selectAnOption => 'Sélectionner une option';

  @override
  String get advanceSecurity => 'Sécurité Avancée';

  @override
  String get endToEndVault => 'Coffre de Chiffrement de Bout en Bout';

  @override
  String get accessE2eeVault => 'Accédez à vos paramètres de coffre E2EE';

  @override
  String get encryptClipboard => 'Crypter le Presse-papiers';

  @override
  String get encryptClipboardDesc =>
      'Cryptez le presse-papiers avant de le synchroniser avec le cloud.';

  @override
  String get $5Sec => 'Instantané';

  @override
  String get $10Sec => 'Rapide';

  @override
  String get $20Sec => 'Vif';

  @override
  String get $45Sec => 'Équilibré';

  @override
  String get $60Sec => 'Décontracté';

  @override
  String get $5MB => 'Petit (5 MB)';

  @override
  String get $10MB => 'Standard (10 MB)';

  @override
  String get $20MB => 'Moyen (20 MB)';

  @override
  String get $50MB => 'Grand (50 MB)';

  @override
  String get $100MB => 'Très Grand (100 MB)';

  @override
  String get e2eeNotSetup => 'E2EE n\'est pas encore configuré.';

  @override
  String get settingE2eeVault => 'Configuration du Coffre E2EE';

  @override
  String get e2eeSetupWarning =>
      'Si vous perdez votre clé E2EE et n\'avez pas de sauvegarde, vos données cryptées seront définitivement inaccessibles. Gardez votre clé en sécurité et sauvegardée.';

  @override
  String get e2eeSetupDesc =>
      'Générez votre clé de coffre E2EE et enregistrez-la dans un endroit sûr. Vous aurez besoin de cette clé pour configurer d\'autres appareils afin d\'accéder à vos informations cryptées.';

  @override
  String get generating => 'Génération...';

  @override
  String get generateKey => 'Générer une Clé de Coffre E2EE';

  @override
  String get importE2eeKey => 'Importer une Clé de Coffre E2EE';

  @override
  String get importE2eeInvalidKey => '⚠️ La clé importée est invalide !';

  @override
  String get importE2eeDesc =>
      'Importez votre clé de coffre E2EE ci-dessous pour permettre l\'accès à vos informations cryptées sur cet appareil. Assurez-vous que la clé est stockée en toute sécurité et ne la partagez avec personne.';

  @override
  String get importing => 'Importation...';

  @override
  String get importKey => 'Importer une Clé de Coffre E2EE';

  @override
  String get e2eeVault => 'Coffre E2EE';

  @override
  String get e2eeExportNote =>
      'Félicitations, vous avez configuré avec succès le chiffrement de bout en bout.';

  @override
  String get e2eeExportDesc =>
      'Cliquez sur le bouton ci-dessous pour exporter votre clé de coffre E2EE.\nEnregistrez la clé dans un endroit sûr pour garantir que vous pourrez configurer d\'autres appareils afin d\'accéder à vos informations cryptées.';

  @override
  String get exportKey => 'Exporter une Clé de Coffre E2EE';

  @override
  String get exportSuccess => '✅ Exporté avec succès';

  @override
  String get copySuccess => '✅ Copié avec succès dans le presse-papiers';

  @override
  String get whatsNew => 'Quoi de neuf ?';

  @override
  String get feature1 => 'Presse-papiers Intelligent Multi-Plateforme';

  @override
  String get feature1Desc =>
      'Synchronisez sans effort le contenu de votre presse-papiers sur tous vos appareils. Qu\'il s\'agisse de texte, d\'images ou de fichiers, accédez à l\'historique de votre presse-papiers où que vous alliez.';

  @override
  String get feature2 => 'Historique Illimité avec Recherche Instantanée';

  @override
  String get feature2Desc =>
      'Ne perdez plus jamais vos éléments copiés. Notre fonctionnalité d\'historique illimité garantit que vous pouvez rechercher et récupérer instantanément tout élément de presse-papiers passé.';

  @override
  String get feature3 => 'Collage Intelligent';

  @override
  String get feature3Desc =>
      'Collez intelligemment avec des suggestions contextuelles. Gagnez du temps en accédant rapidement au contenu approprié pour votre tâche actuelle.';

  @override
  String get feature4 => 'Collections';

  @override
  String get feature4Desc =>
      'Organisez les éléments de votre presse-papiers en collections pour un accès et une gestion faciles. Parfait pour les projets, la recherche et plus encore.';

  @override
  String get gettingStarted => 'Commencer';

  @override
  String get howToUse => 'Comment Utiliser';

  @override
  String get howToUseDesc =>
      'Comment utiliser CopyCat ? Lisez notre documentation pour commencer.';

  @override
  String get tutorials => 'Tutoriels Vidéo';

  @override
  String get tutorialsDesc =>
      'Apprenez à tirer le meilleur parti de CopyCat avec nos tutoriels vidéo étape par étape.';

  @override
  String get learnAboutFeatures =>
      'Découvrez toutes les fonctionnalités que CopyCat a à offrir.';

  @override
  String get learn => 'Apprendre';

  @override
  String get upgrade => 'Mettre à niveau';

  @override
  String trialTill(String till) {
    return 'Essai jusqu\'à $till';
  }

  @override
  String expiredPlan(String planName) {
    return '$planName • Expiré';
  }

  @override
  String get displayName => 'Nom d\'Affichage';

  @override
  String get email => 'Email';

  @override
  String get accountSettings => 'Paramètres du Compte';

  @override
  String get dangerZone => 'Zone de Danger';

  @override
  String get requestAccountDeletion => 'Demander la Suppression du Compte';

  @override
  String get myAccount => 'Mon Compte';

  @override
  String get accountDeleteDialogTitle => 'Demande de Suppression de Compte';

  @override
  String get accountDeleteDialogDesc =>
      'Vous serez redirigé vers le formulaire de demande de suppression de compte, êtes-vous sûr ?';

  @override
  String get unlockPremiumFeatures => 'Débloquer CopyCat PRO';

  @override
  String get upgradeToPro =>
      'Profitez de plus de 720 heures d\'historique synchronisé, plus de 50 collections, chiffrement de bout en bout, synchronisation en temps réel, accès aux dernières fonctionnalités et bien plus encore.';

  @override
  String get tryAgain => 'Veuillez réessayer';

  @override
  String get continue_ => 'Continuer';

  @override
  String get year => 'année';

  @override
  String get month => 'mois';

  @override
  String get manageSubscriptions => 'Gérer les Abonnements';

  @override
  String promoSub(String TILL) {
    return 'Vous utilisez un abonnement promotionnel jusqu\'à $TILL';
  }

  @override
  String get subscriptionUpdated => 'Abonnement Mis à Jour';

  @override
  String get grantedEntitlement => 'Droit Accordé';

  @override
  String get grantedEntitlementDesc =>
      'Les Codes de Droit Accordé sont partagés avec des individus spécifiques pour des droits personnalisés. Vous pouvez vérifier si des invitations sont encore disponibles en ';

  @override
  String get clickingHere => 'cliquant ici.';

  @override
  String get enterCodeSubmit => 'Entrez le code et appuyez sur Soumettre';

  @override
  String get submit => 'Soumettre';

  @override
  String get subscribeInSupportedPlatform =>
      'Pour accéder aux fonctionnalités premium de Copycat Clipboard, veuillez vous abonner via le Play Store ou l\'Apple App Store. Votre abonnement sera synchronisé sur tous vos appareils, y compris Linux et Windows.';

  @override
  String get timeSyncWarning =>
      '⚠️ Avertissement de Synchronisation de l\'Heure';

  @override
  String get timeSyncWarningNote1 =>
      'Heure de l\'Appareil Incohérente Détectée';

  @override
  String get timeSyncWarningNote2 =>
      'Pour garantir une synchronisation précise du presse-papiers, veuillez vérifier et corriger les paramètres de l\'heure de votre appareil.';

  @override
  String get timeSyncWarningNote3 =>
      'Des paramètres de temps incohérents peuvent causer des problèmes de synchronisation.';

  @override
  String get checkAgain => 'Vérifier de Nouveau';

  @override
  String get shareYourFeedback => 'Partagez Vos Commentaires';

  @override
  String get shareYourFeedbackDesc =>
      'Nous apprécions vos pensées ! Que ce soit une suggestion, un rapport de bug ou simplement pour dire bonjour, votre avis est inestimable pour nous.';

  @override
  String get joinDiscord => 'Rejoignez Notre Communauté Discord';

  @override
  String get joinDiscordDesc =>
      'Connectez-vous avec d\'autres utilisateurs, partagez des idées, recevez des mises à jour et discutez directement avec nous.';

  @override
  String get joinGoogleGroup => 'Rejoignez Notre Groupe Google';

  @override
  String get joinGoogleGroupDesc =>
      'Restez informé et collaborez avec d\'autres utilisateurs dans notre groupe Google.';

  @override
  String get rebuildingDB =>
      '⏱️ Reconstruction de la Base de Données\nVeuillez patienter...';
}
