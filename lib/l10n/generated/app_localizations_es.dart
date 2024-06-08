import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'CopyCat';

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
  String get copyCatClipboard => 'Portapapeles CopyCat';

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
  String get beta => 'BETA';

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
  String get unlimitedClipboardItems =>
      '• Elementos de Portapapeles Ilimitados';

  @override
  String get supportAllMajorPlatforms =>
      '• Soporte para todas las plataformas principales';

  @override
  String get supportsAppleUniversalClipboard =>
      '• Compatible con el Portapapeles Universal de Apple';

  @override
  String get onDeviceStorage => '• Almacenamiento en el Dispositivo';

  @override
  String get googleDriveIntegration => '• Integración con Google Drive';

  @override
  String get instantSearch => '• Búsqueda Instantánea';

  @override
  String get syncingUpToLast24Hours =>
      '• Sincronización hasta las últimas 24 horas';

  @override
  String get upTo3Collections => '• Hasta 3 Colecciones';

  @override
  String get autoSyncEvery30Seconds => '• Auto-Sincronización cada 30 Segundos';
}
