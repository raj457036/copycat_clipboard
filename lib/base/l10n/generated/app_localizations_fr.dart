// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get app__name => 'Presse-papiers CopyCat';

  @override
  String get app__slogan => 'Un presse-papiers, des possibilités illimitées';

  @override
  String get app__start_indexing => 'Démarrer l\'indexation';

  @override
  String get app__stop_indexing => 'Arrêter l\'indexation';

  @override
  String get app__image_not_found => 'Image introuvable';

  @override
  String get app__unknown_error => 'Une erreur inattendue est survenue';

  @override
  String get app__downloading => 'Téléchargement...';

  @override
  String get app__download => 'Télécharger';

  @override
  String get app__follow_link => 'Suivre le lien';

  @override
  String get app__edit => 'Modifier';

  @override
  String get app__export => 'Exporter';

  @override
  String get app__delete => 'Supprimer';

  @override
  String get app__later => 'Passer';

  @override
  String get app__select => 'Sélectionner';

  @override
  String get app__change => 'Changer';

  @override
  String get app__confirm => 'Confirmer';

  @override
  String get app__action_required => 'Action requise';

  @override
  String get app__feature_unavailable =>
      'Cette fonctionnalité n\'est pas disponible pour votre plateforme.';

  @override
  String get app__preview => 'Aperçu';

  @override
  String get app__open_file => 'Ouvrir le fichier';

  @override
  String get app__change_collection => 'Changer de collection';

  @override
  String get app__no_name => 'Sans nom';

  @override
  String get app__share => 'Partager';

  @override
  String get app__clip_actions => 'Actions du clip';

  @override
  String get app__copy_content => 'Copier le contenu';

  @override
  String get app__paste_content => 'Coller le contenu';

  @override
  String get app__loading => 'Chargement...';

  @override
  String get app__uploading => 'Téléversement...';

  @override
  String get app__syncing => 'Synchronisation...';

  @override
  String app__sync_cooldown({required String time}) {
    return 'La synchronisation est en période de refroidissement. Veuillez attendre $time avant de synchroniser à nouveau.';
  }

  @override
  String get app__sync => 'Synchroniser';

  @override
  String get app__queued => 'En attente';

  @override
  String get app__local => 'Local';

  @override
  String get app__utc => 'UTC';

  @override
  String get app__send_message => 'Envoyer un message';

  @override
  String get app__send_email => 'Envoyer un e-mail';

  @override
  String get app__empty_clipboard => 'Votre presse-papiers est vide.';

  @override
  String get app__load_more => 'Charger plus';

  @override
  String get app__more => 'Plus';

  @override
  String get app__search => 'Rechercher';

  @override
  String get app__no_results => 'Aucun résultat trouvé';

  @override
  String get app__locale_en => 'Anglais';

  @override
  String get app__locale_es => 'Espagnol';

  @override
  String get app__locale_fr => 'Français';

  @override
  String get app__locale_de => 'Allemand';

  @override
  String get app__locale_zh => 'Chinois';

  @override
  String get app__locale_pt => 'Portugais';

  @override
  String get app__language => 'Langue';

  @override
  String get app__yes => 'Oui';

  @override
  String get app__no => 'Non';

  @override
  String get app__quit => 'Quitter';

  @override
  String get app__clear => 'Effacer';

  @override
  String get app__reset => 'Réinitialiser';

  @override
  String get app__continue => 'Continuer';

  @override
  String get app__paste => 'Coller';

  @override
  String get app__copycat_logo => 'Logo CopyCat';

  @override
  String get app__logout => 'Déconnexion';

  @override
  String get app__no_collection => 'Aucune collection trouvée';

  @override
  String get app__create_collection => 'Créer une collection';

  @override
  String get app__create => 'Créer';

  @override
  String get app__pro_tip => 'Conseil pro';

  @override
  String get app__try_again => 'Essayer à nouveau';

  @override
  String get app__realtime_connected => 'Connecté en temps réel';

  @override
  String get app__realtime_disconnected => 'Déconnecté en temps réel';

  @override
  String get app__realtime_connecting => 'Connexion en temps réel...';

  @override
  String get app__ack__exported => 'Exporté';

  @override
  String get app__ack__copied => 'Copié';

  @override
  String app__ack__copied_from_device({required String device}) {
    return 'Copié depuis $device';
  }

  @override
  String app__ack__received_from_device({required String device}) {
    return 'Reçu depuis $device';
  }

  @override
  String get app__ack__excluded => 'Exclu';

  @override
  String app__ack__excluded_with_reason({required String reason}) {
    return 'Exclu • $reason';
  }

  @override
  String get app__ack__reason_phone => 'Téléphone';

  @override
  String get app__ack__reason_email => 'E-mail';

  @override
  String get app__ack__reason_credit_card => 'Carte bancaire';

  @override
  String get app__ack__reason_sensitive_url => 'URL sensible';

  @override
  String get app__ack__reason_app => 'Application sensible';

  @override
  String get app__ack__reason_pattern => 'Modèle';

  @override
  String get app__ack__reason_title => 'Fenêtre sensible';

  @override
  String get app__ack__pasted => 'Collé';

  @override
  String get app__ack__pasting => 'Collage';

  @override
  String get app__ack__done => 'Terminé';

  @override
  String get app__ack__quit_app => 'Quitter l\'application';

  @override
  String get app__ack__deleted => 'Supprimé';

  @override
  String get app__ack__internet_connected => 'Internet connecté';

  @override
  String get app__ack__internet_disconnected => 'Internet déconnecté';

  @override
  String get app__ack__logout_success =>
      'Vous vous êtes déconnecté avec succès.';

  @override
  String get app__ack__no_app_for_file =>
      'Aucune application trouvée pour ouvrir ce fichier.';

  @override
  String get app__ack__perm_fail_to_open_file =>
      'Autorisation pour ouvrir ce fichier non accordée.';

  @override
  String get app__ack__missing_e2e_setup =>
      'Configuration du chiffrement manquante';

  @override
  String app__ack__failed_to_sync({
    required String entityType,
    required String message,
  }) {
    return 'Échec de synchronisation de $entityType : $message';
  }

  @override
  String app__index_pending({required int total}) {
    return '⚠️ Indexer $total clips pour les rendre consultables. Cela ne prend qu\'un instant.';
  }

  @override
  String get app__indexing_completed =>
      '🎉 Indexation terminée. Vos clips sont maintenant consultables.';

  @override
  String get dialog__delete_clip__title => 'Supprimer le clip';

  @override
  String dialog__delete_clip__subtitle({required int itemCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      other: 'Êtes-vous sûr de vouloir supprimer ces clips ?',
      one: 'Êtes-vous sûr de vouloir supprimer ce clip ?',
    );
    return '$_temp0';
  }

  @override
  String get dialog__e2e__title => 'Chiffrement de bout en bout';

  @override
  String get dialog__text__e2e_key_export =>
      'Félicitations, vous avez configuré avec succès le chiffrement de bout en bout.';

  @override
  String get dialog__text__e2e_key_export__note =>
      'Cliquez sur le bouton ci-dessous pour exporter votre clé de chiffrement.\nEnregistrez la clé dans un endroit sûr pour vous assurer de pouvoir configurer d\'autres appareils pour accéder à vos informations chiffrées.';

  @override
  String get dialog__text__e2e_key_generate =>
      'Générez une clé de chiffrement et stockez-la en toute sécurité. Cette clé est nécessaire pour configurer d\'autres appareils pour accéder à vos données chiffrées.';

  @override
  String get dialog__button__e2e_generating_key => 'Génération';

  @override
  String get dialog__button__e2e_generate_key => 'Généré';

  @override
  String get dialog__text__invalid_e2e_key => 'La clé importée est invalide !';

  @override
  String get dialog__text__e2e_key_import__note =>
      'Importez votre clé de chiffrement ci-dessous pour accéder à vos données chiffrées sur cet appareil.';

  @override
  String get dialog__button__e2e_importing_key => 'Importation';

  @override
  String get dialog__button__e2e_import_key => 'Importer';

  @override
  String get dialog__button__e2e_clear_key => 'Effacer la clé';

  @override
  String get dialog__title__e2e_clear_key => 'Effacer la clé de chiffrement';

  @override
  String get dialog__text__e2e_clear_key__confirm =>
      'Êtes-vous sûr de vouloir supprimer la clé de chiffrement de cet appareil ? Vous ne pourrez pas déchiffrer les éléments chiffrés tant que vous n\'aurez pas réimporté la clé.';

  @override
  String get dialog__text__inconsistent_time__title =>
      'Avertissement de synchronisation temporelle';

  @override
  String get dialog__text__inconsistent_time__content =>
      'Heure de l\'appareil incohérente détectée\n\nPour assurer une synchronisation précise du presse-papiers, veuillez vérifier et corriger les paramètres de l\'heure de votre appareil.\n\nDes paramètres de temps incohérents peuvent entraîner des problèmes de synchronisation.';

  @override
  String get dialog__text__inconsistent_time__still_off =>
      'L\'horloge est toujours désynchronisée. Veuillez mettre à jour l\'heure de votre système manuellement.';

  @override
  String get dialog__text__inconsistent_time__ntp_unreachable =>
      'Impossible de joindre le serveur de temps. Vérifiez votre connexion Internet et synchronisez votre horloge manuellement.';

  @override
  String get dialog__text__inconsistent_time__check_failed =>
      'La vérification de l\'heure a échoué. Veuillez mettre à jour l\'horloge de votre système manuellement.';

  @override
  String get dialog__button__try_again => 'Vérifier à nouveau';

  @override
  String get dialog__button__try_fix => 'Essayer à nouveau';

  @override
  String get dialog__record_keys__title => 'Enregistrer le raccourci clavier';

  @override
  String get dialog__record_keys__subtitle =>
      'Tapez votre raccourci en utilisant votre clavier et cliquez sur ';

  @override
  String dialog__delete_collection__title({required String collectionName}) {
    return 'Supprimer $collectionName';
  }

  @override
  String get dialog__delete_collection__subtitle =>
      'Êtes-vous sûr de vouloir supprimer cette collection ?';

  @override
  String get dialog__ack__sub_updated => 'Abonnement mis à jour';

  @override
  String get dialog__grant_entitlement__title => 'Droit accordé';

  @override
  String get dialog__grant_entitlement__subtitle_p1 =>
      'Les codes de droit accordés sont partagés avec des personnes spécifiques pour des droits personnalisés. Vous pouvez vérifier si des invitations sont encore disponibles en ';

  @override
  String get dialog__grant_entitlement__subtitle_p2 => 'cliquant ici.';

  @override
  String get dialog__grant_entitlement__enter_code =>
      'Saisissez le code et appuyez sur Soumettre';

  @override
  String get dialog__grant_entitlement__code_label => 'Code';

  @override
  String get dialog__grant_entitlement__apply_code => 'Appliquer';

  @override
  String get view_button__switch_to_grid => 'Passer à la disposition en grille';

  @override
  String get view_button__switch_to_list => 'Passer à la disposition en liste';

  @override
  String get view_button__change_view => 'Changer de vue';

  @override
  String get view_button__view_window => 'Fenêtré';

  @override
  String get view_button__view_dock_right => 'Ancrer à droite';

  @override
  String get view_button__view_dock_bottom => 'Ancrer en bas';

  @override
  String get view_button__view_dock_left => 'Ancrer à gauche';

  @override
  String get view_button__view_dock_top => 'Ancrer en haut';

  @override
  String get view_button__pin => 'Épingler en haut';

  @override
  String get view_button__unpin => 'Désépingler';

  @override
  String get sub_dialog__text__included => 'Inclus';

  @override
  String get sub_dialog__f1__title => 'Éléments de presse-papiers illimités';

  @override
  String get sub_dialog__f1__subtitle =>
      'Ne manquez jamais d\'espace avec des éléments de presse-papiers illimités, en vous assurant d\'avoir toujours accès à vos copies les plus récentes.';

  @override
  String get sub_dialog__f2__title =>
      'Prise en charge de toutes les principales plateformes';

  @override
  String get sub_dialog__f2__subtitle =>
      'Synchronisez sans effort sur toutes les principales plateformes — Android, iOS, Windows, macOS et Linux — pour une productivité ininterrompue partout.';

  @override
  String get sub_dialog__f3__title =>
      'Prend en charge le Presse-papiers Universel d\'Apple';

  @override
  String get sub_dialog__f3__subtitle =>
      'Transférez sans effort le contenu du presse-papiers entre vos appareils Apple avec la prise en charge du Presse-papiers Universel d\'Apple.';

  @override
  String get sub_dialog__f4__title => 'Stockage sur l\'appareil';

  @override
  String get sub_dialog__f4__subtitle =>
      'Gardez vos données en sécurité avec le stockage sur l\'appareil, vous assurant que vos éléments de presse-papiers sont toujours à portée de main et sous votre contrôle.';

  @override
  String get sub_dialog__f5__title => 'Intégration avec Google Drive';

  @override
  String get sub_dialog__f5__subtitle =>
      'Stockez en toute sécurité fichiers et médias sur Google Drive, en s\'intégrant parfaitement avec le Presse-papiers CopyCat pour une meilleure gestion des données.';

  @override
  String get sub_dialog__f6__title => 'Recherche instantanée';

  @override
  String get sub_dialog__f6__subtitle =>
      'Trouvez ce dont vous avez besoin instantanément avec de puissantes capacités de recherche instantanée, rendant la récupération des éléments de presse-papiers rapide et efficace.';

  @override
  String get sub_dialog__f7__title =>
      'Synchronisation jusqu\'aux dernières 24 heures';

  @override
  String get sub_dialog__f7__subtitle =>
      'Accédez à votre historique de presse-papiers et synchronisez-le sur tous vos appareils pour les dernières 24 heures. Cela vous assure de ne jamais perdre d\'éléments copiés importants, rendant votre flux de travail fluide et efficace.';

  @override
  String get sub_dialog__f8__title => 'Jusqu\'à 3 collections';

  @override
  String get sub_dialog__f8__subtitle =>
      'Organisez vos éléments de presse-papiers en jusqu\'à 3 collections, fournissant une catégorisation simple pour une meilleure gestion du flux de travail.';

  @override
  String get sub_dialog__f9__title => 'Synchronisation en arrière-plan';

  @override
  String get sub_dialog__f9__subtitle =>
      'La synchronisation gratuite fonctionne au mieux des capacités disponibles et peut prendre jusqu’à 15 minutes selon la charge des serveurs.';

  @override
  String get sub_dialog__f10__title =>
      'Prise en charge du chiffrement de bout en bout';

  @override
  String get sub_dialog__f10__subtitle =>
      'Le chiffrement de bout en bout rend tout crypté pour une confidentialité supérieure.';

  @override
  String get sub_dialog__text__pro_title => 'Avec PRO';

  @override
  String get sub_dialog__text__pro_subtitle => 'Tout inclus dans Gratuit +';

  @override
  String get sub_dialog__f11__title => 'Jusqu\'à 50 collections';

  @override
  String get sub_dialog__f11__subtitle =>
      'Organisez vos éléments de presse-papiers en jusqu\'à 50 collections pour une gestion ultime.';

  @override
  String get sub_dialog__f12__title =>
      'Synchronisation jusqu\'aux derniers 30 jours';

  @override
  String get sub_dialog__f12__subtitle =>
      'L\'historique des presse-papiers est synchronisé sur tous vos appareils pour les clips créés au cours des 30 derniers jours. Cela signifie que vous pouvez accéder à tout clip que vous avez copié au cours du dernier mois, quel que soit l\'appareil que vous utilisez.';

  @override
  String get sub_dialog__f13__title => 'Synchronisation en temps réel';

  @override
  String get sub_dialog__f13__subtitle =>
      'Bénéficiez d\'une synchronisation à la vitesse de l\'éclair.';

  @override
  String get sub_dialog__f14__title => 'Support rapide et prioritaire';

  @override
  String get sub_dialog__f14__subtitle =>
      'Obtenez un support rapide et prioritaire en tant qu\'utilisateur PRO.';

  @override
  String get sub_dialog__f15__title =>
      'Accès anticipé aux nouvelles fonctionnalités';

  @override
  String get sub_dialog__f15__subtitle =>
      'Soyez le premier à essayer de nouvelles fonctionnalités et mises à jour.';

  @override
  String get sub_dialog__f16__title => 'Règles d\'exclusion personnalisées';

  @override
  String get sub_dialog__f16__subtitle =>
      'Contrôle précis de votre presse-papiers. Vous permet de définir quoi copier, d\'où copier et quand copier.';

  @override
  String get sub_dialog__f17__title => 'Glisser-déposer';

  @override
  String get sub_dialog__f17__subtitle =>
      'Déplacez sans effort les éléments dans toutes les directions sur vos appareils de bureau et tablettes.';

  @override
  String get sub_dialog__f18__title => 'Thématisation';

  @override
  String get sub_dialog__f18__subtitle =>
      'Personnalisez l\'apparence et la convivialité de l\'application selon vos préférences.';

  @override
  String get paywall_dialog__text__month => 'mois';

  @override
  String get paywall_dialog__text__year => 'année';

  @override
  String get paywall_dialog__text__subscription => 'Abonnement';

  @override
  String get paywall_dialog__text__supported_platform =>
      'Pour accéder aux fonctionnalités premium sur le Presse-papiers Copycat, veuillez vous abonner via le Play Store ou l\'App Store d\'Apple. Votre abonnement sera synchronisé sur tous vos appareils, y compris Linux et Windows.';

  @override
  String get paywall_dialog__text__unlock_pro => 'Débloquer CopyCat PRO';

  @override
  String get paywall_dialog__text__unlock_pro_p1 =>
      'Profitez de plus de 30 jours d\'historique synchronisé, plus de 50 collections, du chiffrement de bout en bout, de la synchronisation en temps réel, de l\'accès aux nouvelles fonctionnalités, et bien plus encore.';

  @override
  String get paywall_dialog__text__try_again => 'Veuillez réessayer';

  @override
  String get paywall_dialog__text__current_plan => 'Plan actuel';

  @override
  String get paywall_dialog__text__expired_plan => 'Plan actuel • Expiré';

  @override
  String paywall_dialog__text__trial_till({required DateTime till}) {
    final intl.DateFormat tillDateFormat = intl.DateFormat.yMMMd(localeName);
    final String tillString = tillDateFormat.format(till);

    return 'Essai jusqu\'à $tillString';
  }

  @override
  String get paywall_dialog__text__upgrade => 'Mise à niveau';

  @override
  String fab__create_collection({required String remaining}) {
    return 'Créer une collection ( $remaining restant )';
  }

  @override
  String get fab__sync => 'Synchroniser';

  @override
  String get fab__sync_unavailable => 'Synchronisation indisponible';

  @override
  String get fab__sync_up_to_date => 'Déjà à jour.';

  @override
  String fab__sync_failed({required String message}) {
    return 'Échec de la synchronisation : $message';
  }

  @override
  String get layout__navbar__clipboard => 'Presse-papiers';

  @override
  String get layout__navbar__collections => 'Collections';

  @override
  String get layout__navbar__settings => 'Paramètres';

  @override
  String get search__tooltip__filter => 'Filtres de recherche';

  @override
  String manage_sub__ack__promo_sub({required String till}) {
    return 'Vous utilisez un abonnement promotionnel jusqu\'à $till';
  }

  @override
  String get manage_sub__button__text => 'Gérer les abonnements';

  @override
  String get my_account__button__tooltip => 'Mon Compte';

  @override
  String get badges__tooltip__experimental =>
      'Cette fonctionnalité est expérimentale et peut ne pas fonctionner comme prévu.';

  @override
  String get badges__label__pro => 'Pro';

  @override
  String get badges__tooltip__pro_only =>
      'Cette fonctionnalité est disponible uniquement pour les utilisateurs Pro.';

  @override
  String get collection_selector__tile__no_collection => 'Aucune collection';

  @override
  String get collection_selector__button__remove_collection =>
      'Supprimer la collection';

  @override
  String get dialog__logout__title => 'Déconnexion';

  @override
  String get dialog__logout__subtitle =>
      '⚠️ AVERTISSEMENT ⚠️\n\nLa déconnexion supprimera les modifications non synchronisées dans la base de données locale. Êtes-vous sûr de vouloir continuer?';

  @override
  String get dialog__logging_out__ack =>
      'Déconnexion en cours! Veuillez patienter...';

  @override
  String get reset_pass__text__label => 'Réinitialiser votre mot de passe';

  @override
  String get dnd__text__drop_here => 'Déposez ici';

  @override
  String dnd__ack__error_max_drop_count({required int count}) {
    return 'Un maximum de $count éléments déposés est autorisé en une seule fois.';
  }

  @override
  String get search_filter__text__title => 'Filtres';

  @override
  String get search_filter__button__apply => 'Appliquer';

  @override
  String get search_filter__text__from => 'De';

  @override
  String get search_filter__text__select => 'Sélectionner';

  @override
  String get search_filter__text__to => 'À';

  @override
  String get search_filter__text__now => 'Maintenant';

  @override
  String get search_filter__text__including => 'Incluant';

  @override
  String get search_filter__chip__text => 'Texte';

  @override
  String get search_filter__chip__url => 'URL';

  @override
  String get search_filter__chip__media => 'Médias';

  @override
  String get search_filter__chip__docs => 'Docs';

  @override
  String get search_filter__text__textCategories => 'Catégories de texte';

  @override
  String get search_filter__text__exclusive => '( Exclusif )';

  @override
  String get search_filter__text_cat__email => 'E-mail';

  @override
  String get search_filter__text_cat__phone => 'Téléphone';

  @override
  String get search_filter__text_cat__color => 'Couleur';

  @override
  String get search_filter__text_cat__struct => 'Structure';

  @override
  String get search_filter__text__sort_by => 'Trier par';

  @override
  String get search_filter__sort_by__last_mod => 'Dernière modification';

  @override
  String get search_filter__sort_by__created => 'Créé';

  @override
  String get search_filter__sort_by__copy_count => 'Nombre de copies';

  @override
  String get search_filter__sort_by__last_copied => 'Dernier copié';

  @override
  String get search_filter__text__sort_order => 'Ordre de tri';

  @override
  String get search_filter__sort_ord__asc => 'Asc';

  @override
  String get search_filter__sort_ord__desc => 'Desc';

  @override
  String get search_filter__tooltip__clear => 'Effacer';

  @override
  String get search_filter__empty => '∅';

  @override
  String get search_filter__button__reset => 'Réinitialiser';

  @override
  String get login__local_signin__tooltip =>
      'Pas de synchronisation. Toutes les données restent sur votre appareil.';

  @override
  String get login__local_signin__btn__label => 'Mode Hors-ligne';

  @override
  String get login__form__input__name => 'Entrez votre bon nom';

  @override
  String get login__form__input__email => 'Entrez votre e-mail';

  @override
  String get login__form__input__error_email =>
      'Veuillez entrer une adresse e-mail valide';

  @override
  String get login__form__input__password => 'Entrez votre mot de passe';

  @override
  String get login__form__input__error_password_length =>
      'Veuillez entrer un mot de passe d\'au moins 6 caractères de long';

  @override
  String get login__form__button__signin => 'Se connecter';

  @override
  String get login__form__button__signup => 'S\'inscrire';

  @override
  String get login__form__button__forgot_password => 'Mot de passe oublié?';

  @override
  String get login__form__text__signup =>
      'Vous n\'avez pas de compte? S\'inscrire';

  @override
  String get login__form__text__old_user =>
      'Vous avez déjà un compte? Se connecter';

  @override
  String get login__form__text__reset_password =>
      'Envoyer un e-mail de réinitialisation de mot de passe';

  @override
  String get login__form__text__reset_ack =>
      'Le courriel de réinitialisation de mot de passe a été envoyé';

  @override
  String get login__form__button__back => 'Retour à la connexion';

  @override
  String get login__form__button__update_password =>
      'Mettre à jour le mot de passe';

  @override
  String get login__form__text_tnc_p1 => 'En continuant, vous acceptez les ';

  @override
  String get login__form__text_tnc_p2 => 'politiques de confidentialité';

  @override
  String get login__form__text_tnc_p3 => ' suivantes et ';

  @override
  String get login__form__text_tnc_p4 => 'les conditions d\'utilisation.';

  @override
  String get home__search__hint => 'Rechercher dans le presse-papiers';

  @override
  String get collections__search__hint => 'Rechercher une collection';

  @override
  String get home__search__reset => 'Réinitialiser la recherche';

  @override
  String get preview__vert_view__tab1_title => 'Aperçu';

  @override
  String get preview__vert_view__tab2__title => 'Détails';

  @override
  String get preview__card__missing_text => 'C\'est un clip vide';

  @override
  String get preview__card__video__play => 'Lire la vidéo';

  @override
  String get preview__card__video__mute => 'Couper le son';

  @override
  String get preview__card__video__unmute => 'Activer le son';

  @override
  String get preview__card__video__close => 'Fermer le lecteur';

  @override
  String get preview__card__file__open => 'Ouvrir le fichier';

  @override
  String get preview__form__title => 'Modifier les détails';

  @override
  String get preview__inspector__lock_clip => 'Verrouiller le clip';

  @override
  String get preview__inspector_lock_clip_description =>
      'Chiffrez ce clip, désactivez l’indexation de recherche et exigez une authentification pour le consulter.';

  @override
  String get preview__form__input__title => 'Titre';

  @override
  String get preview__form__input__description => 'Description';

  @override
  String get preview__inspector__title => 'Détails du clip';

  @override
  String get preview__inspector__untitled => 'Clip sans titre';

  @override
  String get preview__inspector__saved => 'Détails enregistrés';

  @override
  String get preview__inspector__save_changes =>
      'Enregistrer les modifications';

  @override
  String get preview__inspector__decrypt => 'Déchiffrer';

  @override
  String get preview__inspector__open_source => 'Ouvrir la source';

  @override
  String get preview__inspector__section__actions => 'Actions';

  @override
  String get preview__inspector__section__details => 'Détails';

  @override
  String get preview__inspector__section__content => 'Contenu';

  @override
  String get preview__inspector__section__security => 'Sécurité';

  @override
  String get preview__inspector__section__organize => 'Organiser';

  @override
  String get preview__inspector__label__created => 'Créé';

  @override
  String get preview__inspector__label__modified => 'Modifié';

  @override
  String get preview__inspector__label__last_copied => 'Dernière copie';

  @override
  String get preview__inspector__label__copied_count => 'Nombre de copies';

  @override
  String get preview__inspector__label__source_app => 'Application source';

  @override
  String get preview__inspector__label__source_url => 'URL source';

  @override
  String get preview__inspector__label__file_size => 'Taille du fichier';

  @override
  String get preview__inspector__label__mime_type => 'Type MIME';

  @override
  String get preview__inspector__label__extension => 'Extension';

  @override
  String get preview__inspector__label__characters => 'Caractères';

  @override
  String get preview__inspector__label__lines => 'Lignes';

  @override
  String get preview__inspector__label__link => 'Lien';

  @override
  String get preview__inspector__label__image_dimension => 'Dimension';

  @override
  String get preview__inspector__label__device => 'Appareil';

  @override
  String get preview__inspector__label__storage => 'Stockage';

  @override
  String get preview__inspector__status__encrypted => 'Chiffré';

  @override
  String get preview__inspector__status__local_only => 'Local uniquement';

  @override
  String get preview__inspector__status__synced => 'Synchronisé';

  @override
  String get preview__inspector__status__not_synced => 'Non synchronisé';

  @override
  String get preview__inspector__status__download_required =>
      'Téléchargement requis';

  @override
  String get preview__inspector__status__available => 'Disponible hors ligne';

  @override
  String get preview__inspector__type__text => 'Texte';

  @override
  String get preview__inspector__type__media => 'Média';

  @override
  String get preview__inspector__type__file => 'Fichier';

  @override
  String get preview__inspector__type__link => 'Lien';

  @override
  String get reset_password__appbar__title =>
      'Réinitialiser votre mot de passe';

  @override
  String get reset_password__success_ack =>
      'Mot de passe réinitialisé avec succès';

  @override
  String get onboarding__text__welcome => 'Bienvenue à';

  @override
  String get onboarding__text__lets_continue => 'Continuons';

  @override
  String get onboarding__button__to_login => 'Se connecter';

  @override
  String get onboarding__snackbar__export_success =>
      'Clé de chiffrement exportée avec succès.';

  @override
  String get onboarding__dialog__skip_export__title =>
      '✋ Sauvegardez votre clé de chiffrement';

  @override
  String get onboarding__dialog__skip_export__subtitle =>
      'Vous n\'avez pas encore exporté votre clé de chiffrement. Sans sauvegarde, vous ne pourrez pas accéder à vos clips chiffrés si la clé est perdue ou si vous changez d\'appareil.\n\n👉 Si vous avez déjà une sauvegarde sécurisée de votre clé, vous pouvez continuer en toute sécurité. Sinon, nous vous recommandons fortement d\'exporter la clé maintenant pour éviter toute perte de données. Voulez-vous toujours continuer ?';

  @override
  String get onboarding__dialog__export_info__title =>
      '🤔 Pourquoi exporter la clé de chiffrement ?';

  @override
  String get onboarding__dialog__export_info__subtitle =>
      'Exporter votre clé de chiffrement est essentiel pour accéder en toute sécurité à vos données chiffrées sur plusieurs appareils. Sans la clé, vos données chiffrées resteront inaccessibles après la synchronisation.\n\nGardez une sauvegarde de votre clé de chiffrement dans un endroit sûr pour éviter la perte de données. Souvenez-vous, la clé est unique à votre compte et ne peut être récupérée si elle est perdue.\n\nRemarque : Copycat ne peut pas accéder à vos clips chiffrés ni à vos clés de chiffrement. Cela est dû au fait que nous valorisons votre confidentialité au-dessus de tout.';

  @override
  String get onboarding__text__export_key_headline =>
      'Chiffrement du presse-papiers';

  @override
  String get onboarding__text__export_key_title =>
      '💪 Bonne nouvelle ! Le chiffrement est actif pour votre presse-papiers';

  @override
  String get onboarding__button__export_key => 'Exporter la clé';

  @override
  String get onboarding__dialog__skip_gen_key__title =>
      '✋ Vos clips seront non sécurisés';

  @override
  String get onboarding__dialog__skip_gen_key__subtitle =>
      'Vous n\'avez pas encore généré de clé de chiffrement. Sans cela, vos clips resteront non chiffrés et non sécurisés. Vous pouvez générer la clé plus tard dans Paramètres ❯ Sécurité. Voulez-vous toujours continuer ?';

  @override
  String get onboarding__dialog__gen_key_info__title =>
      '🤔 Pourquoi ai-je besoin du chiffrement ?';

  @override
  String get onboarding__dialog__gen_key_info__subtitle =>
      'Le chiffrement protège vos données en les convertissant en un format sécurisé qui ne peut être accédé qu\'avec une clé. Sans chiffrement, vos clips sont stockés en texte brut, les rendant vulnérables à un accès non autorisé. Activer le chiffrement garantit que vous seul pouvez accéder à vos données sensibles, fournissant une couche supplémentaire de sécurité contre les violations potentielles.';

  @override
  String get onboarding__text__gen_key_headline =>
      'Configurer le chiffrement du presse-papiers';

  @override
  String onboarding__text__key_generated_title({required String keyPreview}) {
    return '🎉 Clé $keyPreview*** générée avec succès 🎉';
  }

  @override
  String get onboarding__button__regenerate_key => 'Régénérer la clé';

  @override
  String get onboarding__text__no_key =>
      'Votre compte n\'a pas de clé de chiffrement';

  @override
  String get onboarding__button__generate_key => 'Générer la clé';

  @override
  String get onboarding__button__do_it_later => 'Le faire plus tard';

  @override
  String get onboarding__button__why_important => 'Pourquoi c\'est important ?';

  @override
  String get onboarding__snackbar__invalid_key =>
      'Ceci n\'est pas une clé de chiffrement CopyCat valide';

  @override
  String get onboarding__dialog__skip_import__title =>
      '✋ Clips chiffrés inaccessibles';

  @override
  String get onboarding__dialog__skip_import__subtitle =>
      'Vous n\'avez pas encore importé la clé de chiffrement. Cela signifie que tous vos clips chiffrés resteront inaccessibles localement après la synchronisation.\n\n Pour y accéder, importez la clé à partir de Paramètres ❯ Sécurité.\nVoulez-vous toujours continuer ?';

  @override
  String get onboarding__dialog__reset_key__title =>
      '✋ Supprimer définitivement les données chiffrées';

  @override
  String get onboarding__dialog__reset_key__subtitle =>
      'Cette action est irréversible. Êtes-vous sûr de vouloir supprimer définitivement toutes les données chiffrées du serveur ?';

  @override
  String get onboarding__snackbar__reset_key__success =>
      'Chiffrement supprimé avec succès.';

  @override
  String get onboarding__dialog__import_info__title => '🤔 Où est ma clé ?';

  @override
  String get onboarding__dialog__import_info__subtitle =>
      'Votre clé de chiffrement est un fichier sécurisé généré lors du processus de configuration du chiffrement. Si vous l\'avez égarée, vérifiez votre dossier de téléchargements ou tout emplacement de sauvegarde où vous auriez pu la sauvegarder. Sans cette clé, vos données chiffrées ne peuvent être accessibles.\n\nSi vous avez configuré la clé de chiffrement sur un autre appareil, vous pouvez l\'exporter en allant dans Paramètres ❯ Sécurité ❯ E2EE Vault sur cet appareil. Transférez la clé en toute sécurité vers cet appareil pour reprendre l\'accès à vos données chiffrées.';

  @override
  String get onboarding__text__import_key_headline =>
      'Importer la clé de chiffrement du presse-papiers';

  @override
  String get onboarding__text__import_key_title =>
      'Votre compte a actuellement un chiffrement actif.';

  @override
  String get onboarding__button__import_key => 'Importer la clé';

  @override
  String get onboarding__button__reset_key => 'Réinitialiser le chiffrement';

  @override
  String get onboarding__button__where_key => 'Où est la clé?';

  @override
  String get onboarding__text__go_home => 'Allons à la maison';

  @override
  String onboarding__restoration__failed({required String message}) {
    return 'Échec de la restauration : $message';
  }

  @override
  String get onboarding__restoration_warning =>
      '⚠️ Veuillez garder cet écran ouvert pendant la synchronisation pour éviter la corruption des données ou des incohérences.';

  @override
  String get sync_restore__title => 'Restauration de votre espace de travail';

  @override
  String get sync_restore__subtitle =>
      'CopyCat rapatrie vos collections synchronisées et l’historique du presse-papiers sur cet appareil.';

  @override
  String get sync_restore__checking_backup =>
      'Vérification de la sauvegarde distante...';

  @override
  String get sync_restore__decrypting_title => 'Déchiffrement des clips';

  @override
  String get sync_restore__decrypting_counting =>
      'Comptage des clips chiffrés...';

  @override
  String sync_restore__decrypting_progress({
    required int decrypted,
    required int total,
  }) {
    return '$decrypted déchiffrés sur $total';
  }

  @override
  String get sync_restore__workspace_restored => 'Espace de travail restauré';

  @override
  String get sync_restore__data_ready =>
      'Vos données synchronisées sont prêtes sur cet appareil.';

  @override
  String get sync_restore__restoring_collections =>
      'Restauration des collections pour conserver l’organisation des éléments du presse-papiers.';

  @override
  String get sync_restore__restoring_clips =>
      'Les collections sont restaurées. L’historique du presse-papiers suit.';

  @override
  String get sync_restore__finishing_checks =>
      'Finalisation des vérifications de restauration.';

  @override
  String get sync_restore__no_synced_items =>
      'Aucun élément synchronisé trouvé';

  @override
  String sync_restore__restored_count({required int count}) {
    return '$count restaurés';
  }

  @override
  String sync_restore__restored_of_total({
    required int synced,
    required int total,
  }) {
    return '$synced sur $total restaurés';
  }

  @override
  String get sync_restore__progress_estimating => 'Estimation';

  @override
  String get sync_restore__progress_complete => 'Terminé';

  @override
  String get sync_restore__status_ready => 'Prêt';

  @override
  String get sync_restore__status_restoring => 'Restauration';

  @override
  String get sync_restore__collections_title => 'Collections';

  @override
  String get sync_restore__collections_description =>
      'Groupes enregistrés et organisation';

  @override
  String get sync_restore__clipboard_items_title =>
      'Éléments du presse-papiers';

  @override
  String get sync_restore__clipboard_items_description =>
      'Historique, texte, liens, fichiers et médias';

  @override
  String sync_restore__count_of_total({required int total}) {
    return 'sur $total';
  }

  @override
  String get sync_restore__continue_to_copycat => 'Continuer vers CopyCat';

  @override
  String get sync_restore__failed_title => 'Échec de la restauration';

  @override
  String get restore_clips__text__title => 'Restaurer mon presse-papiers';

  @override
  String get restore_clips__error__no_backup =>
      'Aucune sauvegarde du presse-papiers trouvée';

  @override
  String restore_clips__text__total_count({required int totalCount}) {
    return 'Vous avez environ $totalCount clip(s) à restaurer.';
  }

  @override
  String get restore_clips__sync_disable =>
      'La synchronisation est actuellement désactivée. Veuillez l\'activer pour continuer.';

  @override
  String get restore_clips__preparing =>
      'Préparation de la restauration des clips. Veuillez patienter...';

  @override
  String restore_clips__restored({required int syncCount}) {
    return 'Vos $syncCount clip(s) ont été restaurés avec succès.';
  }

  @override
  String restore_clips__restoring({
    required int synced,
    required int totalCount,
  }) {
    return 'Restauré : $synced de $totalCount clips.';
  }

  @override
  String get restore_collections__text__title => 'Restaurer mes collections';

  @override
  String get restore_collections__error__no_backup =>
      'Aucune sauvegarde de collections trouvée';

  @override
  String restore_collections__text__total_count({required int totalCount}) {
    return 'Vous avez environ $totalCount collection(s) à restaurer.';
  }

  @override
  String get restore_collections__sync_disable =>
      'La synchronisation est actuellement désactivée. Veuillez l\'activer pour continuer.';

  @override
  String get restore_collections__preparing =>
      'Préparation de la restauration des collections. Veuillez patienter...';

  @override
  String restore_collections__restored({required int syncCount}) {
    return 'Vos $syncCount collection(s) ont été restaurées avec succès.';
  }

  @override
  String restore_collections__restoring({
    required int synced,
    required int totalCount,
  }) {
    return 'Restauré : $synced de $totalCount collections.';
  }

  @override
  String get drive__snackbar__success =>
      'La configuration du lecteur est maintenant terminée.';

  @override
  String get drive__text__setting_up => 'Configuration et synchronisation...';

  @override
  String get drive__text__setting_up__warning =>
      'Veuillez patienter pendant que nous terminons cela. Ne fermez pas l\'application.';

  @override
  String get create_clip__appbar__title__new => 'Nouveau Clip';

  @override
  String get create_clip__appbar__title__edit => 'Modifier le Clip';

  @override
  String get create_clip__button__save_new => 'Enregistrer comme nouveau';

  @override
  String get create_clip__input__hint => 'Écrivez le contenu de votre clip ici';

  @override
  String get collections__text__tip =>
      'Pour vous assurer que vos clips importants sont toujours disponibles, quel que soit le moment, sur tous vos appareils, enregistrez-les dans une collection !';

  @override
  String get collections__appbar__title => 'Collections';

  @override
  String get collections__appbar__title__create => 'Créer une collection';

  @override
  String get collections__appbar__title__edit => 'Modifier la collection';

  @override
  String get collections__input__name => 'Nom';

  @override
  String get collections__input__description => 'Description';

  @override
  String get collections__label__emoji =>
      'Icône de collection (cliquez pour modifier)';

  @override
  String get collections__validation__duplicate =>
      'Une collection avec cette icône et ce nom existe déjà';

  @override
  String get collections__validation__name_required =>
      'Le nom est obligatoire.';

  @override
  String get collections__validation__name_max_length =>
      'Le nom doit contenir au maximum 30 caractères.';

  @override
  String get select_collection__appbar__title => 'Sélectionner la collection';

  @override
  String get account__dialog__delete_confirm__title =>
      'Demande de suppression de compte';

  @override
  String get account__dialog__delete_confirm__description =>
      'Vous serez redirigé vers le formulaire de demande de suppression de compte, êtes-vous sûr ?';

  @override
  String get account__list_tile__display_name => 'Nom d\'affichage';

  @override
  String get account__list_tile__email => 'E-mail';

  @override
  String get account__list_tile__settings => 'Paramètres du compte';

  @override
  String get account__list_tile__danger_zone => 'Zone dangereuse';

  @override
  String get account__button__req_delete => 'Demander la suppression du compte';

  @override
  String get account__appbar__title => 'Mon Compte';

  @override
  String get settings__appbar__title => 'Paramètres';

  @override
  String get settings__header__appearance => 'Apparence';

  @override
  String get settings__header__sorting => 'Tri par défaut';

  @override
  String get settings__header__interactions => 'Interactions';

  @override
  String get settings__tab__1 => 'Général';

  @override
  String get settings__tab__2 => 'Personnalisation';

  @override
  String get settings__tab__3 => 'Cloud';

  @override
  String get settings__tab__4 => 'Sécurité';

  @override
  String get settings__tab__5 => 'Expérimental';

  @override
  String get settings__text__encryption => 'Chiffrement';

  @override
  String get settings__text__sync_not_available =>
      'Les configurations relatives à la synchronisation ne sont pas disponibles lors de l\'utilisation du presse-papiers local.';

  @override
  String get settings__appbar__er__title => 'Règles d\'exclusion';

  @override
  String get settings__text__er__predefine => 'Règles d\'exclusion prédéfinies';

  @override
  String get settings__text__er__pass_manager =>
      'Gestionnaires de mots de passe';

  @override
  String get settings__text__er__pass_manager__subtitle =>
      'Exclure les captures des gestionnaires de mots de passe';

  @override
  String get settings__text__er__cc => 'Numéro de carte de crédit';

  @override
  String get settings__text__er__cc__subtitle =>
      'Exclure les numéros de carte détectés';

  @override
  String get settings__text__er__phone => 'Numéro de téléphone';

  @override
  String get settings__text__er__phone__subtitle =>
      'Exclure les numéros de téléphone détectés';

  @override
  String get settings__text__er__email => 'Adresse e-mail';

  @override
  String get settings__text__er__email__subtitle =>
      'Exclure les adresses e-mail détectées';

  @override
  String get settings__text__er__url => 'URL sensible';

  @override
  String get settings__text__er__url__subtitle =>
      'Exclure les captures contenant des URL sensibles';

  @override
  String get settings__text__decrypted__note =>
      '🥳 Félicitations ! Tous vos clips ont été décryptés avec succès localement,\n il n\'est donc pas nécessaire de reconstruire la base de données.';

  @override
  String get settings__appbar__cer__title =>
      'Règles d\'exclusion personnalisées';

  @override
  String get settings__switch__drag_n_drop__title => 'Glisser et déposer';

  @override
  String get settings__switch__drag_n_drop__subtitle =>
      'Autoriser les éléments à être déplacés librement dans les deux sens au sein de l\'application.';

  @override
  String get settings__dropdown__no_copy_over_limit__title =>
      'Ne pas copier automatiquement au-delà de';

  @override
  String settings__dropdown__no_copy_over_limit__subtitle({
    required String fileSize,
  }) {
    return 'Les fichiers et médias de plus d\'une certaine taille ($fileSize) ne seront pas copiés automatiquement.';
  }

  @override
  String get settings__text__5MB => '5 Mo';

  @override
  String get settings__text__10MB => '10 Mo';

  @override
  String get settings__text__20MB => '20 Mo';

  @override
  String get settings__text__50MB => '50 Mo';

  @override
  String get settings__text__100MB => '100 Mo';

  @override
  String get settings__dropdown__no_upload_over_limit__title =>
      'Ne pas téléverser automatiquement au-delà de';

  @override
  String settings__dropdown__no_upload_over_limit__subtitle({
    required String fileSize,
  }) {
    return 'Les fichiers et médias de plus d\'une certaine taille ($fileSize) ne seront pas téléversés automatiquement.';
  }

  @override
  String get settings__dropdown__sync_mode__title => 'Mode de synchronisation';

  @override
  String get settings__dropdown__sync_mode__subtitle =>
      'Sélectionnez la vitesse de synchronisation qui vous convient le mieux.';

  @override
  String get settings__sync_mode__realtime => 'Temps réel';

  @override
  String get settings__sync_mode__balanced => 'Équilibré';

  @override
  String get settings__dropdown__theme__title => 'Mode thème';

  @override
  String get settings__dropdown__default_sort__title => 'Trier par';

  @override
  String get settings__dropdown__default_sort_order__title => 'Ordre de tri';

  @override
  String get settings__theme__system => 'Système';

  @override
  String get settings__theme__light => 'Clair';

  @override
  String get settings__theme__dark => 'Sombre';

  @override
  String get settings__dropdown__color_mode__title => 'Mode couleur';

  @override
  String get settings__dropdown__color_mode__subtitle =>
      'Sélectionnez le mode de couleur pour personnaliser l\'apparence de l\'application. L\'option par défaut est \"Spot tonal\".';

  @override
  String get settings__dropdown__clipboard_feedback__title =>
      'Clipboard Feedback';

  @override
  String get settings__dropdown__clipboard_feedback__subtitle =>
      'Choose how CopyCat responds when a clip is captured.';

  @override
  String get settings__clipboard_feedback__disabled => 'Disabled';

  @override
  String get settings__clipboard_feedback__copy_only => 'Copie uniquement';

  @override
  String get settings__clipboard_feedback__sync_only =>
      'Synchronisation uniquement';

  @override
  String get settings__clipboard_feedback__copy_and_sync =>
      'Copie et synchronisation';

  @override
  String get settings__clipboard_feedback__toast => 'Toast';

  @override
  String get settings__color_mode__tonalSpot => 'Spot tonal';

  @override
  String get settings__color_mode__content => 'Contenu';

  @override
  String get settings__color_mode__expressive => 'Expressif';

  @override
  String get settings__color_mode__fidelity => 'Fidélité';

  @override
  String get settings__color_mode__fruit_salad => 'Salade de fruits';

  @override
  String get settings__color_mode__monochrome => 'Monochrome';

  @override
  String get settings__color_mode__neutral => 'Neutre';

  @override
  String get settings__color_mode__rainbow => 'Arc-en-ciel';

  @override
  String get settings__color_mode__vibrant => 'Vibrant';

  @override
  String get settings__tile__cer_title => 'Règles personnalisées';

  @override
  String get settings__tile__cer_subtitle =>
      'Exclure par application, par fenêtre/application titre, URL de site Web ou motif Regex';

  @override
  String get settings__tile__er_title => 'Règles d\'exclusion';

  @override
  String get settings__tile__er_subtitle =>
      'Empêcher les informations de se copier dans le presse-papiers. Cliquez pour un contrôle avancé.';

  @override
  String get settings__switch__enable_sync__title =>
      'Synchronisation du presse-papiers';

  @override
  String get settings__switch__enable_sync__subtitle =>
      'Synchronisez votre presse-papiers entre les appareils sans effort.';

  @override
  String get settings__switch__sync_file__title =>
      'Synchronisation des fichiers et médias';

  @override
  String get settings__switch__sync_file__subtitle =>
      'Basculer pour synchroniser les fichiers et les clips multimédias entre les appareils.';

  @override
  String get settings__switch__paused__title =>
      'Mettre en pause l\'écouteur du presse-papiers';

  @override
  String get settings__switch__paused__subtitle =>
      'Suspendre temporairement le suivi du presse-papiers jusqu\'à une heure définie.';

  @override
  String settings__switch__paused_active__subtitle({required DateTime time}) {
    final intl.DateFormat timeDateFormat = intl.DateFormat(
      'h:mm a',
      localeName,
    );
    final String timeString = timeDateFormat.format(time);

    return 'En pause jusqu\'à $timeString. Appuyez pour reprendre ou ajuster le temps.';
  }

  @override
  String get settings__switch__smart_paste__title => 'Collage intelligent';

  @override
  String get settings__switch__smart_paste__subtitle =>
      'Collez du contenu directement sur l\'application ciblée.';

  @override
  String get settings__switch__focus_loss_behavior__title =>
      'Garder la fenêtre ouverte en cas de perte de focus';

  @override
  String get settings__switch__focus_loss_behavior__subtitle =>
      'Lorsque CopyCat perd le focus, gardez-le ouvert en arrière-plan au lieu de le masquer automatiquement.';

  @override
  String get settings__switch__transform_behavior__title =>
      'Enregistrer les transformations comme nouveaux clips';

  @override
  String get settings__switch__transform_behavior__subtitle =>
      'Si activé, les actions de transformation créent un nouveau clip au lieu de copier ou coller immédiatement.';

  @override
  String get settings__switch__type_search__title =>
      'Recherche pendant la saisie';

  @override
  String get settings__switch__type_search__subtitle =>
      'Recherchez des clips pendant que vous tapez dans la barre de recherche.';

  @override
  String get settings__switch__startup__title => 'Lancer au démarrage';

  @override
  String get settings__switch__startup__subtitle =>
      'Lancez automatiquement CopyCat lorsque votre appareil s\'allume.';

  @override
  String get settings__switch__tray_icon__title =>
      'Afficher l\'icône dans la barre système';

  @override
  String get settings__switch__tray_icon__subtitle =>
      'Affiche l\'icône CopyCat dans la barre de menu / zone de notification du système.';

  @override
  String get settings__switch__hide_from_screen_capture__title =>
      'Masquer pendant les captures d\'écran';

  @override
  String get settings__switch__hide_from_screen_capture__subtitle =>
      'Lorsque cette option est activée, les captures et enregistrements d\'écran doivent masquer le contenu de CopyCat sur les plateformes prises en charge.';

  @override
  String get settings__switch__hotkey__title => 'Activer avec le raccourci';

  @override
  String get settings__switch__hotkey__subtitle =>
      'Utilisez un raccourci clavier pour accéder rapidement à votre presse-papiers CopyCat';

  @override
  String get settings__switch__paste_stack_hotkey__title =>
      'Raccourci Paste Stack';

  @override
  String get settings__switch__paste_stack_hotkey__subtitle =>
      'Utilisez un raccourci clavier pour ouvrir ou fermer Paste Stack';

  @override
  String get settings__switch__quickpaste_hotkey__title =>
      'Raccourci Quick Paste';

  @override
  String get settings__switch__quickpaste_hotkey__subtitle =>
      'Utilisez un raccourci clavier pour accéder instantanément à vos 10 éléments de presse-papiers principaux';

  @override
  String get settings__hotkey__unassigned => 'Non assigné';

  @override
  String get settings__hotkey__preview_start => 'Presser ';

  @override
  String get settings__hotkey__preview_end =>
      ' pour montrer ou cacher l\'application.';

  @override
  String get settings__tile__theme_color__title => 'Couleur du thème';

  @override
  String get settings__tile__theme_color__subtitle =>
      'Cette couleur influencera l\'apparence générale de l\'application.';

  @override
  String get settings__tile__desk_client__title =>
      'Télécharger le client de bureau';

  @override
  String get settings__tile__mobile_client__title =>
      'Télécharger le client mobile';

  @override
  String get settings__tile__client__subtitle =>
      'Accédez à votre presse-papiers sur tous vos appareils.';

  @override
  String get settings__tile__e2e_setup__title =>
      'Configuration du chiffrement de bout en bout';

  @override
  String get settings__tile__e2e_setup__subtitle =>
      'Configurer le chiffrement pour vos clips.';

  @override
  String get settings__switch__e2e__title => 'Activer le chiffrement';

  @override
  String get settings__switch__e2e__subtitle =>
      'Basculer pour activer ou désactiver le chiffrement de bout en bout pour vos clips.';

  @override
  String get settings__switch__e2e_nonce__title =>
      'Mode haute sécurité (recommandé)';

  @override
  String get settings__switch__e2e_nonce__subtitle =>
      'Utilise AES-GCM pour une meilleure protection des données et la détection des altérations. (Les anciennes versions de l\'application ne peuvent pas déchiffrer ces nouveaux clips)';

  @override
  String get settings__dialog__conn_gdrive__title =>
      'Reconnecter Google Drive?';

  @override
  String get settings__dialog__conn_gdrive__subtitle =>
      'Votre Google Drive est déjà connecté ! Souhaitez-vous vous reconnecter ?\n\nPour éviter toute perte de données, assurez-vous d\'utiliser le même compte qu\'auparavant.';

  @override
  String get settings__drive__connected => 'Connecté';

  @override
  String get settings__drive__loading => 'Chargement...';

  @override
  String get settings__drive__authorizing => 'Autorisation...';

  @override
  String get settings__drive__connect => 'Connecter';

  @override
  String get settings__drive__disconnected => 'Déconnecté';

  @override
  String get settings__text__cloud__title => 'Cloud Drive';

  @override
  String get settings__text__cloud__name => 'Google Drive';

  @override
  String get settings__text__gdrive__error =>
      'Google Drive n\'est pas connecté. La synchronisation des fichiers et médias est actuellement désactivée.';

  @override
  String get settings__text__gdrive__info =>
      'Vos fichiers et médias sont synchronisés en toute sécurité entre les appareils via des fournisseurs de cloud pris en charge, assurant la protection de votre confidentialité. Lorsque plusieurs fournisseurs sont connectés, vous pouvez choisir le stockage par défaut pour les nouveaux téléversements.';

  @override
  String get settings__drive__default_tooltip =>
      'Stockage par défaut pour les téléversements';

  @override
  String get settings__drive__set_default => 'Définir par défaut';

  @override
  String get settings__tile__other_cloud__title =>
      'Configurer un autre cloud drive';

  @override
  String get settings__text__webdav__name => 'WebDAV';

  @override
  String get settings__text__webdav__info =>
      'Connectez votre serveur WebDAV (Nextcloud, ownCloud, NAS Synology, etc.) pour stocker et synchroniser vos fichiers et pièces jointes multimédias.';

  @override
  String get settings__dialog__webdav__title => 'Stockage WebDAV';

  @override
  String get settings__dialog__webdav__preset_provider =>
      'Fournisseur prédéfini';

  @override
  String get settings__dialog__webdav__server_url => 'URL du serveur';

  @override
  String get settings__dialog__webdav__server_url_hint =>
      'https://cloud.example.com/remote.php/dav/files/username/';

  @override
  String get settings__dialog__webdav__username => 'Nom d\'utilisateur';

  @override
  String get settings__dialog__webdav__password =>
      'Mot de passe / Mot de passe d\'application';

  @override
  String get settings__dialog__webdav__base_path =>
      'Chemin du dossier de stockage';

  @override
  String get settings__dialog__webdav__base_path_helper =>
      'Le chemin du dossier ne peut pas être modifié après la configuration. Pour le modifier, déconnectez-vous d\'abord.';

  @override
  String get settings__dialog__webdav__advanced => 'Avancé';

  @override
  String get settings__dialog__webdav__self_signed =>
      'Autoriser les certificats auto-signés / non sécurisés';

  @override
  String get settings__dialog__webdav__auto_clean =>
      'Nettoyer automatiquement les fichiers inactifs après 30 jours';

  @override
  String get settings__dialog__webdav__auto_clean_subtitle =>
      'Puisque les identifiants WebDAV restent privés sur votre appareil, les fichiers distants ne sont pas supprimés par le nettoyage du cloud. Lorsqu\'il est activé, les fichiers multimédias dont la dernière modification remonte à plus de 30 jours seront supprimés de votre serveur WebDAV. Les clips dans les collections ou verrouillés sont toujours protégés.';

  @override
  String get settings__dialog__webdav__test_conn => 'Tester la connexion';

  @override
  String get settings__dialog__webdav__testing =>
      'Test de la connexion en cours...';

  @override
  String get settings__dialog__webdav__test_success => 'Connexion réussie !';

  @override
  String get settings__dialog__webdav__disconnect => 'Déconnecter';

  @override
  String get settings__dialog__webdav__save => 'Enregistrer & Connecter';

  @override
  String get settings__dialog__webdav__reconnect_title => 'Paramètres WebDAV';

  @override
  String get settings__dialog__webdav__reconnect_subtitle =>
      'WebDAV est déjà connecté. Mettre à jour les paramètres ou déconnecter ?';

  @override
  String get settings__dialog__webdav__url_required =>
      'Veuillez entrer une URL de serveur WebDAV valide';

  @override
  String get settings__dialog__webdav__username_required =>
      'Veuillez entrer un nom d\'utilisateur';

  @override
  String get settings__dialog__webdav__password_required =>
      'Veuillez entrer un mot de passe ou un jeton d\'application';

  @override
  String get settings__app_lock__title => 'Verrouillage de l\'app';

  @override
  String get settings__app_lock__tile__subtitle =>
      'Exiger une biométrie ou un code PIN pour accéder au presse-papiers';

  @override
  String get settings__app_lock__no_biometrics =>
      'Aucune biométrie ou authentification appareil trouvée. Configurez d\'abord un code PIN ou une biométrie dans les paramètres de votre appareil.';

  @override
  String get settings__app_lock__lock_after__title => 'Verrouiller après';

  @override
  String get settings__app_lock__lock_after__subtitle =>
      'Verrouiller automatiquement quand l\'app passe en arrière-plan';

  @override
  String get settings__app_lock__timeout__immediately => 'Immédiatement';

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
  String get app_lock__screen__locked => 'Verrouillé';

  @override
  String get app_lock__screen__unlock => 'Déverrouiller';

  @override
  String get settings__lan__title => 'Réseau local';

  @override
  String get settings__lan__service_inactive =>
      'Démarrez le service en arrière-plan pour utiliser la sync LAN';

  @override
  String get settings__lan__subtitle__disabled =>
      'Synchronisez instantanément le presse-papiers avec les appareils à proximité';

  @override
  String get settings__lan__subtitle__mobile =>
      'Le service en arrière-plan recherche des appareils à proximité';

  @override
  String get settings__lan__searching => 'Recherche d\'appareils…';

  @override
  String settings__lan__devices_found({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'appareils trouvés',
      one: 'appareil trouvé',
    );
    return '$count $_temp0 sur le réseau';
  }

  @override
  String get settings__auto_write__title =>
      'Écriture automatique à la réception';

  @override
  String get settings__auto_write__subtitle =>
      'Copier automatiquement les clips entrants dans le presse-papiers';

  @override
  String get settings__sync__manage_devices__title =>
      'Gérer les appareils de synchronisation';

  @override
  String get settings__sync__manage_devices__subtitle =>
      'Afficher les appareils actifs et supprimer des appareils de l\'accès à la synchronisation.';

  @override
  String get settings__lan_mesh__app_bar_title => 'Réseau local';

  @override
  String get settings__lan_mesh__unknown_device => 'Appareil inconnu';

  @override
  String get settings__lan_mesh__searching =>
      'Recherche d\'appareils sur le réseau…';

  @override
  String get settings__lan_mesh__reachable => 'Joignable';

  @override
  String get settings__lan_mesh__unreachable => 'Injoignable';

  @override
  String get settings__lan_mesh__disabled_banner =>
      'La sync LAN est désactivée. Activez-la dans les Paramètres pour découvrir les appareils à proximité.';

  @override
  String get settings__device_mgmt__app_bar_title =>
      'Gérer les appareils de synchronisation';

  @override
  String get settings__device_mgmt__dialog_title =>
      'Supprimer l\'accès à la synchronisation';

  @override
  String get settings__device_mgmt__dialog_cancel => 'Annuler';

  @override
  String get settings__device_mgmt__dialog_remove => 'Supprimer';

  @override
  String get settings__device_mgmt__revoke_failed =>
      'Échec de la suppression de l\'accès à la synchronisation.';

  @override
  String get settings__device_mgmt__active_now => 'Actif maintenant';

  @override
  String settings__device_mgmt__today_at({required String time}) {
    return 'Aujourd\'hui à $time';
  }

  @override
  String settings__device_mgmt__days_ago({required int count}) {
    return 'Il y a ${count}j';
  }

  @override
  String get settings__device_mgmt__load_failed =>
      'Échec du chargement des appareils.';

  @override
  String get settings__device_mgmt__retry => 'Réessayer';

  @override
  String get settings__device_mgmt__empty =>
      'Aucun appareil de synchronisation trouvé.';

  @override
  String get settings__device_mgmt__max_limit_tooltip =>
      'Nombre maximum d\'appareils que vous pouvez synchroniser avec votre abonnement actuel.';

  @override
  String settings__device_mgmt__max_limit_label({required int count}) {
    return 'Limite max • $count';
  }

  @override
  String get settings__device_mgmt__active_count_tooltip =>
      'Nombre d\'appareils actuellement actifs.';

  @override
  String settings__device_mgmt__active_count_label({required int count}) {
    return 'Actifs • $count';
  }

  @override
  String settings__device_card__last_seen({required String time}) {
    return 'Vu pour la dernière fois: $time';
  }

  @override
  String get settings__device_card__revoke => 'Révoquer';

  @override
  String get device_mgmt_verification_failed =>
      'Impossible de vérifier l\'accès à l\'appareil de synchronisation pour le moment. Veuillez vérifier votre connexion Internet et réessayer.';

  @override
  String get device_mgmt_limit_reached =>
      'La synchronisation est désactivée sur cet appareil car la limite d\'appareils de votre abonnement est atteinte. Supprimez un autre appareil dans Paramètres > Synchronisation > Gérer les appareils de synchronisation.';

  @override
  String get custom_er__nav__1 => 'Application';

  @override
  String get custom_er__nav__2 => 'Titre de la fenêtre';

  @override
  String get custom_er__nav__3 => 'Url';

  @override
  String get custom_er__nav__4 => 'Modèle de texte';

  @override
  String get custom_er__text__not_supported =>
      'Cette exclusion n\'est pas encore supportée';

  @override
  String get custom_er__tile__add_app => 'Ajouter une application';

  @override
  String get custom_er__text__no_app =>
      'Aucune application personnalisée exclue pour le moment';

  @override
  String get custom_er__button__remove_app => 'Retirer cette application';

  @override
  String get custom_er__tile__pattern =>
      'Éviter la copie lorsque le contenu copié correspond à ces modèles';

  @override
  String get custom_er__text__no_pattern => 'Aucun modèle personnalisé exclu';

  @override
  String get custom_er__button__remove_pattern => 'Retirer ce modèle';

  @override
  String get custom_er__tile__url =>
      'Empêcher la copie depuis le site web correspondant à ces segments d\'URL.';

  @override
  String get custom_er__input__url_hint =>
      'Saisissez une URL ou une partie d\'une URL ici.';

  @override
  String get custom_er__text__no_url => 'Aucune URL personnalisée exclue';

  @override
  String get custom_er__button__remove_url => 'Retirer cette URL';

  @override
  String get custom_er__tile__title =>
      'Empêcher la copie d\'une application ou d\'un site web lorsque le titre de la fenêtre correspond.';

  @override
  String get custom_er__text__no_title => 'Aucun titre personnalisé exclu';

  @override
  String get custom_er__button__remove_title => 'Retirer ce titre';

  @override
  String get about__tile__discord => 'Discord • Connexion';

  @override
  String get about__tile__youtube => 'YouTube • Tutoriel';

  @override
  String get about__tile__read_tut => 'Lire • Tutoriel';

  @override
  String get about__tile__github => 'Github • Open source';

  @override
  String get about__tile__website => 'EntilityStudio • Site web';

  @override
  String get about__tile__support => 'Support';

  @override
  String get abc_title => 'Presse-papiers en arrière-plan';

  @override
  String get abc__tile__subtitle => 'Écoutez le presse-papiers en arrière-plan';

  @override
  String get abc__tip__why_title =>
      'Pourquoi ces autorisations sont-elles nécessaires ?';

  @override
  String get abc__tip__why_subtitle =>
      'Ces autorisations garantissent que CopyCat fonctionne correctement en arrière-plan, permettant de détecter le contenu copié et de vous offrir une expérience fluide sans interruptions.';

  @override
  String get abc__heading__req_perm => 'Autorisations requises';

  @override
  String get abc__tile__notification_title => 'Accès aux notifications';

  @override
  String get abc__tile__notification_subtitle =>
      'Affiche une notification persistante pour vous informer que CopyCat fonctionne en arrière-plan, garantissant transparence et confidentialité.';

  @override
  String get abc__tile__battery_opt_title => 'Optimisation de la batterie';

  @override
  String get abc__tile__battery_opt_subtitle =>
      'Empêche le système d\'arrêter CopyCat lorsqu\'il fonctionne en arrière-plan, garantissant une expérience fluide.';

  @override
  String get abc__tile__overlay_title => 'Autorisation de superposition';

  @override
  String get abc__tile__overlay_subtitle =>
      'Permet à CopyCat de lire le presse-papiers en ouvrant brièvement une fenêtre transparente au-dessus de l\'écran et de la fermer immédiatement après.';

  @override
  String get abc__tile__acc_title => 'Service d\'accessibilité';

  @override
  String get abc__tile__acc_subtitle =>
      'Démarre l\'écouteur en arrière-plan de CopyCat pour détecter lorsque vous copiez quelque chose et assure le redémarrage automatique du service après un redémarrage.';

  @override
  String get abc__ack__ready => 'Configuration prête à être configurée.';

  @override
  String get abc__ack__preparing =>
      'Préparation de la configuration, veuillez patienter...';

  @override
  String get abc__perm_alert_open_setting__button => 'Ouvrir les paramètres';

  @override
  String get abc__overlay_perm_alert__title => 'Permission de superposition';

  @override
  String get abc__overlay_perm_alert__subtitle =>
      'CopyCat Clipboard a besoin de la permission \'Dessiner par-dessus d\'autres applications\' pour lire le contenu du presse-papiers en arrière-plan.';

  @override
  String get abc__overlay_perm_alert__p1_prefix => 'Cette permission est ';

  @override
  String get abc__overlay_perm_alert__p1_bold =>
      'utilisée uniquement pour la détection du presse-papiers';

  @override
  String get abc__overlay_perm_alert__p1_suffix =>
      ' lorsque vous copiez quelque chose en arrière-plan.';

  @override
  String get abc__overlay_perm_alert__p2_prefix =>
      'Lorsqu\'elle est activée, CopyCat ';

  @override
  String get abc__overlay_perm_alert__p2_bold =>
      'crée une fenêtre transparente de 0 pixel';

  @override
  String get abc__overlay_perm_alert__p2_suffix =>
      ' pour amener brièvement l\'application au premier plan et lire les données du presse-papiers.';

  @override
  String get abc__overlay_perm_alert__p3_prefix => 'L\'application ';

  @override
  String get abc__overlay_perm_alert__p3_bold => 'n\'affiche rien';

  @override
  String get abc__overlay_perm_alert__p3_suffix =>
      ' sur votre écran pendant ce processus.';

  @override
  String get abc__overlay_perm_alert__p4_prefix =>
      'Sur certains appareils, le système peut afficher un message toast ';

  @override
  String get abc__overlay_perm_alert__p4_bold =>
      '\'CopyCat a collé depuis votre presse-papiers\'';

  @override
  String get abc__overlay_perm_alert__p4_suffix =>
      ' lorsque CopyCat lit le contenu de votre presse-papiers.';

  @override
  String get abc__overlay_perm_alert__agree =>
      'En accordant cette permission, vous acceptez l\'utilisation décrite ci-dessus.';

  @override
  String get abc__accessibility_perm_alert__title =>
      'Permission d\'accessibilité';

  @override
  String get abc__accessibility_perm_alert__subtitle =>
      'CopyCat Clipboard nécessite le Service d\'Accessibilité pour fonctionner en arrière-plan et détecter et synchroniser le presse-papiers en temps réel.';

  @override
  String get abc__accessibility_perm_alert__p1_prefix => 'Ce service est ';

  @override
  String get abc__accessibility_perm_alert__p1_bold => 'utilisé uniquement';

  @override
  String get abc__accessibility_perm_alert__p1_suffix =>
      ' pour détecter le contenu du presse-papiers et le synchroniser entre les appareils lorsqu\'il est activé.';

  @override
  String get abc__accessibility_perm_alert__p2_prefix => 'Vous pouvez ';

  @override
  String get abc__accessibility_perm_alert__p2_bold =>
      'exclure des applications spécifiques';

  @override
  String get abc__accessibility_perm_alert__p2_suffix =>
      ' en utilisant la fonctionnalité de Règles d\'Exclusion.';

  @override
  String get abc__accessibility_perm_alert__p3_prefix => 'L\'application ';

  @override
  String get abc__accessibility_perm_alert__p3_bold =>
      'n\'accède à aucune autre donnée';

  @override
  String get abc__accessibility_perm_alert__p3_suffix =>
      ' au-delà du contenu du presse-papiers.';

  @override
  String get abc__accessibility_perm_alert__p4_prefix =>
      'Les données du presse-papiers ';

  @override
  String get abc__accessibility_perm_alert__p4_bold =>
      'ne sont pas partagées à l\'extérieur';

  @override
  String get abc__accessibility_perm_alert__p4_suffix =>
      ' et restent privées sur vos appareils.';

  @override
  String get abc__accessibility_perm_alert__p5_prefix =>
      'Les données du presse-papiers ';

  @override
  String get abc__accessibility_perm_alert__p5_bold =>
      'sont chiffrées de bout en bout';

  @override
  String get abc__accessibility_perm_alert__p5_suffix =>
      ' (si activé) en transit et au repos, garantissant la confidentialité entre les appareils.';

  @override
  String get abc__accessibility_perm_alert__agree =>
      'En activant le Service d\'Accessibilité, vous reconnaissez et acceptez les termes ci-dessus.';

  @override
  String get abc__other_setting__title => 'Autres paramètres';

  @override
  String get abc__tile__two_way_sync__title =>
      'Synchronisation bidirectionnelle';

  @override
  String abc__tile__two_way_sync__subtitle({required String warning}) {
    return 'Maintient votre presse-papiers synchronisé instantanément entre vos appareils.\n$warning';
  }

  @override
  String get abc__tile__two_way_sync__realtime_required =>
      '⚠️ Le mode temps réel est requis.';

  @override
  String get abc__ack__detection_mode_cleared => 'Mode de détection effacé';

  @override
  String get abc__ack__detection_mode_updated => 'Mode de détection mis à jour';

  @override
  String abc__ack__detection_mode_update_failed({required String message}) {
    return 'Échec de la mise à jour du mode de détection : $message';
  }

  @override
  String get abc__detection_mode__title => 'Mode de détection';

  @override
  String get abc__detection_mode__subtitle__enabled =>
      'Choisissez comment CopyCat détecte les actions de copie dans d\'autres applications. CopyCat reste inactif jusqu\'à ce que vous choisissiez un mode.';

  @override
  String get abc__detection_mode__subtitle__disabled =>
      'Activez d\'abord le service d\'accessibilité, puis choisissez un mode de détection.';

  @override
  String get abc__detection_mode__mode_1 => 'Efficace';

  @override
  String get abc__detection_mode__mode_2 => 'Compatibilité maximale';

  @override
  String get abc__network__header => 'Réseau';

  @override
  String current_time__local({required String time}) {
    return 'Local : $time';
  }

  @override
  String current_time__utc({required String time}) {
    return 'UTC : $time';
  }

  @override
  String encrypted_stat__summary({required int count}) {
    return 'Vous avez actuellement $count clips chiffrés inaccessibles.';
  }

  @override
  String get encrypted_stat__all_decrypted =>
      '🥳 Félicitations ! Tous vos clips ont été déchiffrés localement avec succès, il n\'est donc pas nécessaire de reconstruire la base de données.';

  @override
  String get encrypted_stat__rebuild_database =>
      'Reconstruire la base de données';

  @override
  String tray__tooltip__paused_till({required String time}) {
    return 'CopyCat Clipboard - En pause jusqu\'à $time';
  }

  @override
  String get tray__menu__resume_copycat => 'Reprendre';

  @override
  String get tray__menu__pause_copycat => 'Mettre en pause';

  @override
  String get tray__menu__paste_stack => 'Paste Stack';

  @override
  String get tray__menu__restart_app => 'Redémarrer';

  @override
  String get tray__dialog__quit__subtitle =>
      'Voulez-vous vraiment quitter l\'application ?';

  @override
  String get splash__checking_authentication =>
      'Vérification de l\'authentification...';

  @override
  String paste_stack__title({required int count}) {
    return 'Paste Stack • $count';
  }

  @override
  String get paste_stack__reorder_hint =>
      'Vous pouvez faire glisser les éléments pour les réorganiser.';

  @override
  String get paste_stack__reverse_tooltip => 'Inverser la pile';

  @override
  String paste_stack__limit_note({required int count}) {
    return 'Vous avez une limite de $count éléments';
  }

  @override
  String get multi_paste__title => 'Configuration du collage multiple';

  @override
  String get multi_paste__subtitle =>
      'Contrôlez la fusion et le rythme des clips sélectionnés.';

  @override
  String get multi_paste__stat__selected => 'Sélectionnés';

  @override
  String get multi_paste__stat__text => 'Texte';

  @override
  String get multi_paste__stat__non_text => 'Contenu non textuel';

  @override
  String get multi_paste__merge__title =>
      'Fusionner les clips texte consécutifs';

  @override
  String get multi_paste__merge__subtitle =>
      'Les clips texte fusionnent jusqu\'à ce qu\'un clip non textuel interrompe la séquence.';

  @override
  String get multi_paste__separator__title => 'Séparateur';

  @override
  String get multi_paste__separator__new_line => 'Nouvelle ligne';

  @override
  String get multi_paste__separator__space => 'Espace';

  @override
  String get multi_paste__separator__custom => 'Personnalisé';

  @override
  String get multi_paste__separator__custom_label => 'Séparateur personnalisé';

  @override
  String get multi_paste__separator__custom_hint =>
      'Prend en charge les séquences d\'échappement comme \\n et \\t';

  @override
  String get multi_paste__pacing__title => 'Temporisation du collage';

  @override
  String get multi_paste__pacing__subtitle =>
      'Augmentez le délai si l\'application cible manque des événements de collage.';

  @override
  String get multi_paste__wait_between_pastes => 'Délai entre les collages';

  @override
  String get multi_paste__validation__wait_positive =>
      'Le temps d\'attente doit être un nombre positif.';

  @override
  String get multi_paste__validation__custom_separator_required =>
      'Veuillez saisir un séparateur personnalisé.';

  @override
  String get settings__tile__backup_restore__title =>
      'Sauvegarde et restauration';

  @override
  String get settings__tile__backup_restore__subtitle =>
      'Créez des sauvegardes .ccbkup et restaurez-les localement';

  @override
  String get settings__switch__rich_data_capture__title =>
      'Capture de données enrichies';

  @override
  String get settings__switch__rich_data_capture__subtitle =>
      'Conservez la mise en forme lors des copier-coller entre applications.';

  @override
  String get settings__decrypt__title => 'Déchiffrement du presse-papiers';

  @override
  String settings__decrypt__count({required int count}) {
    return 'Vous avez actuellement $count clips chiffrés en local.';
  }

  @override
  String settings__decrypt__progress({
    required int decrypted,
    required int total,
  }) {
    return 'Déchiffrés : $decrypted sur $total clips.';
  }

  @override
  String get settings__decrypt__warning =>
      '⚠️ Veuillez garder cet écran ouvert pendant ce processus pour éviter toute corruption ou incohérence des données.';

  @override
  String get not_found__title => 'Page introuvable';

  @override
  String get not_found__subtitle =>
      'La page que vous recherchez est introuvable.';

  @override
  String get not_found__go_home => 'Aller à l\'accueil';

  @override
  String get backup_restore__dialog__save_as =>
      'Enregistrer la sauvegarde sous';

  @override
  String get backup_restore__busy__creating => 'Création de la sauvegarde...';

  @override
  String get backup_restore__error__encryption_unavailable =>
      'Le chiffrement est activé mais indisponible actuellement. Veuillez déverrouiller l\'E2EE et réessayer.';

  @override
  String backup_restore__snackbar__saved({required String outputPath}) {
    return 'Sauvegarde enregistrée dans $outputPath';
  }

  @override
  String backup_restore__snackbar__create_failed({required String message}) {
    return 'Échec de la sauvegarde : $message';
  }

  @override
  String get backup_restore__dialog__select_file =>
      'Sélectionner un fichier de sauvegarde';

  @override
  String get backup_restore__dialog__restore_title =>
      'Restaurer une sauvegarde';

  @override
  String get backup_restore__dialog__restore_subtitle =>
      'Saisissez le mot de passe si cette sauvegarde est protégée.';

  @override
  String get backup_restore__dialog__restore_action => 'Restaurer';

  @override
  String get backup_restore__busy__restoring =>
      'Restauration de la sauvegarde...';

  @override
  String backup_restore__snackbar__restore_completed({
    required int clips,
    required int collections,
  }) {
    return 'Restauration terminée : $clips clips, $collections collections.';
  }

  @override
  String backup_restore__snackbar__restore_failed({required String message}) {
    return 'Échec de la restauration : $message';
  }

  @override
  String get backup_restore__error__select_clip_type =>
      'Sélectionnez au moins un type de clip.';

  @override
  String get backup_restore__error__from_after_to =>
      'La date de début doit être antérieure à la date de fin.';

  @override
  String get backup_restore__dialog__options__description =>
      'Choisissez ce qu\'il faut inclure dans cette archive de sauvegarde.';

  @override
  String get backup_restore__section__clip_types => 'Types de clips';

  @override
  String get backup_restore__section__cached_files => 'Fichiers en cache';

  @override
  String get backup_restore__input__max_cached_file_size =>
      'Taille maximale des fichiers en cache (Mo)';

  @override
  String get backup_restore__input__max_cached_file_size__hint =>
      'Facultatif, ex. 50';

  @override
  String get backup_restore__error__positive_number =>
      'Saisissez un nombre positif.';

  @override
  String get backup_restore__text__select_file_media_for_cache_limit =>
      'Sélectionnez les types de clip Fichier ou Média pour configurer une taille maximale des fichiers en cache.';

  @override
  String get backup_restore__section__date_range => 'Plage de dates';

  @override
  String get backup_restore__from_date => 'Date de début';

  @override
  String get backup_restore__to_date => 'Date de fin';

  @override
  String get backup_restore__no_minimum_date => 'Aucune date minimale';

  @override
  String get backup_restore__no_maximum_date => 'Aucune date maximale';

  @override
  String get backup_restore__clear_date_filter => 'Effacer le filtre de date';

  @override
  String get backup_restore__section__security => 'Sécurité';

  @override
  String get backup_restore__toggle__password_protect =>
      'Protéger la sauvegarde avec un mot de passe';

  @override
  String get backup_restore__input__password => 'Mot de passe';

  @override
  String get backup_restore__input__password__hint => 'Au moins 6 caractères';

  @override
  String get backup_restore__error__password_min_length =>
      'Le mot de passe doit comporter au moins 6 caractères.';

  @override
  String get backup_restore__dialog__create_manual_title =>
      'Créer une sauvegarde manuelle';

  @override
  String get backup_restore__appbar__title => 'Sauvegarde et restauration';

  @override
  String get backup_restore__card__title =>
      'Sauvegarde et restauration manuelles';

  @override
  String get backup_restore__card__subtitle =>
      'Créez des archives .ccbkup locales avec protection optionnelle par mot de passe et restaurez-les localement avec une déduplication best-effort.';

  @override
  String get backup_restore__actions__title => 'Actions';

  @override
  String get backup_restore__button__create => 'Créer une sauvegarde';

  @override
  String get backup_restore__button__restore => 'Restaurer une sauvegarde';

  @override
  String get backup_restore__snapshot__backup_title =>
      'Dernier résumé de sauvegarde';

  @override
  String get backup_restore__snapshot__restore_title =>
      'Dernier instantané de restauration';

  @override
  String get backup_restore__snapshot__restore_subtitle =>
      'Déduplication best-effort et rapport d\'intégrité';

  @override
  String get backup_restore__empty_session =>
      'Aucune sauvegarde ni restauration n\'a encore été exécutée dans cette session.';

  @override
  String get backup_restore__label__collections => 'Collections';

  @override
  String get backup_restore__label__clips => 'Clips';

  @override
  String get backup_restore__label__files_included => 'Fichiers inclus';

  @override
  String get backup_restore__label__files_missing => 'Fichiers manquants';

  @override
  String get backup_restore__label__files_skipped_by_size =>
      'Ignorés pour cause de taille';

  @override
  String get backup_restore__label__encrypted_clips => 'Clips chiffrés';

  @override
  String get backup_restore__label__collections_restored =>
      'Collections restaurées';

  @override
  String get backup_restore__label__collections_duplicates =>
      'Collections en doublon';

  @override
  String get backup_restore__label__collections_failed =>
      'Collections en échec';

  @override
  String get backup_restore__label__clips_restored => 'Clips restaurés';

  @override
  String get backup_restore__label__clips_duplicates => 'Clips en doublon';

  @override
  String get backup_restore__label__clips_failed => 'Clips en échec';

  @override
  String get backup_restore__label__attachments_restored =>
      'Pièces jointes restaurées';

  @override
  String get backup_restore__label__attachments_missing =>
      'Pièces jointes manquantes';

  @override
  String get backup_restore__label__attachments_failed =>
      'Pièces jointes en échec';

  @override
  String get backup_restore__label__corrupt_entries => 'Entrées corrompues';

  @override
  String get subscription__loading => 'Chargement...';

  @override
  String get review__dialog__title => 'CopyCat vous plaît jusqu\'ici ?';

  @override
  String get review__dialog__message =>
      'Une note rapide aide davantage de personnes à découvrir CopyCat et permet de continuer à proposer de nouvelles fonctionnalités.';

  @override
  String get review__dialog__never => 'Jamais';

  @override
  String get review__dialog__remind_later => 'Me le rappeler dans 7 jours';

  @override
  String get review__dialog__rate_now => 'Noter maintenant';

  @override
  String get settings__tile__review__title => 'Noter CopyCat';

  @override
  String get settings__tile__review__subtitle =>
      'Laisser un avis sur l\'App Store';

  @override
  String get collections__read_only__banner =>
      'Lecture seule avec votre forfait actuel. Passez à une offre supérieure pour modifier cette collection.';

  @override
  String get collections__read_only__toast =>
      'Cette collection est en lecture seule avec votre forfait actuel. Passez à une offre supérieure pour modifier toutes les collections.';

  @override
  String get collections__read_only__upgrade_action => 'Mettre à niveau';

  @override
  String get collections__locked_section__label => 'Verrouillé';

  @override
  String get transform__section__text_core => 'Texte de base';

  @override
  String get transform__section__text_utilities => 'Outils texte';

  @override
  String get transform__section__struct => 'Structure';

  @override
  String get transform__section__urls => 'URLs';

  @override
  String get transform__section__colors => 'Couleurs';

  @override
  String get transform__section__emails_phones => 'E-mails / Téléphones';

  @override
  String get transform__section__structured_text => 'Texte structuré';

  @override
  String get transform__label__uppercase => 'Majuscules';

  @override
  String get transform__label__lowercase => 'Minuscules';

  @override
  String get transform__label__capitalize => 'Mettre en majuscule';

  @override
  String get transform__label__trim_whitespace => 'Supprimer les espaces';

  @override
  String get transform__label__remove_line_breaks =>
      'Supprimer les sauts de ligne';

  @override
  String get transform__label__normalize_spaces => 'Normaliser les espaces';

  @override
  String get transform__label__reverse_text => 'Inverser le texte';

  @override
  String get transform__label__deduplicate_lines => 'Supprimer les doublons';

  @override
  String get transform__label__json_prettify => 'JSON → formater';

  @override
  String get transform__label__json_minify => 'JSON → minifier';

  @override
  String get transform__label__url_encode => 'Encoder l\'URL';

  @override
  String get transform__label__url_decode => 'Décoder l\'URL';

  @override
  String get transform__label__base64_encode => 'Encoder en Base64';

  @override
  String get transform__label__base64_decode => 'Décoder en Base64';

  @override
  String get transform__label__remove_tracking_params =>
      'Supprimer les traceurs';

  @override
  String get transform__label__extract_domain => 'Extraire le domaine';

  @override
  String get transform__label__hex_to_rgb => 'HEX → RGB';

  @override
  String get transform__label__rgb_to_hex => 'RGB → HEX';

  @override
  String get transform__label__hex_to_hsl => 'HEX → HSL';

  @override
  String get transform__label__copy_cleaned => 'Copier nettoyé';

  @override
  String get transform__label__extract_emails => 'Extraire les e-mails';

  @override
  String get transform__label__extract_urls => 'Extraire les URLs';

  @override
  String get transform__label__extract_numbers => 'Extraire les nombres';

  @override
  String get transfer__scan_qr => 'Scanner le QR code';

  @override
  String get transfer__show_qr => 'Afficher le QR code';

  @override
  String get transfer__enter_passcode => 'Entrer le code d\'accès';

  @override
  String get transfer__six_digit_passcode => 'Code d\'accès à 6 chiffres';

  @override
  String get transfer__securely_transfer_via_qr =>
      'Transférer en toute sécurité vers un appareil proche via QR (Recommandé)';

  @override
  String get transfer__nearby_device => 'Transférer vers un appareil proche';

  @override
  String get transfer__scan_qr_and_enter_passcode =>
      'Scannez ce QR code sur votre autre appareil, puis entrez le code d\'accès.';

  @override
  String get transfer__enter_passcode_on_other_device =>
      'Entrez ce code d\'accès sur l\'autre appareil.';

  @override
  String get transfer__show_passcode => 'Afficher le code d\'accès';

  @override
  String get transfer__device_has_no_camera_use_file_import =>
      'Cet appareil n\'a pas de caméra. Utilisez plutôt l\'option d\'importation de fichier.';

  @override
  String get transfer__scan_qr_from_other_device =>
      'Scannez le QR code depuis votre autre appareil.';

  @override
  String get settings__personal_drive__title => 'Stockage Personnel';

  @override
  String get settings__personal_drive__subtitle =>
      'Synchronisez vos clips de fichiers vers votre cloud personnel pour une sauvegarde sécurisée et un accès multi-appareils.';
}
