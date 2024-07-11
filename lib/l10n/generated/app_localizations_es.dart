import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'CopyCat';

  @override
  String get en => 'Inglés';

  @override
  String get es => 'Español';

  @override
  String get fr => 'Francés';

  @override
  String get de => 'Alemán';

  @override
  String get language => 'Idioma';

  @override
  String get enterEmail => 'Introduce tu correo electrónico';

  @override
  String get validEmailError =>
      'Por favor, introduce una dirección de correo electrónico válida';

  @override
  String get enterPassword => 'Introduce tu contraseña';

  @override
  String get passwordLengthError =>
      'Por favor, introduce una contraseña que tenga al menos 6 caracteres';

  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta? Regístrate';

  @override
  String get haveAccount => '¿Ya tienes una cuenta? Inicia sesión';

  @override
  String get sendPasswordReset =>
      'Enviar correo de restablecimiento de contraseña';

  @override
  String get backToSignIn => 'Volver a iniciar sesión';

  @override
  String get updatePassword => 'Actualizar Contraseña';

  @override
  String get unexpectedError => 'Ocurrió un error inesperado';

  @override
  String get passwordResetSent =>
      'El correo de restablecimiento de contraseña ha sido enviado';

  @override
  String get collections => 'Colecciones';

  @override
  String get collection => 'Colección';

  @override
  String get createCollection => 'Crear Colección';

  @override
  String get editCollection => 'Editar Colección';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get edit => 'Editar';

  @override
  String get description => 'Descripción';

  @override
  String get noDescription => 'Sin descripción';

  @override
  String get noResultsWereFound => 'No se encontraron resultados';

  @override
  String get driveSetupDone => 'Configuración de Drive Completa 🥳';

  @override
  String get pleaseWaitWhileWeSetupSyncing =>
      'Por favor espera mientras configuramos\nla sincronización';

  @override
  String get driveSetupMayTakeFewMin =>
      'Esto puede tardar aproximadamente un minuto en completarse.\n(Por favor, no cierres la aplicación)';

  @override
  String get refreshNow => 'Actualizar ahora';

  @override
  String newUpdates(int ADDED, int UPDATED, int DELETED) {
    return 'Cambios Disponibles:\n $ADDED Agregado, $UPDATED Actualizado y $DELETED Eliminado';
  }

  @override
  String get itemDeleted => 'Elemento Eliminado';

  @override
  String get deletingFromCloud => 'Eliminando del Nube';

  @override
  String get emptyClipboard => 'Tu portapapeles está vacío';

  @override
  String get loadMore => 'Cargar más';

  @override
  String get clipboard => 'Portapapeles';

  @override
  String get search => 'Buscar';

  @override
  String get share => 'Compartir';

  @override
  String get export => 'Exportar';

  @override
  String get searchClipboard => 'Buscar en el Portapapeles';

  @override
  String get settings => 'Configuraciones';

  @override
  String get copyCatClipboard => 'CopyCat Clipboard';

  @override
  String get oneClipboardLimitlessPosibility =>
      'Un Portapapeles, Posibilidades Ilimitadas';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get preview => 'Vista previa';

  @override
  String get editDetails => 'Editar Detalles';

  @override
  String get title => 'Título';

  @override
  String get nothingHere => 'Nada aquí';

  @override
  String get downloading => 'Descargando';

  @override
  String get downloadForOffline => 'Descargando para uso sin conexión';

  @override
  String get copyToClipboard => 'Copiar al portapapeles';

  @override
  String get delete => 'Eliminar';

  @override
  String get resetYourPassword => 'Restablece tu contraseña';

  @override
  String get passwordResetSuccess => 'Contraseña restablecida con éxito';

  @override
  String get findWhateverYouLooking => 'Encuentra lo que estás buscando...';

  @override
  String get noResults => 'No se encontraron resultados.';

  @override
  String get searchInClipboard => 'Buscar en el portapapeles';

  @override
  String get basicLocal => 'Básico • Local';

  @override
  String get localSettingsDesc =>
      'Estas configuraciones son aplicables solo a este dispositivo.';

  @override
  String get theme => 'Tema';

  @override
  String get syncLocal => 'Sincronizar • Local';

  @override
  String get dontAutoCopyOver => 'No Copiar Automáticamente';

  @override
  String dontAutoCopyOverDesc(String SIZE) {
    return 'Los archivos y medios que superen un cierto tamaño ($SIZE) no se copiarán automáticamente.';
  }

  @override
  String get dontAutoUploadOver => 'No Subir Automáticamente';

  @override
  String dontAutoUploadOverDesc(String SIZE) {
    return 'Los archivos y medios que superen un cierto tamaño ($SIZE) no se subirán automáticamente.';
  }

  @override
  String get enableSync => 'Habilitar Sincronización';

  @override
  String get enableSyncDesc =>
      'Mantén tus archivos actualizados en todos los dispositivos';

  @override
  String get syncFiles => 'Sincronizar Archivos y Medios';

  @override
  String get syncFilesDesc =>
      'Mantén tus archivos y elementos multimedia actualizados en todos los dispositivos.';

  @override
  String get connected => 'Conectado';

  @override
  String get loading => 'Cargando...';

  @override
  String get authorizing => 'Autorizando...';

  @override
  String get connectNow => 'Conectar Ahora';

  @override
  String get tips => 'ⓘ Consejos';

  @override
  String get cloudStorageInfoDefault =>
      '\n\nGoogle Drive no conectado, la sincronización de archivos y medios está deshabilitada.';

  @override
  String cloudStorageInfo(String INFO) {
    return '${INFO}Tus archivos y medios se sincronizan de manera segura a través de dispositivos utilizando Google Drive para proteger tu privacidad.';
  }

  @override
  String get attentionNeeded => '⚠ ¡Atención Necesaria!';

  @override
  String get isPaused => '¿Está Pausado?';

  @override
  String isPausedDesc(String isPaused, String TILL) {
    String _temp0 = intl.Intl.selectLogic(
      isPaused,
      {
        'true': 'La copia automática no está pausada',
        'other': 'La copia automática está pausada hasta $TILL',
      },
    );
    return '$_temp0';
  }

  @override
  String get paste => 'Pegar';

  @override
  String get copy => 'Copiar';

  @override
  String get previewEdit => 'Vista Previa y Editar';

  @override
  String get pastingTheSharedContent =>
      'Pegando el contenido compartido al portapapeles';

  @override
  String get smartPaste => 'Pegar Inteligente';

  @override
  String get smartPasteDesc =>
      'Habilitar para pegar clips directamente en la última ventana enfocada.';

  @override
  String get launchAtStartup => 'Lanzar al Iniciar';

  @override
  String get launchAtStartupDesc =>
      'Habilitar para iniciar la aplicación automáticamente cuando tu dispositivo se encienda.';

  @override
  String get autoSyncInterval => 'Intervalo de Sincronización Automática';

  @override
  String autoSyncIntervalDesc(String TIME) {
    return 'El portapapeles se sincronizará automáticamente cada $TIME';
  }

  @override
  String get clipboardShortcut => 'Atajo de Portapapeles';

  @override
  String get clipboardShortcutDesc =>
      'Accede fácilmente al portapapeles en cualquier lugar';

  @override
  String clipboardShortcutPreview(String KEY) {
    return 'Tecla de Atajo Actual : $KEY';
  }

  @override
  String get unassigned => 'No asignado';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get local => 'Local';

  @override
  String get uploading => 'Subiendo...';

  @override
  String get pleaseWait => 'Por favor espera...';

  @override
  String get open => 'Abrir';

  @override
  String get noCollection => 'Sin Colección';

  @override
  String get chooseCollection => 'Elegir Colección';

  @override
  String get changeCollection => 'Cambiar Colección';

  @override
  String get removeFromCollection => 'Eliminar de la Colección';

  @override
  String get compactMode => 'Modo Compacto';

  @override
  String createACollection(int LEFT) {
    return 'Crear una nueva colección ( $LEFT restantes )';
  }

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get logoutMessage =>
      '⚠️ ADVERTENCIA ⚠️\n\nCerrar sesión eliminará los cambios no sincronizados en la base de datos local. ¿Estás seguro de que quieres proceder?';

  @override
  String get loggingYouOut => '¡Cerrando sesión! Por favor espera...';

  @override
  String get logoutSuccess => 'Sesión cerrada con éxito';

  @override
  String get internetConnected => 'Internet Conectado';

  @override
  String get internetDisconnected => 'Internet Desconectado';

  @override
  String get noCollectionFound => 'No se encontró ninguna colección';

  @override
  String get pinToTop => 'Fijar al principio';

  @override
  String get done => 'Hecho';

  @override
  String get failed => 'Fallido';

  @override
  String get syncNow => 'Sincronizar Ahora';

  @override
  String get syncNotAvailable => 'Sincronización No Disponible';

  @override
  String get checkingForRecord => 'Buscando Registros';

  @override
  String get sync => 'Sincronizar';

  @override
  String syncing(String PROGRESS) {
    return 'Sincronizando $PROGRESS';
  }

  @override
  String syncingCheckFailed(String MESSAGE) {
    return 'Error en la Comprobación de Sincronización: $MESSAGE';
  }

  @override
  String lastSynced(String TIMESTAMP) {
    return 'Última sincronización a las $TIMESTAMP';
  }

  @override
  String get showWindow => 'Mostrar Ventana';

  @override
  String get hideWindow => 'Ocultar Ventana';

  @override
  String get hideWindowDesc =>
      'Consejo: Usa el atajo de teclado para mostrar el portapapeles.';

  @override
  String get quit => 'Salir';

  @override
  String get quitDesc => '¿Estás seguro de que quieres salir?';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get openInBrowser => 'Abrir en el navegador';

  @override
  String get makePhoneCall => 'Hacer una llamada';

  @override
  String get selectCollection => 'Seleccionar una colección';

  @override
  String get confirm => 'Confirmar';

  @override
  String get recordKeyboardShortcut => 'Grabar atajo de teclado.';

  @override
  String get recordKeyboardShortcutDesc =>
      'Escribe tu atajo usando tu teclado y haz clic ';

  @override
  String get subscription => 'Suscripción';

  @override
  String get beta => 'PUBLIC BETA';

  @override
  String get featureListDetail =>
      'CopyCat Clipboard está actualmente en fase Beta. Mientras nos esforzamos por ofrecer una experiencia sin problemas, puede que encuentres errores ocasionales. Mantente atento a las próximas características y mejoras.';

  @override
  String get currentPlan => 'Plan Actual';

  @override
  String currentPlanLabel(String LABEL) {
    return 'Plan Actual • $LABEL';
  }

  @override
  String get included => 'Incluido';

  @override
  String get unlimitedClipboardItems => 'Elementos de Portapapeles Ilimitados';

  @override
  String get unlimitedClipboardItemsDesc =>
      'Nunca te quedes sin espacio con elementos de portapapeles ilimitados, asegurando que siempre tengas acceso a tus copias más recientes.';

  @override
  String get supportAllMajorPlatforms =>
      'Compatibilidad con todas las principales plataformas';

  @override
  String get supportAllMajorPlatformsDesc =>
      'Sincronización perfecta en todas las principales plataformas—Android, iOS, Windows, macOS y Linux—para una productividad ininterrumpida en cualquier lugar.';

  @override
  String get supportsAppleUniversalClipboard =>
      'Compatible con el portapapeles universal de Apple';

  @override
  String get supportsAppleUniversalClipboardDesc =>
      'Transfiere fácilmente el contenido del portapapeles entre tus dispositivos Apple con soporte para el Portapapeles Universal de Apple.';

  @override
  String get onDeviceStorage => 'Almacenamiento en el Dispositivo';

  @override
  String get onDeviceStorageDesc =>
      'Mantén tus datos seguros con almacenamiento en el dispositivo, asegurando que los elementos de tu portapapeles siempre estén al alcance y bajo tu control.';

  @override
  String get googleDriveIntegration => 'Integración con Google Drive';

  @override
  String get googleDriveIntegrationDesc =>
      'Almacena de forma segura archivos y medios en Google Drive, integrándose perfectamente con CopyCat Clipboard para una mejor gestión de datos.';

  @override
  String get instantSearch => 'Búsqueda Instantánea';

  @override
  String get instantSearchDesc =>
      'Encuentra lo que necesitas al instante con potentes capacidades de búsqueda instantánea, haciendo que la recuperación de elementos del portapapeles sea rápida y eficiente.';

  @override
  String get syncingUpToLast24Hours =>
      'Sincronización de hasta las Últimas 24 Horas';

  @override
  String get syncingUpToLast24HoursDesc =>
      'Accede y sincroniza tu historial del portapapeles de hasta 24 horas, asegurando que nunca pierdas copias importantes.';

  @override
  String get upTo3Collections => 'Hasta 3 Colecciones';

  @override
  String get upTo3CollectionsDesc =>
      'Organiza los elementos de tu portapapeles en hasta 3 colecciones, proporcionando una categorización simple para una mejor gestión del flujo de trabajo.';

  @override
  String get autoSyncEvery60Seconds =>
      'Sincronización Automática Cada 60 Segundos';

  @override
  String get autoSyncEvery60SecondsDesc =>
      'Disfruta de la sincronización automática de los elementos del portapapeles cada 60 segundos, manteniendo tus dispositivos actualizados sin intervención manual.';

  @override
  String get withPro => 'Con PRO ✨';

  @override
  String get withProDesc => 'Todo incluido en Gratis +';

  @override
  String get supportE2EE => 'Soporte para Cifrado de Extremo a Extremo';

  @override
  String get supportE2EEDesc =>
      'E2EE hará que todo esté cifrado para una privacidad superior.';

  @override
  String get upto50Collection => 'Hasta 50 Colecciones';

  @override
  String get upto50CollectionDesc =>
      'Organiza los elementos de tu portapapeles en hasta 50 colecciones para una gestión óptima.';

  @override
  String get syncLast720Hr => 'Sincronización de hasta las Últimas 720 Horas';

  @override
  String get syncLast720HrDesc =>
      'Disfruta de acceso extendido a tu historial del portapapeles con sincronización de los últimos 30 días.';

  @override
  String get realtimeSync => 'Sincronización en Tiempo Real';

  @override
  String get realtimeSyncDesc =>
      'Experimenta una sincronización ultrarrápida cada 5 segundos.';

  @override
  String get prioritySupport => 'Soporte Rápido y Prioritario';

  @override
  String get prioritySupportDesc =>
      'Obtén soporte rápido y prioritario como usuario PRO.';

  @override
  String get earlyAccessToNewFeature => 'Acceso Temprano a Nuevas Funciones';

  @override
  String get earlyAccessToNewFeatureDesc =>
      'Sé el primero en probar nuevas funciones y actualizaciones.';

  @override
  String get termsAgreeP1 => 'Al continuar, usted acepta los siguientes ';

  @override
  String get privacyPolicies => 'Políticas de privacidad';

  @override
  String get and => ' y ';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get termsAgreeP2 => '.';

  @override
  String get backToApp => 'Volver a la aplicación';

  @override
  String get experimental => '🧪';

  @override
  String get experimentalDescription =>
      'Esta característica es experimental y podría no funcionar como se espera.';

  @override
  String get selectAnOption => 'Seleccione una opción';

  @override
  String get advanceSecurity => 'Seguridad Avanzada';

  @override
  String get endToEndVault => 'Bóveda de Cifrado de Extremo a Extremo';

  @override
  String get accessE2eeVault => 'Acceda a la configuración de su bóveda E2EE';

  @override
  String get encryptClipboard => 'Cifrar Portapapeles';

  @override
  String get encryptClipboardDesc =>
      'Cifre el portapapeles antes de sincronizarlo con la nube.';

  @override
  String get $5Sec => '5 Seg';

  @override
  String get $15Sec => '15 Seg';

  @override
  String get $30Sec => '30 Seg';

  @override
  String get $60Sec => '60 Seg';

  @override
  String get $90Sec => '90 Seg';

  @override
  String get e2eeNotSetup => 'E2EE no está configurado aún.';

  @override
  String get settingE2eeVault => 'Configurando Bóveda E2EE';

  @override
  String get e2eeSetupWarning =>
      'Si pierde su clave E2EE y no tiene una copia de seguridad, sus datos cifrados serán permanentemente inaccesibles. Mantenga su clave segura y respaldada.';

  @override
  String get e2eeSetupDesc =>
      'Genere su clave de la Bóveda E2EE y guárdela en un lugar seguro. Necesitará esta clave para configurar otros dispositivos y acceder a su información cifrada.';

  @override
  String get generating => 'Generando...';

  @override
  String get generateKey => 'Generar Clave de la Bóveda E2EE';

  @override
  String get importE2eeKey => 'Importar Clave de la Bóveda E2EE';

  @override
  String get importE2eeInvalidKey => '⚠️ ¡La clave importada no es válida!';

  @override
  String get importE2eeDesc =>
      'Importe su clave de la Bóveda E2EE a continuación para habilitar el acceso a su información cifrada en este dispositivo. Asegúrese de que la clave esté almacenada de manera segura y no se comparta con nadie.';

  @override
  String get importing => 'Importando...';

  @override
  String get importKey => 'Importar Clave de la Bóveda E2EE';

  @override
  String get e2eeVault => 'Bóveda E2EE';

  @override
  String get e2eeExportNote =>
      'Felicidades, ha configurado con éxito el cifrado de extremo a extremo.';

  @override
  String get e2eeExportDesc =>
      'Haga clic en el botón a continuación para exportar su clave de la Bóveda E2EE.\nGuarde la clave en un lugar seguro para asegurarse de que puede configurar otros dispositivos y acceder a su información cifrada.';

  @override
  String get exportKey => 'Exportar Clave de la Bóveda E2EE';

  @override
  String get exportSuccess => '✅ Clave del cofre E2EE exportada correctamente';

  @override
  String get whatsNew => '¿Qué hay de nuevo?';

  @override
  String get feature1 => 'Portapapeles Inteligente Multiplataforma';

  @override
  String get feature1Desc =>
      'Sincroniza sin problemas el contenido de tu portapapeles en todos tus dispositivos. Ya sea texto, imágenes o archivos, accede a tu historial de portapapeles dondequiera que vayas.';

  @override
  String get feature2 => 'Historial Ilimitado con Búsqueda Instantánea';

  @override
  String get feature2Desc =>
      'Nunca pierdas los elementos copiados nuevamente. Nuestra función de historial ilimitado asegura que puedas buscar y recuperar instantáneamente cualquier elemento del portapapeles anterior.';

  @override
  String get feature3 => 'Pegado Inteligente';

  @override
  String get feature3Desc =>
      'Pega inteligentemente con sugerencias contextuales. Ahorra tiempo accediendo rápidamente al contenido adecuado para tu tarea actual.';

  @override
  String get feature4 => 'Colecciones';

  @override
  String get feature4Desc =>
      'Organiza los elementos de tu portapapeles en colecciones para un acceso y gestión fáciles. Perfecto para proyectos, investigaciones y más.';

  @override
  String get gettingStarted => 'Comenzar';

  @override
  String get howToUse => 'Cómo Usar';

  @override
  String get howToUseDesc =>
      '¿Cómo usar CopyCat? Lee nuestra documentación para comenzar.';

  @override
  String get tutorials => 'Tutoriales en Video';

  @override
  String get tutorialsDesc =>
      'Aprende a aprovechar al máximo CopyCat con nuestros tutoriales en video paso a paso.';

  @override
  String get learnAboutFeatures =>
      'Conoce todas las funciones que CopyCat tiene para ofrecer.';

  @override
  String get learn => 'Aprender';

  @override
  String get upgrade => 'Actualizar';

  @override
  String trialTill(String till) {
    return 'Prueba hasta $till';
  }

  @override
  String expiredPlan(String planName) {
    return '$planName • Expirado';
  }

  @override
  String get displayName => 'Nombre para Mostrar';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get accountSettings => 'Configuración de la Cuenta';

  @override
  String get dangerZone => 'Zona de Peligro';

  @override
  String get requestAccountDeletion => 'Solicitar Eliminación de Cuenta';

  @override
  String get myAccount => 'Mi Cuenta';

  @override
  String get accountDeleteDialogTitle => 'Solicitud de Eliminación de Cuenta';

  @override
  String get accountDeleteDialogDesc =>
      'Serás redirigido al formulario de solicitud de eliminación de cuenta, ¿estás seguro?';

  @override
  String get unlockPremiumFeatures => 'Desbloquear CopyCat PRO';

  @override
  String get upgradeToPro =>
      'Disfruta de más de 720 horas de historial sincronizado, más de 50 colecciones, cifrado de extremo a extremo, sincronización en tiempo real, acceso a las últimas características y mucho más.';

  @override
  String get tryAgain => 'Por favor, inténtalo de nuevo';

  @override
  String get continue_ => 'Continuar';

  @override
  String get year => 'año';

  @override
  String get month => 'mes';

  @override
  String get manageSubscriptions => 'Gestionar Suscripciones';

  @override
  String promoSub(String TILL) {
    return 'Estás usando una suscripción promocional hasta $TILL';
  }

  @override
  String get subscriptionUpdated => 'Suscripción Actualizada';

  @override
  String get grantedEntitlement => 'Derecho Concedido';

  @override
  String get grantedEntitlementDesc =>
      'Los Códigos de Derecho Concedido se comparten con personas específicas para derechos personalizados. Puedes verificar si las invitaciones aún están disponibles ';

  @override
  String get clickingHere => 'haciendo clic aquí.';

  @override
  String get enterCodeSubmit => 'Introduce el código y presiona Enviar';

  @override
  String get submit => 'Enviar';

  @override
  String get subscribeInSupportedPlatform =>
      'Para acceder a las funciones premium en Copycat Clipboard, suscríbete a través de Play Store o Apple App Store. Tu suscripción se sincronizará en todos tus dispositivos, incluidos Linux y Windows.';

  @override
  String get timeSyncWarning => '⚠️ Advertencia de Sincronización de Tiempo';

  @override
  String get timeSyncWarningNote1 =>
      'Se Detectó una Hora Inconsistente en el Dispositivo';

  @override
  String get timeSyncWarningNote2 =>
      'Para garantizar una sincronización precisa del portapapeles, por favor verifica y corrige la configuración de la hora de tu dispositivo.';

  @override
  String get timeSyncWarningNote3 =>
      'Las configuraciones de tiempo inconsistentes pueden causar problemas de sincronización.';

  @override
  String get checkAgain => 'Verificar Nuevamente';

  @override
  String get shareYourFeedback => 'Comparte tu Opinión';

  @override
  String get shareYourFeedbackDesc =>
      '¡Valoramos tus pensamientos! Ya sea una sugerencia, un informe de error o solo para saludar, tu opinión es invaluable para nosotros.';

  @override
  String get joinDiscord => 'Únete a Nuestra Comunidad de Discord';

  @override
  String get joinDiscordDesc =>
      'Conéctate con otros usuarios, comparte ideas, recibe actualizaciones y chatea directamente con nosotros.';

  @override
  String get joinGoogleGroup => 'Únete a Nuestro Grupo de Google';

  @override
  String get joinGoogleGroupDesc =>
      'Mantente informado y colabora con otros usuarios en nuestro Grupo de Google';

  @override
  String get rebuildingDB =>
      '⏱️ Reconstruyendo Base de Datos\nPor Favor Espera...';
}
