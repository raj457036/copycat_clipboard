// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app__name => 'Portapapeles CopyCat';

  @override
  String get app__slogan => 'Un Portapapeles, Posibilidades Ilimitadas';

  @override
  String get app__start_indexing => 'Iniciar Indexación';

  @override
  String get app__stop_indexing => 'Detener Indexación';

  @override
  String get app__image_not_found => 'Imagen no encontrada';

  @override
  String get app__unknown_error => 'Ocurrió un error inesperado';

  @override
  String get app__downloading => 'Descargando...';

  @override
  String get app__download => 'Descargar';

  @override
  String get app__follow_link => 'Seguir Enlace';

  @override
  String get app__edit => 'Editar';

  @override
  String get app__export => 'Exportar';

  @override
  String get app__delete => 'Eliminar';

  @override
  String get app__later => 'Omitir';

  @override
  String get app__select => 'Seleccionar';

  @override
  String get app__change => 'Cambiar';

  @override
  String get app__confirm => 'Confirmar';

  @override
  String get app__action_required => 'Acción Requerida';

  @override
  String get app__feature_unavailable =>
      'Esta función no está disponible para tu plataforma.';

  @override
  String get app__preview => 'Vista Previa';

  @override
  String get app__open_file => 'Abrir archivo';

  @override
  String get app__change_collection => 'Cambiar Colección';

  @override
  String get app__no_name => 'Sin Nombre';

  @override
  String get app__share => 'Compartir';

  @override
  String get app__clip_actions => 'Acciones del clip';

  @override
  String get app__copy_content => 'Copiar contenido';

  @override
  String get app__paste_content => 'Pegar contenido';

  @override
  String get app__loading => 'Cargando...';

  @override
  String get app__uploading => 'Subiendo...';

  @override
  String get app__syncing => 'Sincronizando...';

  @override
  String app__sync_cooldown({required String time}) {
    return 'La sincronización está en enfriamiento. Por favor espera $time antes de sincronizar de nuevo.';
  }

  @override
  String get app__sync => 'Sincronizar';

  @override
  String get app__queued => 'En cola';

  @override
  String get app__local => 'Local';

  @override
  String get app__utc => 'UTC';

  @override
  String get app__send_message => 'Enviar Mensaje';

  @override
  String get app__send_email => 'Enviar Correo Electrónico';

  @override
  String get app__empty_clipboard => 'Tu portapapeles está vacío.';

  @override
  String get app__load_more => 'Cargar Más';

  @override
  String get app__more => 'Más';

  @override
  String get app__search => 'Buscar';

  @override
  String get app__no_results => 'No se encontraron resultados';

  @override
  String get app__locale_en => 'Inglés';

  @override
  String get app__locale_es => 'Español';

  @override
  String get app__locale_fr => 'Francés';

  @override
  String get app__locale_de => 'Alemán';

  @override
  String get app__locale_zh => 'Chino';

  @override
  String get app__locale_pt => 'Portugués';

  @override
  String get app__language => 'Idioma';

  @override
  String get app__yes => 'Sí';

  @override
  String get app__no => 'No';

  @override
  String get app__quit => 'Salir';

  @override
  String get app__clear => 'Limpiar';

  @override
  String get app__reset => 'Restablecer';

  @override
  String get app__continue => 'Continuar';

  @override
  String get app__paste => 'Pegar';

  @override
  String get app__copycat_logo => 'Logo de CopyCat';

  @override
  String get app__logout => 'Cerrar Sesión';

  @override
  String get app__no_collection => 'No se encontró ninguna colección';

  @override
  String get app__create_collection => 'Crear Colección';

  @override
  String get app__create => 'Crear';

  @override
  String get app__pro_tip => 'Consejo Profesional';

  @override
  String get app__try_again => 'Intentar de nuevo';

  @override
  String get app__realtime_connected => 'Conectado en tiempo real';

  @override
  String get app__realtime_disconnected => 'Desconectado en tiempo real';

  @override
  String get app__realtime_connecting => 'Conectando en tiempo real...';

  @override
  String get app__ack__exported => 'Exportado';

  @override
  String get app__ack__copied => 'Copiado';

  @override
  String app__ack__copied_from_device({required String device}) {
    return 'Copiado de $device';
  }

  @override
  String app__ack__received_from_device({required String device}) {
    return 'Recibido de $device';
  }

  @override
  String get app__ack__excluded => 'Excluido';

  @override
  String app__ack__excluded_with_reason({required String reason}) {
    return 'Excluido • $reason';
  }

  @override
  String get app__ack__reason_phone => 'Teléfono';

  @override
  String get app__ack__reason_email => 'Correo electrónico';

  @override
  String get app__ack__reason_credit_card => 'Tarjeta de crédito';

  @override
  String get app__ack__reason_sensitive_url => 'URL confidencial';

  @override
  String get app__ack__reason_app => 'Aplicación confidencial';

  @override
  String get app__ack__reason_pattern => 'Patrón';

  @override
  String get app__ack__reason_title => 'Ventana confidencial';

  @override
  String get app__ack__pasted => 'Pegado';

  @override
  String get app__ack__pasting => 'Pegando';

  @override
  String get app__ack__done => 'Hecho';

  @override
  String get app__ack__quit_app => 'Salir de la Aplicación';

  @override
  String get app__ack__deleted => 'Eliminado';

  @override
  String get app__ack__internet_connected => 'Internet Conectado';

  @override
  String get app__ack__internet_disconnected => 'Internet Desconectado';

  @override
  String get app__ack__logout_success => 'Has cerrado sesión con éxito.';

  @override
  String get app__ack__no_app_for_file =>
      'No se encontró aplicación para abrir este archivo.';

  @override
  String get app__ack__perm_fail_to_open_file =>
      'No se otorgó permiso para abrir este archivo.';

  @override
  String get app__ack__missing_e2e_setup =>
      'Falta configuración de encriptación';

  @override
  String app__ack__failed_to_sync({
    required String entityType,
    required String message,
  }) {
    return 'No se pudo sincronizar $entityType: $message';
  }

  @override
  String app__index_pending({required int total}) {
    return '⚠️ Indexar $total clips para que sean buscables. Solo toma un momento.';
  }

  @override
  String get app__indexing_completed =>
      '🎉 Indexación completada. Tus clips ahora son buscables.';

  @override
  String get dialog__delete_clip__title => 'Eliminar Clip';

  @override
  String dialog__delete_clip__subtitle({required int itemCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      one: '¿Seguro que quieres eliminar este clip?',
      other: '¿Seguro que quieres eliminar estos clips?',
    );
    return '$_temp0';
  }

  @override
  String get dialog__e2e__title => 'Encriptación de Extremo a Extremo';

  @override
  String get dialog__text__e2e_key_export =>
      'Felicidades, has configurado con éxito la encriptación de extremo a extremo.';

  @override
  String get dialog__text__e2e_key_export__note =>
      'Haz clic en el botón de abajo para exportar tu clave de encriptación.\nGuarda la clave en un lugar seguro para asegurarte de poder configurar otros dispositivos para acceder a tu información encriptada.';

  @override
  String get dialog__text__e2e_key_generate =>
      'Genera una clave de encriptación y guárdala de forma segura. Esta clave es necesaria para configurar otros dispositivos para acceder a tus datos encriptados.';

  @override
  String get dialog__button__e2e_generating_key => 'Generando';

  @override
  String get dialog__button__e2e_generate_key => 'Generado';

  @override
  String get dialog__text__invalid_e2e_key =>
      '¡La clave importada es inválida!';

  @override
  String get dialog__text__e2e_key_import__note =>
      'Importa tu clave de encriptación abajo para acceder a tus datos encriptados en este dispositivo.';

  @override
  String get dialog__button__e2e_importing_key => 'Importando';

  @override
  String get dialog__button__e2e_import_key => 'Importar';

  @override
  String get dialog__button__e2e_clear_key => 'Borrar clave';

  @override
  String get dialog__title__e2e_clear_key => 'Borrar clave de encriptación';

  @override
  String get dialog__text__e2e_clear_key__confirm =>
      '¿Seguro que deseas eliminar la clave de encriptación de este dispositivo? No podrás descifrar los clips encriptados hasta que vuelvas a importar la clave.';

  @override
  String get dialog__text__inconsistent_time__title =>
      'Advertencia de Sincronización de Hora';

  @override
  String get dialog__text__inconsistent_time__content =>
      'Se Detectó Hora Inconsistente en el Dispositivo\n\nPara asegurar una sincronización precisa del portapapeles, por favor revisa y corrige la configuración de la hora de tu dispositivo.\n\nLas configuraciones de hora inconsistentes pueden causar problemas de sincronización.';

  @override
  String get dialog__text__inconsistent_time__still_off =>
      'El reloj sigue desincronizado. Actualiza la hora del sistema manualmente.';

  @override
  String get dialog__text__inconsistent_time__ntp_unreachable =>
      'No se pudo contactar el servidor de hora. Comprueba tu conexión a internet y sincroniza el reloj manualmente.';

  @override
  String get dialog__text__inconsistent_time__check_failed =>
      'La comprobación de hora falló. Actualiza el reloj del sistema manualmente.';

  @override
  String get dialog__button__try_again => 'Revisar de Nuevo';

  @override
  String get dialog__button__try_fix => 'Intentar Corregir';

  @override
  String get dialog__record_keys__title => 'Registrar Atajo de Teclado';

  @override
  String get dialog__record_keys__subtitle =>
      'Escribe tu atajo usando el teclado y haz clic en ';

  @override
  String dialog__delete_collection__title({required String collectionName}) {
    return 'Eliminar $collectionName';
  }

  @override
  String get dialog__delete_collection__subtitle =>
      '¿Estás seguro de eliminar esta colección?';

  @override
  String get dialog__ack__sub_updated => 'Suscripción Actualizada';

  @override
  String get dialog__grant_entitlement__title => 'Derecho Otorgado';

  @override
  String get dialog__grant_entitlement__subtitle_p1 =>
      'Los Códigos de Derecho Otorgado se comparten con personas específicas para derechos personalizados. Puedes comprobar si las invitaciones aún están disponibles ';

  @override
  String get dialog__grant_entitlement__subtitle_p2 => 'haciéndo clic aquí.';

  @override
  String get dialog__grant_entitlement__enter_code =>
      'Introduce el código y presiona Enviar';

  @override
  String get dialog__grant_entitlement__code_label => 'Código';

  @override
  String get dialog__grant_entitlement__apply_code => 'Aplicar';

  @override
  String get view_button__switch_to_grid => 'Cambiar a Diseño de Cuadrícula';

  @override
  String get view_button__switch_to_list => 'Cambiar a Diseño de Lista';

  @override
  String get view_button__change_view => 'Cambiar Vista';

  @override
  String get view_button__view_window => 'Ventana';

  @override
  String get view_button__view_dock_right => 'Anclar a la Derecha';

  @override
  String get view_button__view_dock_bottom => 'Anclar Abajo';

  @override
  String get view_button__view_dock_left => 'Anclar a la Izquierda';

  @override
  String get view_button__view_dock_top => 'Anclar Arriba';

  @override
  String get view_button__pin => 'Fijar arriba';

  @override
  String get view_button__unpin => 'Desfijar';

  @override
  String get sub_dialog__text__included => 'Incluido';

  @override
  String get sub_dialog__f1__title => 'Elementos Ilimitados del Portapapeles';

  @override
  String get sub_dialog__f1__subtitle =>
      'Nunca te quedes sin espacio con elementos ilimitados en el portapapeles, asegurando siempre el acceso a tus copias más recientes.';

  @override
  String get sub_dialog__f2__title =>
      'Soporta todas las plataformas principales';

  @override
  String get sub_dialog__f2__subtitle =>
      'Sincronización perfecta en todas las plataformas principales—Android, iOS, Windows, macOS, y Linux—para una productividad ininterrumpida en cualquier lugar.';

  @override
  String get sub_dialog__f3__title => 'Soporta Apple Universal Clipboard';

  @override
  String get sub_dialog__f3__subtitle =>
      'Transfiere sin esfuerzo el contenido del portapapeles entre tus dispositivos Apple con el soporte para Apple Universal Clipboard.';

  @override
  String get sub_dialog__f4__title => 'Almacenamiento En el Dispositivo';

  @override
  String get sub_dialog__f4__subtitle =>
      'Mantén tus datos seguros con almacenamiento en el dispositivo, asegurando que los elementos de tu portapapeles siempre estén al alcance y bajo tu control.';

  @override
  String get sub_dialog__f5__title => 'Integración con Google Drive';

  @override
  String get sub_dialog__f5__subtitle =>
      'Almacena de forma segura archivos y medios en Google Drive, integrándose sin esfuerzo con CopyCat Clipboard para una gestión de datos mejorada.';

  @override
  String get sub_dialog__f6__title => 'Búsqueda Instantánea';

  @override
  String get sub_dialog__f6__subtitle =>
      'Encuentra lo que necesitas al instante con potentes capacidades de búsqueda instantánea, haciendo que la recuperación de elementos del portapapeles sea rápida y eficiente.';

  @override
  String get sub_dialog__f7__title =>
      'Sincronización Hasta las Últimas 24 Horas';

  @override
  String get sub_dialog__f7__subtitle =>
      'Accede y sincroniza tu historial del portapapeles en todos tus dispositivos durante las últimas 24 horas. Esto asegura que nunca pierdas elementos copiados importantes, haciendo tu flujo de trabajo fluido y eficiente.';

  @override
  String get sub_dialog__f8__title => 'Hasta 3 Colecciones';

  @override
  String get sub_dialog__f8__subtitle =>
      'Organiza los elementos de tu portapapeles en hasta 3 colecciones, proporcionando una categorización simple para una mejor gestión del flujo de trabajo.';

  @override
  String get sub_dialog__f9__title => 'Sincronización en segundo plano';

  @override
  String get sub_dialog__f9__subtitle =>
      'La sincronización gratuita funciona según disponibilidad y puede tardar hasta 15 minutos según la carga del servidor.';

  @override
  String get sub_dialog__f10__title =>
      'Soporte para Encriptación de Extremo a Extremo';

  @override
  String get sub_dialog__f10__subtitle =>
      'E2EE hará todo encriptado para una privacidad superior.';

  @override
  String get sub_dialog__text__pro_title => 'Con PRO';

  @override
  String get sub_dialog__text__pro_subtitle => 'Todo incluido en Gratis +';

  @override
  String get sub_dialog__f11__title => 'Hasta 50 Colecciones';

  @override
  String get sub_dialog__f11__subtitle =>
      'Organiza los elementos de tu portapapeles en hasta 50 colecciones para una gestión definitiva.';

  @override
  String get sub_dialog__f12__title =>
      'Sincronización Hasta los Últimos 30 Días';

  @override
  String get sub_dialog__f12__subtitle =>
      'El historial del portapapeles se sincroniza en todos tus dispositivos para clips creados en los últimos 30 días. Esto significa que puedes acceder a cualquier clip que copiaste en el último mes, sin importar qué dispositivo estés usando.';

  @override
  String get sub_dialog__f13__title => 'Sincronización en Tiempo Real';

  @override
  String get sub_dialog__f13__subtitle =>
      'Experimenta sincronización ultra rápida.';

  @override
  String get sub_dialog__f14__title => 'Soporte Más Rápido y Prioritario';

  @override
  String get sub_dialog__f14__subtitle =>
      'Obtén soporte rápido y prioritario como usuario PRO.';

  @override
  String get sub_dialog__f15__title => 'Acceso Temprano a Nuevas Funciones';

  @override
  String get sub_dialog__f15__subtitle =>
      'Sé el primero en probar nuevas características y actualizaciones.';

  @override
  String get sub_dialog__f16__title => 'Reglas de Exclusión Personalizadas';

  @override
  String get sub_dialog__f16__subtitle =>
      'Control preciso sobre tu portapapeles. Te permite definir qué copiar, desde dónde copiar y cuándo copiar.';

  @override
  String get sub_dialog__f17__title => 'Arrastrar y Soltar';

  @override
  String get sub_dialog__f17__subtitle =>
      'Mueve elementos sin esfuerzo en cualquier dirección en tus dispositivos de Escritorio y Tableta.';

  @override
  String get sub_dialog__f18__title => 'Tematización';

  @override
  String get sub_dialog__f18__subtitle =>
      'Personaliza la apariencia completa de la aplicación para que coincida con tus preferencias.';

  @override
  String get paywall_dialog__text__month => 'mes';

  @override
  String get paywall_dialog__text__year => 'año';

  @override
  String get paywall_dialog__text__subscription => 'Suscripción';

  @override
  String get paywall_dialog__text__supported_platform =>
      'Para acceder a las características premium en Copycat Clipboard, por favor suscríbete a través de la Play Store o Apple App Store. Tu suscripción se sincronizará en todos tus dispositivos, incluyendo Linux y Windows.';

  @override
  String get paywall_dialog__text__unlock_pro => 'Desbloquea CopyCat PRO';

  @override
  String get paywall_dialog__text__unlock_pro_p1 =>
      'Disfruta de más de 30 días de historial sincronizado, más de 50 colecciones, encriptación de extremo a extremo, sincronización en tiempo real, acceso a las funciones más nuevas y mucho más.';

  @override
  String get paywall_dialog__text__try_again => 'Por favor intenta de nuevo';

  @override
  String get paywall_dialog__text__current_plan => 'Plan Actual';

  @override
  String get paywall_dialog__text__expired_plan => 'Plan Actual • Expirado';

  @override
  String paywall_dialog__text__trial_till({required DateTime till}) {
    final intl.DateFormat tillDateFormat = intl.DateFormat.yMMMd(localeName);
    final String tillString = tillDateFormat.format(till);

    return 'Prueba hasta $tillString';
  }

  @override
  String get paywall_dialog__text__upgrade => 'Mejorar';

  @override
  String fab__create_collection({required String remaining}) {
    return 'Crear Colección ( $remaining Restante )';
  }

  @override
  String get fab__sync => 'Sincronizar';

  @override
  String get fab__sync_unavailable => 'Sincronización No Disponible';

  @override
  String get fab__sync_up_to_date => 'Ya está actualizado.';

  @override
  String fab__sync_failed({required String message}) {
    return 'Sincronización fallida: $message';
  }

  @override
  String get layout__navbar__clipboard => 'Portapapeles';

  @override
  String get layout__navbar__collections => 'Colecciones';

  @override
  String get layout__navbar__settings => 'Configuraciones';

  @override
  String get search__tooltip__filter => 'Filtros de búsqueda';

  @override
  String manage_sub__ack__promo_sub({required String till}) {
    return 'Estás usando una suscripción promocional hasta $till';
  }

  @override
  String get manage_sub__button__text => 'Gestionar Suscripciones';

  @override
  String get my_account__button__tooltip => 'Mi Cuenta';

  @override
  String get badges__tooltip__experimental =>
      'Esta característica es experimental y puede no funcionar como se espera.';

  @override
  String get badges__label__pro => 'Pro';

  @override
  String get badges__tooltip__pro_only =>
      'Esta característica está disponible solo para usuarios Pro.';

  @override
  String get collection_selector__tile__no_collection => 'Sin Colección';

  @override
  String get collection_selector__button__remove_collection =>
      'Eliminar Colección';

  @override
  String get dialog__logout__title => 'Cerrar Sesión';

  @override
  String get dialog__logout__subtitle =>
      '⚠️ ADVERTENCIA ⚠️\n\nCerrar sesión eliminará los cambios no sincronizados en la base de datos local. ¿Estás seguro de que quieres continuar?';

  @override
  String get dialog__logging_out__ack =>
      '¡Cerrando sesión! Por favor espera...';

  @override
  String get reset_pass__text__label => 'Restablece tu contraseña';

  @override
  String get dnd__text__drop_here => 'Suelta Aquí';

  @override
  String dnd__ack__error_max_drop_count({required int count}) {
    return 'Se permite un máximo de $count elementos a la vez.';
  }

  @override
  String get search_filter__text__title => 'Filtros';

  @override
  String get search_filter__button__apply => 'Aplicar';

  @override
  String get search_filter__text__from => 'De';

  @override
  String get search_filter__text__select => 'Seleccionar';

  @override
  String get search_filter__text__to => 'A';

  @override
  String get search_filter__text__now => 'Ahora';

  @override
  String get search_filter__text__including => 'Incluyendo';

  @override
  String get search_filter__chip__text => 'Texto';

  @override
  String get search_filter__chip__url => 'URL';

  @override
  String get search_filter__chip__media => 'Medios';

  @override
  String get search_filter__chip__docs => 'Documentos';

  @override
  String get search_filter__text__textCategories => 'Categorías de Texto';

  @override
  String get search_filter__text__exclusive => '( Exclusivo )';

  @override
  String get search_filter__text_cat__email => 'Correo Electrónico';

  @override
  String get search_filter__text_cat__phone => 'Teléfono';

  @override
  String get search_filter__text_cat__color => 'Color';

  @override
  String get search_filter__text_cat__struct => 'Estructura';

  @override
  String get search_filter__text__sort_by => 'Ordenar Por';

  @override
  String get search_filter__sort_by__last_mod => 'Última Modificación';

  @override
  String get search_filter__sort_by__created => 'Creado';

  @override
  String get search_filter__sort_by__copy_count => 'Conteo de Copias';

  @override
  String get search_filter__sort_by__last_copied => 'Última Copia';

  @override
  String get search_filter__text__sort_order => 'Orden de Clasificación';

  @override
  String get search_filter__sort_ord__asc => 'Ascendente';

  @override
  String get search_filter__sort_ord__desc => 'Descendente';

  @override
  String get search_filter__tooltip__clear => 'Limpiar';

  @override
  String get search_filter__empty => '∅';

  @override
  String get search_filter__button__reset => 'Restablecer';

  @override
  String get login__local_signin__tooltip =>
      'Sin sincronización. Todos los datos permanecen en tu dispositivo.';

  @override
  String get login__local_signin__btn__label => 'Modo Offline';

  @override
  String get login__form__input__name => 'Introduce tu buen nombre';

  @override
  String get login__form__input__email => 'Introduce tu correo electrónico';

  @override
  String get login__form__input__error_email =>
      'Por favor introduce una dirección de correo electrónico válida';

  @override
  String get login__form__input__password => 'Introduce tu contraseña';

  @override
  String get login__form__input__error_password_length =>
      'Por favor introduce una contraseña de al menos 6 caracteres';

  @override
  String get login__form__button__signin => 'Iniciar Sesión';

  @override
  String get login__form__button__signup => 'Registrarse';

  @override
  String get login__form__button__forgot_password =>
      '¿Olvidaste tu contraseña?';

  @override
  String get login__form__text__signup => '¿No tienes una cuenta? Regístrate';

  @override
  String get login__form__text__old_user =>
      '¿Ya tienes una cuenta? Iniciar sesión';

  @override
  String get login__form__text__reset_password =>
      'Enviar correo de restablecimiento de contraseña';

  @override
  String get login__form__text__reset_ack =>
      'El correo de restablecimiento de contraseña ha sido enviado';

  @override
  String get login__form__button__back => 'Volver a iniciar sesión';

  @override
  String get login__form__button__update_password => 'Actualizar Contraseña';

  @override
  String get login__form__text_tnc_p1 =>
      'Al continuar, aceptas los siguientes ';

  @override
  String get login__form__text_tnc_p2 => 'Políticas de privacidad';

  @override
  String get login__form__text_tnc_p3 => ' y ';

  @override
  String get login__form__text_tnc_p4 => 'Términos del Servicio.';

  @override
  String get home__search__hint => 'Buscar en el portapapeles';

  @override
  String get collections__search__hint => 'Buscar colección';

  @override
  String get home__search__reset => 'Restablecer Búsqueda';

  @override
  String get preview__vert_view__tab1_title => 'Vista Previa';

  @override
  String get preview__vert_view__tab2__title => 'Detalles';

  @override
  String get preview__card__missing_text => 'Este es un Clip Vacío';

  @override
  String get preview__card__video__play => 'Reproducir Video';

  @override
  String get preview__card__video__mute => 'Silenciar';

  @override
  String get preview__card__video__unmute => 'Activar sonido';

  @override
  String get preview__card__video__close => 'Cerrar reproductor';

  @override
  String get preview__card__file__open => 'Abrir Archivo';

  @override
  String get preview__form__title => 'Editar Detalles';

  @override
  String get preview__inspector__lock_clip => 'Bloquear clip';

  @override
  String get preview__inspector_lock_clip_description =>
      'Cifra este clip, desactiva la indexación de búsqueda y requiere autenticación para verlo.';

  @override
  String get preview__form__input__title => 'Título';

  @override
  String get preview__form__input__description => 'Descripción';

  @override
  String get preview__inspector__title => 'Detalles del clip';

  @override
  String get preview__inspector__untitled => 'Clip sin título';

  @override
  String get preview__inspector__saved => 'Detalles guardados';

  @override
  String get preview__inspector__save_changes => 'Guardar cambios';

  @override
  String get preview__inspector__decrypt => 'Descifrar';

  @override
  String get preview__inspector__open_source => 'Abrir origen';

  @override
  String get preview__inspector__section__actions => 'Acciones';

  @override
  String get preview__inspector__section__details => 'Detalles';

  @override
  String get preview__inspector__section__content => 'Contenido';

  @override
  String get preview__inspector__section__security => 'Seguridad';

  @override
  String get preview__inspector__section__organize => 'Organizar';

  @override
  String get preview__inspector__label__created => 'Creado';

  @override
  String get preview__inspector__label__modified => 'Modificado';

  @override
  String get preview__inspector__label__last_copied => 'Última copia';

  @override
  String get preview__inspector__label__copied_count => 'Cantidad de copias';

  @override
  String get preview__inspector__label__source_app => 'Aplicación de origen';

  @override
  String get preview__inspector__label__source_url => 'URL de origen';

  @override
  String get preview__inspector__label__file_size => 'Tamaño del archivo';

  @override
  String get preview__inspector__label__mime_type => 'Tipo MIME';

  @override
  String get preview__inspector__label__extension => 'Extensión';

  @override
  String get preview__inspector__label__characters => 'Caracteres';

  @override
  String get preview__inspector__label__lines => 'Líneas';

  @override
  String get preview__inspector__label__link => 'Enlace';

  @override
  String get preview__inspector__label__image_dimension => 'Dimensión';

  @override
  String get preview__inspector__label__device => 'Dispositivo';

  @override
  String get preview__inspector__label__storage => 'Almacenamiento';

  @override
  String get preview__inspector__status__encrypted => 'Cifrado';

  @override
  String get preview__inspector__status__local_only => 'Solo local';

  @override
  String get preview__inspector__status__synced => 'Sincronizado';

  @override
  String get preview__inspector__status__not_synced => 'No sincronizado';

  @override
  String get preview__inspector__status__download_required =>
      'Descarga requerida';

  @override
  String get preview__inspector__status__available => 'Disponible sin conexión';

  @override
  String get preview__inspector__type__text => 'Texto';

  @override
  String get preview__inspector__type__media => 'Multimedia';

  @override
  String get preview__inspector__type__file => 'Archivo';

  @override
  String get preview__inspector__type__link => 'Enlace';

  @override
  String get reset_password__appbar__title => 'Restablece tu contraseña';

  @override
  String get reset_password__success_ack => 'Contraseña restablecida con éxito';

  @override
  String get onboarding__text__welcome => 'Bienvenido a';

  @override
  String get onboarding__text__lets_continue => 'Continuemos';

  @override
  String get onboarding__button__to_login => 'Iniciar sesión';

  @override
  String get onboarding__snackbar__export_success =>
      'Clave de encriptación exportada con éxito.';

  @override
  String get onboarding__dialog__skip_export__title =>
      '✋ Guarda una Copia de Seguridad de tu Clave de Encriptación';

  @override
  String get onboarding__dialog__skip_export__subtitle =>
      'Aún no has exportado tu clave de encriptación. Sin una copia de seguridad, no podrás acceder a tus clips encriptados si pierdes la clave o cambias de dispositivo.\n\n👉 Si ya tienes una copia de seguridad segura de tu clave, puedes continuar sin problemas. De lo contrario, te recomendamos encarecidamente que exportes la clave ahora para evitar la pérdida de datos. ¿Aún deseas continuar?';

  @override
  String get onboarding__dialog__export_info__title =>
      '🤔 ¿Por qué Exportar la Clave de Encriptación?';

  @override
  String get onboarding__dialog__export_info__subtitle =>
      'Exportar tu clave de encriptación es esencial para acceder de forma segura a tus datos encriptados en múltiples dispositivos. Sin la clave, tus datos encriptados permanecerán inaccesibles tras la sincronización.\n\nGuarda una copia de tu clave de encriptación en un lugar seguro para evitar la pérdida de datos. Recuerda, la clave es única para tu cuenta y no se puede recuperar si se pierde.\n\nNota: Copycat no puede acceder a tus clips encriptados ni a tus claves de encriptación. Esto se debe a que valoramos tu privacidad por encima de todo.';

  @override
  String get onboarding__text__export_key_headline =>
      'Encriptación del Portapapeles';

  @override
  String get onboarding__text__export_key_title =>
      '💪 ¡Gran Noticia! La encriptación está activa para tu portapapeles';

  @override
  String get onboarding__button__export_key => 'Exportar Clave';

  @override
  String get onboarding__dialog__skip_gen_key__title =>
      '✋ Tus Clips Estarán Inseguros';

  @override
  String get onboarding__dialog__skip_gen_key__subtitle =>
      'Aún no has generado una clave de encriptación. Sin ella, tus clips permanecerán sin encriptar e inseguros. Puedes generar la clave más adelante en Configuración ❯ Seguridad. ¿Aún deseas continuar?';

  @override
  String get onboarding__dialog__gen_key_info__title =>
      '🤔 ¿Por qué Necesito Encriptación?';

  @override
  String get onboarding__dialog__gen_key_info__subtitle =>
      'La encriptación protege tus datos convirtiéndolos en un formato seguro que solo puede ser accedido con una clave. Sin encriptación, tus clips se almacenan en texto plano, haciéndolos vulnerables al acceso no autorizado. Habilitar la encriptación asegura que solo tú puedas acceder a tus datos sensibles, proporcionando una capa adicional de seguridad contra posibles violaciones.';

  @override
  String get onboarding__text__gen_key_headline =>
      'Configurar Encriptación del Portapapeles';

  @override
  String onboarding__text__key_generated_title({required String keyPreview}) {
    return '🎉 Clave $keyPreview*** generada con éxito 🎉';
  }

  @override
  String get onboarding__button__regenerate_key => 'Regenerar Clave';

  @override
  String get onboarding__text__no_key =>
      'Tu cuenta no tiene ninguna clave de encriptación';

  @override
  String get onboarding__button__generate_key => 'Generar Clave';

  @override
  String get onboarding__button__do_it_later => 'Hacerlo Más Tarde';

  @override
  String get onboarding__button__why_important => '¿Por qué es Importante?';

  @override
  String get onboarding__snackbar__invalid_key =>
      'Esta no es una clave de encriptación CopyCat válida';

  @override
  String get onboarding__dialog__skip_import__title =>
      '✋ Clips Encriptados Inaccesibles';

  @override
  String get onboarding__dialog__skip_import__subtitle =>
      'Aún no has importado la clave de encriptación. Esto significa que todos tus clips encriptados permanecerán inaccesibles localmente tras la sincronización.\n\nPara acceder a ellos, importa la clave desde Configuración ❯ Seguridad.\n¿Aún deseas continuar?';

  @override
  String get onboarding__dialog__reset_key__title =>
      '✋ Eliminar Permanentemente Datos Encriptados';

  @override
  String get onboarding__dialog__reset_key__subtitle =>
      'Esta acción es irreversible. ¿Estás seguro de que deseas eliminar permanentemente todos los datos encriptados del servidor?';

  @override
  String get onboarding__snackbar__reset_key__success =>
      'Encriptación eliminada exitosamente.';

  @override
  String get onboarding__dialog__import_info__title =>
      '🤔 ¿Dónde está mi clave?';

  @override
  String get onboarding__dialog__import_info__subtitle =>
      'Tu clave de encriptación es un archivo seguro generado durante el proceso de configuración de la encriptación. Si la has extraviado, revisa tu carpeta de descargas o cualquier lugar de respaldo donde puedas haberla guardado. Sin esta clave, tus datos encriptados no pueden ser accedidos.\n\nSi has configurado la clave de encriptación en otro dispositivo, puedes exportarla yendo a Configuración ❯ Seguridad ❯ Bóveda E2EE en ese dispositivo. Transfiere la clave de manera segura a este dispositivo para recuperar el acceso a tus datos encriptados.';

  @override
  String get onboarding__text__import_key_headline =>
      'Importar Clave de Encriptación del Portapapeles';

  @override
  String get onboarding__text__import_key_title =>
      'Tu cuenta actualmente tiene encriptación activa.';

  @override
  String get onboarding__button__import_key => 'Importar Clave';

  @override
  String get onboarding__button__reset_key => 'Restablecer Encriptación';

  @override
  String get onboarding__button__where_key => '¿Dónde está la clave?';

  @override
  String get onboarding__text__go_home => 'Vamos a casa';

  @override
  String onboarding__restoration__failed({required String message}) {
    return 'La restauración falló: $message';
  }

  @override
  String get onboarding__restoration_warning =>
      '⚠️ Mantén esta pantalla abierta durante la sincronización para evitar corrupción de datos o inconsistencias.';

  @override
  String get sync_restore__title => 'Restaurando tu espacio de trabajo';

  @override
  String get sync_restore__subtitle =>
      'CopyCat está trayendo tus colecciones sincronizadas y el historial del portapapeles a este dispositivo.';

  @override
  String get sync_restore__checking_backup =>
      'Comprobando la copia de seguridad remota...';

  @override
  String get sync_restore__decrypting_title => 'Descifrando clips';

  @override
  String get sync_restore__decrypting_counting => 'Contando clips cifrados...';

  @override
  String sync_restore__decrypting_progress({
    required int decrypted,
    required int total,
  }) {
    return 'Descifrados $decrypted de $total';
  }

  @override
  String get sync_restore__workspace_restored =>
      'Espacio de trabajo restaurado';

  @override
  String get sync_restore__data_ready =>
      'Tus datos sincronizados están listos en este dispositivo.';

  @override
  String get sync_restore__restoring_collections =>
      'Restaurando colecciones para mantener organizados los elementos del portapapeles.';

  @override
  String get sync_restore__restoring_clips =>
      'Las colecciones se restauraron. Ahora sigue el historial del portapapeles.';

  @override
  String get sync_restore__finishing_checks =>
      'Finalizando comprobaciones de restauración.';

  @override
  String get sync_restore__no_synced_items =>
      'No se encontraron elementos sincronizados';

  @override
  String sync_restore__restored_count({required int count}) {
    return '$count restaurados';
  }

  @override
  String sync_restore__restored_of_total({
    required int synced,
    required int total,
  }) {
    return '$synced de $total restaurados';
  }

  @override
  String get sync_restore__progress_estimating => 'Estimando';

  @override
  String get sync_restore__progress_complete => 'Completado';

  @override
  String get sync_restore__status_ready => 'Listo';

  @override
  String get sync_restore__status_restoring => 'Restaurando';

  @override
  String get sync_restore__collections_title => 'Colecciones';

  @override
  String get sync_restore__collections_description =>
      'Grupos guardados y organización';

  @override
  String get sync_restore__clipboard_items_title =>
      'Elementos del portapapeles';

  @override
  String get sync_restore__clipboard_items_description =>
      'Historial, texto, enlaces, archivos y medios';

  @override
  String sync_restore__count_of_total({required int total}) {
    return 'de $total';
  }

  @override
  String get sync_restore__continue_to_copycat => 'Continuar a CopyCat';

  @override
  String get sync_restore__failed_title => 'La restauración falló';

  @override
  String get restore_clips__text__title => 'Restaurar mi portapapeles';

  @override
  String get restore_clips__error__no_backup =>
      'No se encontró una copia de seguridad del portapapeles';

  @override
  String restore_clips__text__total_count({required int totalCount}) {
    return 'Tienes aproximadamente $totalCount clip(s) para restaurar.';
  }

  @override
  String get restore_clips__sync_disable =>
      'La sincronización está desactivada. Actívala para continuar.';

  @override
  String get restore_clips__preparing =>
      'Preparando para restaurar los clips. Por favor espera...';

  @override
  String restore_clips__restored({required int syncCount}) {
    return 'Tus $syncCount clip(s) se han restaurado con éxito.';
  }

  @override
  String restore_clips__restoring({
    required int synced,
    required int totalCount,
  }) {
    return 'Restaurado: $synced de $totalCount clips.';
  }

  @override
  String get restore_collections__text__title => 'Restaurar mis colecciones';

  @override
  String get restore_collections__error__no_backup =>
      'No se encontró una copia de seguridad de colecciones';

  @override
  String restore_collections__text__total_count({required int totalCount}) {
    return 'Tienes aproximadamente $totalCount colección(es) para restaurar.';
  }

  @override
  String get restore_collections__sync_disable =>
      'La sincronización está desactivada. Actívala para continuar.';

  @override
  String get restore_collections__preparing =>
      'Preparando para restaurar las colecciones. Por favor espera...';

  @override
  String restore_collections__restored({required int syncCount}) {
    return 'Tus $syncCount colección(es) se han restaurado con éxito.';
  }

  @override
  String restore_collections__restoring({
    required int synced,
    required int totalCount,
  }) {
    return 'Restaurado: $synced de $totalCount colecciones.';
  }

  @override
  String get drive__snackbar__success =>
      'La configuración de Drive está ahora completa.';

  @override
  String get drive__text__setting_up => 'Configurando y sincronizando...';

  @override
  String get drive__text__setting_up__warning =>
      'Por favor espera mientras finalizamos esto. No cierres la aplicación.';

  @override
  String get create_clip__appbar__title__new => 'Nuevo Clip';

  @override
  String get create_clip__appbar__title__edit => 'Editar Clip';

  @override
  String get create_clip__button__save_new => 'Guardar como nuevo';

  @override
  String get create_clip__input__hint => 'Escribe aquí el contenido de tu clip';

  @override
  String get collections__text__tip =>
      'Para asegurarte de que tus clips importantes estén siempre disponibles sin importar el tiempo, en todos tus dispositivos, ¡guárdalos en una colección!';

  @override
  String get collections__appbar__title => 'Colecciones';

  @override
  String get collections__appbar__title__create => 'Crear Colección';

  @override
  String get collections__appbar__title__edit => 'Editar Colección';

  @override
  String get collections__input__name => 'Nombre';

  @override
  String get collections__input__description => 'Descripción';

  @override
  String get collections__label__emoji =>
      'Icono de la colección (haz clic para cambiar)';

  @override
  String get collections__validation__duplicate =>
      'Ya existe una colección con este icono y nombre';

  @override
  String get collections__validation__name_required =>
      'El nombre es obligatorio.';

  @override
  String get collections__validation__name_max_length =>
      'El nombre debe tener como máximo 30 caracteres.';

  @override
  String get select_collection__appbar__title => 'Seleccionar Colección';

  @override
  String get account__dialog__delete_confirm__title =>
      'Solicitud de Eliminación de Cuenta';

  @override
  String get account__dialog__delete_confirm__description =>
      'Serás redirigido al formulario de solicitud de eliminación de cuenta, ¿estás seguro?';

  @override
  String get account__list_tile__display_name => 'Nombre para Mostrar';

  @override
  String get account__list_tile__email => 'Correo Electrónico';

  @override
  String get account__list_tile__settings => 'Configuraciones de la Cuenta';

  @override
  String get account__list_tile__danger_zone => 'Zona de Peligro';

  @override
  String get account__button__req_delete => 'Solicitar Eliminación de Cuenta';

  @override
  String get account__appbar__title => 'Mi Cuenta';

  @override
  String get settings__appbar__title => 'Configuración';

  @override
  String get settings__header__appearance => 'Apariencia';

  @override
  String get settings__header__sorting => 'Orden predeterminado';

  @override
  String get settings__header__interactions => 'Interacciones';

  @override
  String get settings__tab__1 => 'General';

  @override
  String get settings__tab__2 => 'Personalización';

  @override
  String get settings__tab__3 => 'Cloud';

  @override
  String get settings__tab__4 => 'Seguridad';

  @override
  String get settings__tab__5 => 'Experimental';

  @override
  String get settings__text__encryption => 'Encriptación';

  @override
  String get settings__text__sync_not_available =>
      'Configuraciones relacionadas con la sincronización no están disponibles al usar el portapapeles local.';

  @override
  String get settings__appbar__er__title => 'Reglas de Exclusión';

  @override
  String get settings__text__er__predefine =>
      'Reglas de Exclusión Predefinidas';

  @override
  String get settings__text__er__pass_manager => 'Gestores de Contraseñas';

  @override
  String get settings__text__er__pass_manager__subtitle =>
      'Excluir capturas de gestores de contraseñas';

  @override
  String get settings__text__er__cc => 'Número de Tarjeta de Crédito';

  @override
  String get settings__text__er__cc__subtitle =>
      'Excluir números de tarjeta detectados';

  @override
  String get settings__text__er__phone => 'Número de Teléfono';

  @override
  String get settings__text__er__phone__subtitle =>
      'Excluir números de teléfono detectados';

  @override
  String get settings__text__er__email => 'Dirección de Correo Electrónico';

  @override
  String get settings__text__er__email__subtitle =>
      'Excluir direcciones de correo detectadas';

  @override
  String get settings__text__er__url => 'URL Sensible';

  @override
  String get settings__text__er__url__subtitle =>
      'Excluir capturas con URL sensibles';

  @override
  String get settings__text__decrypted__note =>
      '🥳 ¡Felicidades! Todos tus clips han sido desencriptados con éxito localmente,\n por lo que no se requiere reconstruir la base de datos.';

  @override
  String get settings__appbar__cer__title =>
      'Reglas de Exclusión Personalizadas';

  @override
  String get settings__switch__drag_n_drop__title => 'Arrastrar y Soltar';

  @override
  String get settings__switch__drag_n_drop__subtitle =>
      'Permitir que los elementos se muevan libremente en ambas direcciones dentro de la app.';

  @override
  String get settings__dropdown__no_copy_over_limit__title =>
      'No Copiar Automáticamente Más de';

  @override
  String settings__dropdown__no_copy_over_limit__subtitle({
    required String fileSize,
  }) {
    return 'Archivos y medios de más de cierto tamaño ($fileSize) no se copiarán automáticamente.';
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
      'No Subir Automáticamente Más de';

  @override
  String settings__dropdown__no_upload_over_limit__subtitle({
    required String fileSize,
  }) {
    return 'Archivos y medios de más de cierto size ($fileSize) no se subirán automáticamente.';
  }

  @override
  String get settings__dropdown__sync_mode__title => 'Modo de Sincronización';

  @override
  String get settings__dropdown__sync_mode__subtitle =>
      'Selecciona la velocidad de sincronización que mejor funcione para ti.';

  @override
  String get settings__sync_mode__realtime => 'Tiempo Real';

  @override
  String get settings__sync_mode__balanced => 'Equilibrado';

  @override
  String get settings__dropdown__theme__title => 'Modo de Tema';

  @override
  String get settings__dropdown__default_sort__title => 'Ordenar por';

  @override
  String get settings__dropdown__default_sort_order__title => 'Orden';

  @override
  String get settings__theme__system => 'Sistema';

  @override
  String get settings__theme__light => 'Claro';

  @override
  String get settings__theme__dark => 'Oscuro';

  @override
  String get settings__dropdown__color_mode__title => 'Modo de Color';

  @override
  String get settings__dropdown__color_mode__subtitle =>
      'Selecciona el modo de color para personalizar la apariencia de la app. La opción predeterminada es \'Tonal Spot\'.';

  @override
  String get settings__dropdown__clipboard_feedback__title =>
      'Retroalimentación del Portapapeles';

  @override
  String get settings__dropdown__clipboard_feedback__subtitle =>
      'Elige cómo CopyCat responde cuando se captura un clip.';

  @override
  String get settings__clipboard_feedback__disabled => 'Desactivado';

  @override
  String get settings__clipboard_feedback__copy_only => 'Solo copia';

  @override
  String get settings__clipboard_feedback__sync_only => 'Solo sincronización';

  @override
  String get settings__clipboard_feedback__copy_and_sync =>
      'Copia y sincronización';

  @override
  String get settings__clipboard_feedback__toast => 'Tostada';

  @override
  String get settings__color_mode__tonalSpot => 'Tonal Spot';

  @override
  String get settings__color_mode__content => 'Contenido';

  @override
  String get settings__color_mode__expressive => 'Expresivo';

  @override
  String get settings__color_mode__fidelity => 'Fidelidad';

  @override
  String get settings__color_mode__fruit_salad => 'Ensalada de Frutas';

  @override
  String get settings__color_mode__monochrome => 'Monocromo';

  @override
  String get settings__color_mode__neutral => 'Neutral';

  @override
  String get settings__color_mode__rainbow => 'Arcoíris';

  @override
  String get settings__color_mode__vibrant => 'Vibrante';

  @override
  String get settings__tile__cer_title => 'Reglas Personalizadas';

  @override
  String get settings__tile__cer_subtitle =>
      'Excluir por aplicación, título de ventana de la aplicación/sitio web, URL del sitio web o patrón regex';

  @override
  String get settings__tile__er_title => 'Reglas de Exclusión';

  @override
  String get settings__tile__er_subtitle =>
      'Evita que la información se copie al portapapeles. Haz clic para control avanzado.';

  @override
  String get settings__switch__enable_sync__title =>
      'Sincronización del Portapapeles';

  @override
  String get settings__switch__enable_sync__subtitle =>
      'Sincroniza tu portapapeles entre dispositivos sin esfuerzo.';

  @override
  String get settings__switch__sync_file__title =>
      'Sincronización de Archivos y Medios';

  @override
  String get settings__switch__sync_file__subtitle =>
      'Activa para sincronizar archivos y clips de medios entre dispositivos.';

  @override
  String get settings__switch__paused__title =>
      'Pausar Escucha del Portapapeles';

  @override
  String get settings__switch__paused__subtitle =>
      'Pausa temporalmente el seguimiento del portapapeles hasta una hora establecida.';

  @override
  String settings__switch__paused_active__subtitle({required DateTime time}) {
    final intl.DateFormat timeDateFormat = intl.DateFormat(
      'h:mm a',
      localeName,
    );
    final String timeString = timeDateFormat.format(time);

    return 'Pausado hasta $timeString. Toca para reanudar o ajustar la hora.';
  }

  @override
  String get settings__switch__smart_paste__title => 'Pegado Inteligente';

  @override
  String get settings__switch__smart_paste__subtitle =>
      'Pega contenido directamente en la aplicación enfocada.';

  @override
  String get settings__switch__focus_loss_behavior__title =>
      'Mantener la Ventana Abierta al Perder el Enfoque';

  @override
  String get settings__switch__focus_loss_behavior__subtitle =>
      'Cuando CopyCat pierde el enfoque, mantenerlo abierto en segundo plano en lugar de ocultarlo automáticamente.';

  @override
  String get settings__switch__transform_behavior__title =>
      'Guardar transformaciones como clips nuevos';

  @override
  String get settings__switch__transform_behavior__subtitle =>
      'Si está activado, las acciones de transformación crean un nuevo clip en lugar de copiar o pegar de inmediato.';

  @override
  String get settings__switch__type_search__title =>
      'Búsqueda mientras escribes';

  @override
  String get settings__switch__type_search__subtitle =>
      'Busca clips mientras escribes en la barra de búsqueda.';

  @override
  String get settings__switch__startup__title => 'Iniciar al Iniciar';

  @override
  String get settings__switch__startup__subtitle =>
      'Inicia automáticamente el CopyCat cuando tu dispositivo se encienda.';

  @override
  String get settings__switch__tray_icon__title =>
      'Mostrar icono en la bandeja';

  @override
  String get settings__switch__tray_icon__subtitle =>
      'Muestra el icono de CopyCat en la barra de menú / bandeja del sistema.';

  @override
  String get settings__switch__hide_from_screen_capture__title =>
      'Ocultar en capturas de pantalla';

  @override
  String get settings__switch__hide_from_screen_capture__subtitle =>
      'Si se activa, las capturas y grabaciones de pantalla deberían ocultar el contenido de CopyCat en plataformas compatibles.';

  @override
  String get settings__switch__hotkey__title =>
      'Alternar con Tecla de Acceso Rápido';

  @override
  String get settings__switch__hotkey__subtitle =>
      'Usa un atajo de teclado para acceder rápidamente a tu Portapapeles CopyCat';

  @override
  String get settings__switch__paste_stack_hotkey__title =>
      'Atajo de Paste Stack';

  @override
  String get settings__switch__paste_stack_hotkey__subtitle =>
      'Usa un atajo de teclado para abrir o cerrar Paste Stack';

  @override
  String get settings__switch__quickpaste_hotkey__title =>
      'Atajo de Quick Paste';

  @override
  String get settings__switch__quickpaste_hotkey__subtitle =>
      'Usa un atajo de teclado para acceder al instante a tus 10 elementos principales del portapapeles';

  @override
  String get settings__hotkey__unassigned => 'No Asignado';

  @override
  String get settings__hotkey__preview_start => 'Presiona ';

  @override
  String get settings__hotkey__preview_end => ' para mostrar u ocultar la app.';

  @override
  String get settings__tile__theme_color__title => 'Color de Tema';

  @override
  String get settings__tile__theme_color__subtitle =>
      'Este color influirá en la apariencia general de la app.';

  @override
  String get settings__tile__desk_client__title =>
      'Descargar Cliente de Escritorio';

  @override
  String get settings__tile__mobile_client__title =>
      'Descargar Cliente para Teléfono';

  @override
  String get settings__tile__client__subtitle =>
      'Accede a tu portapapeles en todos tus dispositivos.';

  @override
  String get settings__tile__e2e_setup__title =>
      'Configuración de Encriptación de Extremo a Extremo';

  @override
  String get settings__tile__e2e_setup__subtitle =>
      'Configura la encriptación para tus clips.';

  @override
  String get settings__switch__e2e__title => 'Activar Encriptación';

  @override
  String get settings__switch__e2e__subtitle =>
      'Activa o desactiva la encriptación de extremo a extremo para tus clips.';

  @override
  String get settings__switch__e2e_nonce__title =>
      'Modo de alta seguridad (recomendado)';

  @override
  String get settings__switch__e2e_nonce__subtitle =>
      'Usa AES-GCM para una mejor protección de datos y detección de alteraciones. (Las versiones antiguas de la app no pueden descifrar estos clips nuevos)';

  @override
  String get settings__dialog__conn_gdrive__title =>
      '¿Reconectar Google Drive?';

  @override
  String get settings__dialog__conn_gdrive__subtitle =>
      '¡Tu Google Drive ya está conectado! ¿Te gustaría reconectar?\n\nPara evitar cualquier pérdida de datos, asegúrate de usar la misma cuenta que antes.';

  @override
  String get settings__drive__connected => 'Conectado';

  @override
  String get settings__drive__loading => 'Cargando...';

  @override
  String get settings__drive__authorizing => 'Autorizando...';

  @override
  String get settings__drive__connect => 'Conectar';

  @override
  String get settings__drive__disconnected => 'Desconectado';

  @override
  String get settings__text__cloud__title => 'Unidad en la Nube';

  @override
  String get settings__text__cloud__name => 'Google Drive';

  @override
  String get settings__text__gdrive__error =>
      'Google Drive no está conectado. La sincronización de archivos y medios está actualmente desactivada.';

  @override
  String get settings__text__gdrive__info =>
      'Tus archivos y medios se sincronizan de forma segura entre dispositivos a través de proveedores en la nube compatibles, asegurando que tu privacidad esté protegida. Cuando hay varios proveedores conectados, puedes elegir el almacenamiento predeterminado para nuevas subidas.';

  @override
  String get settings__drive__default_tooltip =>
      'Almacenamiento predeterminado para subidas';

  @override
  String get settings__drive__set_default => 'Establecer como predeterminado';

  @override
  String get settings__tile__other_cloud__title =>
      'Configura Otras Unidades en la Nube';

  @override
  String get settings__text__webdav__name => 'WebDAV';

  @override
  String get settings__text__webdav__info =>
      'Conecta tu servidor WebDAV (Nextcloud, ownCloud, Synology NAS, etc.) para almacenar y sincronizar tus archivos y archivos adjuntos multimedia.';

  @override
  String get settings__dialog__webdav__title => 'Almacenamiento WebDAV';

  @override
  String get settings__dialog__webdav__preset_provider =>
      'Ajuste predefinido del proveedor';

  @override
  String get settings__dialog__webdav__server_url => 'URL del servidor';

  @override
  String get settings__dialog__webdav__server_url_hint =>
      'https://cloud.example.com/remote.php/dav/files/username/';

  @override
  String get settings__dialog__webdav__username => 'Nombre de usuario';

  @override
  String get settings__dialog__webdav__password =>
      'Contraseña / Contraseña de aplicación';

  @override
  String get settings__dialog__webdav__base_path =>
      'Ruta de la carpeta de almacenamiento';

  @override
  String get settings__dialog__webdav__base_path_helper =>
      'La ruta de la carpeta no se puede cambiar después de la configuración. Para cambiarla, desconéctate primero.';

  @override
  String get settings__dialog__webdav__advanced => 'Avanzado';

  @override
  String get settings__dialog__webdav__self_signed =>
      'Permitir certificados autofirmados / no seguros';

  @override
  String get settings__dialog__webdav__auto_clean =>
      'Limpiar automáticamente archivos inactivos después de 30 días';

  @override
  String get settings__dialog__webdav__auto_clean_subtitle =>
      'Dado que las credenciales de WebDAV permanecen privadas en tu dispositivo, los archivos remotos no se eliminan con la limpieza en la nube. Cuando está activado, los archivos multimedia con más de 30 días desde su última modificación se eliminarán de tu servidor WebDAV. Los clips en colecciones o bloqueados siempre están protegidos.';

  @override
  String get settings__dialog__webdav__test_conn => 'Probar conexión';

  @override
  String get settings__dialog__webdav__testing => 'Probando conexión...';

  @override
  String get settings__dialog__webdav__test_success => '¡Conexión exitosa!';

  @override
  String get settings__dialog__webdav__disconnect => 'Desconectar';

  @override
  String get settings__dialog__webdav__save => 'Guardar y conectar';

  @override
  String get settings__dialog__webdav__reconnect_title =>
      'Configuración de WebDAV';

  @override
  String get settings__dialog__webdav__reconnect_subtitle =>
      'WebDAV ya está conectado. ¿Actualizar configuración o desconectar?';

  @override
  String get settings__dialog__webdav__url_required =>
      'Por favor, introduce una URL de servidor WebDAV válida';

  @override
  String get settings__dialog__webdav__username_required =>
      'Por favor, introduce un nombre de usuario';

  @override
  String get settings__dialog__webdav__password_required =>
      'Por favor, introduce una contraseña o token de aplicación';

  @override
  String get settings__app_lock__title => 'Bloqueo de App';

  @override
  String get settings__app_lock__tile__subtitle =>
      'Requiere biometría o PIN del dispositivo para acceder al portapapeles';

  @override
  String get settings__app_lock__no_biometrics =>
      'No se encontró biometría ni credencial del dispositivo. Configure primero un PIN o biometría en los ajustes de su dispositivo.';

  @override
  String get settings__app_lock__lock_after__title => 'Bloquear después de';

  @override
  String get settings__app_lock__lock_after__subtitle =>
      'Bloquear automáticamente cuando la app pase al fondo';

  @override
  String get settings__app_lock__timeout__immediately => 'Inmediatamente';

  @override
  String settings__app_lock__timeout__minutes({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'minutos',
      one: 'minuto',
    );
    return '$count $_temp0';
  }

  @override
  String get app_lock__screen__locked => 'Bloqueado';

  @override
  String get app_lock__screen__unlock => 'Desbloquear';

  @override
  String get settings__lan__title => 'Red Local';

  @override
  String get settings__lan__service_inactive =>
      'Inicia el servicio en segundo plano para usar la sincronización LAN';

  @override
  String get settings__lan__subtitle__disabled =>
      'Sincroniza el portapapeles instantáneamente con dispositivos cercanos';

  @override
  String get settings__lan__subtitle__mobile =>
      'Servicio en segundo plano buscando dispositivos cercanos';

  @override
  String get settings__lan__searching => 'Buscando dispositivos…';

  @override
  String settings__lan__devices_found({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dispositivos encontrados',
      one: 'dispositivo encontrado',
    );
    return '$count $_temp0 en la red';
  }

  @override
  String get settings__auto_write__title => 'Escritura automática al recibir';

  @override
  String get settings__auto_write__subtitle =>
      'Copiar automáticamente los clips entrantes al portapapeles';

  @override
  String get settings__sync__manage_devices__title =>
      'Administrar dispositivos de sincronización';

  @override
  String get settings__sync__manage_devices__subtitle =>
      'Ver dispositivos activos y eliminar dispositivos del acceso de sincronización.';

  @override
  String get settings__lan_mesh__app_bar_title => 'Red Local';

  @override
  String get settings__lan_mesh__unknown_device => 'Dispositivo desconocido';

  @override
  String get settings__lan_mesh__searching =>
      'Buscando dispositivos en la red…';

  @override
  String get settings__lan_mesh__reachable => 'Alcanzable';

  @override
  String get settings__lan_mesh__unreachable => 'No alcanzable';

  @override
  String get settings__lan_mesh__disabled_banner =>
      'La sincronización LAN está desactivada. Actióvala en Configuración para descubrir dispositivos cercanos.';

  @override
  String get settings__device_mgmt__app_bar_title =>
      'Administrar dispositivos de sincronización';

  @override
  String get settings__device_mgmt__dialog_title =>
      'Eliminar acceso de sincronización';

  @override
  String get settings__device_mgmt__dialog_cancel => 'Cancelar';

  @override
  String get settings__device_mgmt__dialog_remove => 'Eliminar';

  @override
  String get settings__device_mgmt__revoke_failed =>
      'Error al eliminar el acceso de sincronización.';

  @override
  String get settings__device_mgmt__active_now => 'Activo ahora';

  @override
  String settings__device_mgmt__today_at({required String time}) {
    return 'Hoy a las $time';
  }

  @override
  String settings__device_mgmt__days_ago({required int count}) {
    return 'hace ${count}d';
  }

  @override
  String get settings__device_mgmt__load_failed =>
      'Error al cargar dispositivos.';

  @override
  String get settings__device_mgmt__retry => 'Reintentar';

  @override
  String get settings__device_mgmt__empty =>
      'No se encontraron dispositivos de sincronización.';

  @override
  String get settings__device_mgmt__max_limit_tooltip =>
      'Número máximo de dispositivos que puedes sincronizar con tu plan actual.';

  @override
  String settings__device_mgmt__max_limit_label({required int count}) {
    return 'Límite máx • $count';
  }

  @override
  String get settings__device_mgmt__active_count_tooltip =>
      'Número de dispositivos activos actualmente.';

  @override
  String settings__device_mgmt__active_count_label({required int count}) {
    return 'Activos • $count';
  }

  @override
  String settings__device_card__last_seen({required String time}) {
    return 'Visto por última vez: $time';
  }

  @override
  String get settings__device_card__revoke => 'Revocar';

  @override
  String get device_mgmt_verification_failed =>
      'No se pudo verificar el acceso al dispositivo de sincronización en este momento. Por favor, verifica tu conexión a Internet e inténtalo de nuevo.';

  @override
  String get device_mgmt_limit_reached =>
      'La sincronización está deshabilitada en este dispositivo porque se ha alcanzado el límite de dispositivos de tu plan. Elimina otro dispositivo en Configuración > Sincronización > Administrar dispositivos de sincronización.';

  @override
  String get custom_er__nav__1 => 'Aplicación';

  @override
  String get custom_er__nav__2 => 'Título de Ventana';

  @override
  String get custom_er__nav__3 => 'URL';

  @override
  String get custom_er__nav__4 => 'Patrón de Texto';

  @override
  String get custom_er__text__not_supported =>
      'Esta exclusión aún no es soportada';

  @override
  String get custom_er__tile__add_app => 'Agregar una aplicación';

  @override
  String get custom_er__text__no_app =>
      'No se ha excluido ninguna aplicación personalizada';

  @override
  String get custom_er__button__remove_app => 'Eliminar esta aplicación';

  @override
  String get custom_er__tile__pattern =>
      'Evitar copiar cuando el contenido copiado coincide con estos patrones';

  @override
  String get custom_er__text__no_pattern =>
      'No se han excluido patrones personalizados';

  @override
  String get custom_er__button__remove_pattern => 'Eliminar este patrón';

  @override
  String get custom_er__tile__url =>
      'Evitar copiar desde sitios web que coinciden con estos segmentos de URL.';

  @override
  String get custom_er__input__url_hint =>
      'Introduce una URL o parte de una URL aquí.';

  @override
  String get custom_er__text__no_url =>
      'No se han excluido URL(s) personalizadas';

  @override
  String get custom_er__button__remove_url => 'Eliminar esta URL';

  @override
  String get custom_er__tile__title =>
      'Evitar copiar de aplicación o sitio web cuando el título de la ventana coincide.';

  @override
  String get custom_er__text__no_title =>
      'No se han excluido título(s) personalizados';

  @override
  String get custom_er__button__remove_title => 'Eliminar este título';

  @override
  String get about__tile__discord => 'Discord • Conectar';

  @override
  String get about__tile__youtube => 'YouTube • Tutorial';

  @override
  String get about__tile__read_tut => 'Leer • Tutorial';

  @override
  String get about__tile__github => 'Github • Código abierto';

  @override
  String get about__tile__website => 'EntilityStudio • Sitio web';

  @override
  String get about__tile__support => 'Soporte';

  @override
  String get abc_title => 'Portapapeles en segundo plano';

  @override
  String get abc__tile__subtitle => 'Escucha el portapapeles en segundo plano';

  @override
  String get abc__tip__why_title => '¿Por qué se necesitan estos permisos?';

  @override
  String get abc__tip__why_subtitle =>
      'Estos permisos aseguran que CopyCat funcione correctamente en segundo plano, permitiéndole detectar el contenido copiado y brindarle una experiencia fluida sin interrupciones.';

  @override
  String get abc__heading__req_perm => 'Permisos requeridos';

  @override
  String get abc__tile__notification_title => 'Acceso a notificaciones';

  @override
  String get abc__tile__notification_subtitle =>
      'Muestra una notificación persistente para informarle que CopyCat está funcionando en segundo plano, garantizando transparencia y privacidad.';

  @override
  String get abc__tile__battery_opt_title => 'Optimización de batería';

  @override
  String get abc__tile__battery_opt_subtitle =>
      'Evita que el sistema apague CopyCat mientras funciona en segundo plano, asegurando una experiencia fluida.';

  @override
  String get abc__tile__overlay_title => 'Permiso de superposición';

  @override
  String get abc__tile__overlay_subtitle =>
      'Permite que CopyCat lea el portapapeles abriendo brevemente una ventana transparente sobre la pantalla y cerrándola inmediatamente después.';

  @override
  String get abc__tile__acc_title => 'Servicio de accesibilidad';

  @override
  String get abc__tile__acc_subtitle =>
      'Inicia el oyente en segundo plano de CopyCat para detectar cuando copias algo y asegura que el servicio se reinicie automáticamente después de un reinicio.';

  @override
  String get abc__ack__ready => 'Configuración lista para ser configurada.';

  @override
  String get abc__ack__preparing =>
      'Preparando configuración, por favor espere...';

  @override
  String get abc__perm_alert_open_setting__button => 'Abrir configuración';

  @override
  String get abc__overlay_perm_alert__title => 'Permiso de superposición';

  @override
  String get abc__overlay_perm_alert__subtitle =>
      'CopyCat Clipboard necesita el permiso \'Dibujar sobre otras aplicaciones\' para leer el contenido del portapapeles en segundo plano.';

  @override
  String get abc__overlay_perm_alert__p1_prefix => 'Este permiso se ';

  @override
  String get abc__overlay_perm_alert__p1_bold =>
      'usa solo para la detección del portapapeles';

  @override
  String get abc__overlay_perm_alert__p1_suffix =>
      ' cuando copias algo en segundo plano.';

  @override
  String get abc__overlay_perm_alert__p2_prefix =>
      'Cuando está habilitado, CopyCat ';

  @override
  String get abc__overlay_perm_alert__p2_bold =>
      'crea una ventana transparente de 0 píxeles';

  @override
  String get abc__overlay_perm_alert__p2_suffix =>
      ' para llevar brevemente la aplicación al primer plano y leer los datos del portapapeles.';

  @override
  String get abc__overlay_perm_alert__p3_prefix => 'La aplicación ';

  @override
  String get abc__overlay_perm_alert__p3_bold => 'no muestra nada';

  @override
  String get abc__overlay_perm_alert__p3_suffix =>
      ' en tu pantalla durante este proceso.';

  @override
  String get abc__overlay_perm_alert__p4_prefix =>
      'En algunos dispositivos, el sistema puede mostrar un mensaje emergente ';

  @override
  String get abc__overlay_perm_alert__p4_bold =>
      '\'CopyCat pegó desde tu portapapeles\'';

  @override
  String get abc__overlay_perm_alert__p4_suffix =>
      ' cuando CopyCat lee el contenido de tu portapapeles.';

  @override
  String get abc__overlay_perm_alert__agree =>
      'Al otorgar este permiso, aceptas el uso descrito anteriormente.';

  @override
  String get abc__accessibility_perm_alert__title => 'Permiso de accesibilidad';

  @override
  String get abc__accessibility_perm_alert__subtitle =>
      'CopyCat Clipboard requiere el Servicio de Accesibilidad para funcionar en segundo plano y detectar y sincronizar el portapapeles en tiempo real.';

  @override
  String get abc__accessibility_perm_alert__p1_prefix => 'Este servicio se ';

  @override
  String get abc__accessibility_perm_alert__p1_bold => 'usa únicamente';

  @override
  String get abc__accessibility_perm_alert__p1_suffix =>
      ' para detectar el contenido del portapapeles y sincronizarlo entre dispositivos cuando está habilitado.';

  @override
  String get abc__accessibility_perm_alert__p2_prefix => 'Puedes ';

  @override
  String get abc__accessibility_perm_alert__p2_bold =>
      'excluir aplicaciones específicas';

  @override
  String get abc__accessibility_perm_alert__p2_suffix =>
      ' usando la función de Reglas de Exclusión.';

  @override
  String get abc__accessibility_perm_alert__p3_prefix => 'La aplicación ';

  @override
  String get abc__accessibility_perm_alert__p3_bold =>
      'no accede a ningún otro dato';

  @override
  String get abc__accessibility_perm_alert__p3_suffix =>
      ' más allá del contenido del portapapeles.';

  @override
  String get abc__accessibility_perm_alert__p4_prefix =>
      'Los datos del portapapeles ';

  @override
  String get abc__accessibility_perm_alert__p4_bold =>
      'no se comparten externamente';

  @override
  String get abc__accessibility_perm_alert__p4_suffix =>
      ' y permanecen privados en tus dispositivos.';

  @override
  String get abc__accessibility_perm_alert__p5_prefix =>
      'Los datos del portapapeles ';

  @override
  String get abc__accessibility_perm_alert__p5_bold =>
      'están cifrados de extremo a extremo';

  @override
  String get abc__accessibility_perm_alert__p5_suffix =>
      ' (si está habilitado) en tránsito y en reposo, garantizando la privacidad entre dispositivos.';

  @override
  String get abc__accessibility_perm_alert__agree =>
      'Al habilitar el Servicio de Accesibilidad, reconoces y aceptas los términos anteriores.';

  @override
  String get abc__other_setting__title => 'Otras configuraciones';

  @override
  String get abc__tile__two_way_sync__title => 'Sincronización bidireccional';

  @override
  String abc__tile__two_way_sync__subtitle({required String warning}) {
    return 'Mantiene tu portapapeles sincronizado entre dispositivos al instante.\n$warning';
  }

  @override
  String get abc__tile__two_way_sync__realtime_required =>
      '⚠️ Se requiere modo en tiempo real.';

  @override
  String get abc__ack__detection_mode_cleared => 'Modo de detección borrado';

  @override
  String get abc__ack__detection_mode_updated =>
      'Modo de detección actualizado';

  @override
  String abc__ack__detection_mode_update_failed({required String message}) {
    return 'No se pudo actualizar el modo de detección: $message';
  }

  @override
  String get abc__detection_mode__title => 'Modo de detección';

  @override
  String get abc__detection_mode__subtitle__enabled =>
      'Elige cómo CopyCat detecta las acciones de copia en otras aplicaciones. CopyCat permanece inactivo hasta que elijas un modo.';

  @override
  String get abc__detection_mode__subtitle__disabled =>
      'Activa primero el servicio de accesibilidad y luego elige un modo de detección.';

  @override
  String get abc__detection_mode__mode_1 => 'Eficiente';

  @override
  String get abc__detection_mode__mode_2 => 'Máxima compatibilidad';

  @override
  String get abc__network__header => 'Red';

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
    return 'Actualmente tienes $count clips cifrados a los que no se puede acceder.';
  }

  @override
  String get encrypted_stat__all_decrypted =>
      '🥳 ¡Felicidades! Todos tus clips se han descifrado correctamente de forma local, por lo que no es necesario reconstruir la base de datos.';

  @override
  String get encrypted_stat__rebuild_database => 'Reconstruir base de datos';

  @override
  String tray__tooltip__paused_till({required String time}) {
    return 'CopyCat Clipboard - En pausa hasta $time';
  }

  @override
  String get tray__menu__resume_copycat => 'Reanudar';

  @override
  String get tray__menu__pause_copycat => 'Pausar';

  @override
  String get tray__menu__paste_stack => 'Paste Stack';

  @override
  String get tray__menu__restart_app => 'Reiniciar';

  @override
  String get tray__dialog__quit__subtitle =>
      '¿Seguro que quieres salir de la aplicación?';

  @override
  String get splash__checking_authentication => 'Comprobando autenticación...';

  @override
  String paste_stack__title({required int count}) {
    return 'Paste Stack • $count';
  }

  @override
  String get paste_stack__reorder_hint =>
      'Puedes arrastrar los elementos para reordenarlos.';

  @override
  String get paste_stack__reverse_tooltip => 'Invertir pila';

  @override
  String paste_stack__limit_note({required int count}) {
    return 'Tienes un límite de $count elementos';
  }

  @override
  String get multi_paste__title => 'Configuración del pegado múltiple';

  @override
  String get multi_paste__subtitle =>
      'Controla cómo se combinan y temporizan los clips seleccionados.';

  @override
  String get multi_paste__stat__selected => 'Seleccionados';

  @override
  String get multi_paste__stat__text => 'Texto';

  @override
  String get multi_paste__stat__non_text => 'Contenido no textual';

  @override
  String get multi_paste__merge__title =>
      'Combinar clips de texto consecutivos';

  @override
  String get multi_paste__merge__subtitle =>
      'Los clips de texto se combinan hasta que un clip no textual interrumpe la secuencia.';

  @override
  String get multi_paste__separator__title => 'Separador';

  @override
  String get multi_paste__separator__new_line => 'Nueva línea';

  @override
  String get multi_paste__separator__space => 'Espacio';

  @override
  String get multi_paste__separator__custom => 'Personalizado';

  @override
  String get multi_paste__separator__custom_label => 'Separador personalizado';

  @override
  String get multi_paste__separator__custom_hint =>
      'Admite secuencias de escape como \\n y \\t';

  @override
  String get multi_paste__pacing__title => 'Temporización del pegado';

  @override
  String get multi_paste__pacing__subtitle =>
      'Aumenta el retraso si la app de destino pierde eventos de pegado.';

  @override
  String get multi_paste__wait_between_pastes => 'Intervalo entre pegados';

  @override
  String get multi_paste__validation__wait_positive =>
      'El tiempo de espera debe ser un número positivo.';

  @override
  String get multi_paste__validation__custom_separator_required =>
      'Introduce un separador personalizado.';

  @override
  String get settings__tile__backup_restore__title =>
      'Copia de seguridad y restauración';

  @override
  String get settings__tile__backup_restore__subtitle =>
      'Crea copias .ccbkup y restaura localmente';

  @override
  String get settings__switch__rich_data_capture__title =>
      'Captura de datos enriquecidos';

  @override
  String get settings__switch__rich_data_capture__subtitle =>
      'Mantén el formato al copiar y pegar entre aplicaciones.';

  @override
  String get settings__decrypt__title => 'Descifrado del portapapeles';

  @override
  String settings__decrypt__count({required int count}) {
    return 'Actualmente tienes $count clips cifrados de forma local.';
  }

  @override
  String settings__decrypt__progress({
    required int decrypted,
    required int total,
  }) {
    return 'Descifrados: $decrypted de $total clips.';
  }

  @override
  String get settings__decrypt__warning =>
      '⚠️ Mantén esta pantalla abierta durante este proceso para evitar corrupción de datos o inconsistencias.';

  @override
  String get not_found__title => 'Página no encontrada';

  @override
  String get not_found__subtitle => 'No se encontró la página que buscas.';

  @override
  String get not_found__go_home => 'Ir al inicio';

  @override
  String get backup_restore__dialog__save_as => 'Guardar copia como';

  @override
  String get backup_restore__busy__creating => 'Creando copia de seguridad...';

  @override
  String get backup_restore__error__encryption_unavailable =>
      'El cifrado está habilitado pero actualmente no está disponible. Desbloquea E2EE e inténtalo de nuevo.';

  @override
  String backup_restore__snackbar__saved({required String outputPath}) {
    return 'Copia de seguridad guardada en $outputPath';
  }

  @override
  String backup_restore__snackbar__create_failed({required String message}) {
    return 'Error al crear la copia de seguridad: $message';
  }

  @override
  String get backup_restore__dialog__select_file =>
      'Seleccionar archivo de copia de seguridad';

  @override
  String get backup_restore__dialog__restore_title =>
      'Restaurar copia de seguridad';

  @override
  String get backup_restore__dialog__restore_subtitle =>
      'Introduce la contraseña si esta copia está protegida.';

  @override
  String get backup_restore__dialog__restore_action => 'Restaurar';

  @override
  String get backup_restore__busy__restoring =>
      'Restaurando copia de seguridad...';

  @override
  String backup_restore__snackbar__restore_completed({
    required int clips,
    required int collections,
  }) {
    return 'Restauración completada: $clips clips, $collections colecciones.';
  }

  @override
  String backup_restore__snackbar__restore_failed({required String message}) {
    return 'Error en la restauración: $message';
  }

  @override
  String get backup_restore__error__select_clip_type =>
      'Selecciona al menos un tipo de clip.';

  @override
  String get backup_restore__error__from_after_to =>
      'La fecha Desde debe ser anterior a la fecha Hasta.';

  @override
  String get backup_restore__dialog__options__description =>
      'Elige qué incluir en este archivo de copia de seguridad.';

  @override
  String get backup_restore__section__clip_types => 'Tipos de clip';

  @override
  String get backup_restore__section__cached_files => 'Archivos en caché';

  @override
  String get backup_restore__input__max_cached_file_size =>
      'Tamaño máximo de archivo en caché (MB)';

  @override
  String get backup_restore__input__max_cached_file_size__hint =>
      'Opcional, p. ej. 50';

  @override
  String get backup_restore__error__positive_number =>
      'Introduce un número positivo.';

  @override
  String get backup_restore__text__select_file_media_for_cache_limit =>
      'Selecciona tipos de clip Archivo o Multimedia para configurar un tamaño máximo de caché.';

  @override
  String get backup_restore__section__date_range => 'Rango de fechas';

  @override
  String get backup_restore__from_date => 'Fecha desde';

  @override
  String get backup_restore__to_date => 'Fecha hasta';

  @override
  String get backup_restore__no_minimum_date => 'Sin fecha mínima';

  @override
  String get backup_restore__no_maximum_date => 'Sin fecha máxima';

  @override
  String get backup_restore__clear_date_filter => 'Limpiar filtro de fecha';

  @override
  String get backup_restore__section__security => 'Seguridad';

  @override
  String get backup_restore__toggle__password_protect =>
      'Proteger copia con contraseña';

  @override
  String get backup_restore__input__password => 'Contraseña';

  @override
  String get backup_restore__input__password__hint => 'Al menos 6 caracteres';

  @override
  String get backup_restore__error__password_min_length =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get backup_restore__dialog__create_manual_title =>
      'Crear copia de seguridad manual';

  @override
  String get backup_restore__appbar__title =>
      'Copia de seguridad y restauración';

  @override
  String get backup_restore__card__title => 'Copia y restauración manual';

  @override
  String get backup_restore__card__subtitle =>
      'Crea archivos .ccbkup locales con protección opcional por contraseña y restáuralos localmente con deduplicación de mejor esfuerzo.';

  @override
  String get backup_restore__actions__title => 'Acciones';

  @override
  String get backup_restore__button__create => 'Crear copia de seguridad';

  @override
  String get backup_restore__button__restore => 'Restaurar copia de seguridad';

  @override
  String get backup_restore__snapshot__backup_title =>
      'Último resumen de la copia de seguridad';

  @override
  String get backup_restore__snapshot__restore_title =>
      'Último resumen de restauración';

  @override
  String get backup_restore__snapshot__restore_subtitle =>
      'Deduplicación de mejor esfuerzo e informe de integridad';

  @override
  String get backup_restore__empty_session =>
      'Aún no se ha ejecutado ninguna copia o restauración en esta sesión.';

  @override
  String get backup_restore__label__collections => 'Colecciones';

  @override
  String get backup_restore__label__clips => 'Clips';

  @override
  String get backup_restore__label__files_included => 'Archivos incluidos';

  @override
  String get backup_restore__label__files_missing => 'Archivos faltantes';

  @override
  String get backup_restore__label__files_skipped_by_size =>
      'Omitidos por tamaño';

  @override
  String get backup_restore__label__encrypted_clips => 'Clips cifrados';

  @override
  String get backup_restore__label__collections_restored =>
      'Colecciones restauradas';

  @override
  String get backup_restore__label__collections_duplicates =>
      'Colecciones duplicadas';

  @override
  String get backup_restore__label__collections_failed =>
      'Colecciones fallidas';

  @override
  String get backup_restore__label__clips_restored => 'Clips restaurados';

  @override
  String get backup_restore__label__clips_duplicates => 'Clips duplicados';

  @override
  String get backup_restore__label__clips_failed => 'Clips fallidos';

  @override
  String get backup_restore__label__attachments_restored =>
      'Adjuntos restaurados';

  @override
  String get backup_restore__label__attachments_missing => 'Adjuntos faltantes';

  @override
  String get backup_restore__label__attachments_failed => 'Adjuntos fallidos';

  @override
  String get backup_restore__label__corrupt_entries => 'Entradas corruptas';

  @override
  String get subscription__loading => 'Cargando...';

  @override
  String get review__dialog__title => '¿Te está gustando CopyCat?';

  @override
  String get review__dialog__message =>
      'Una valoración rápida ayuda a que más personas descubran CopyCat y permite seguir lanzando funciones nuevas.';

  @override
  String get review__dialog__never => 'Nunca';

  @override
  String get review__dialog__remind_later => 'Recuérdamelo en 7 días';

  @override
  String get review__dialog__rate_now => 'Valorar ahora';

  @override
  String get settings__tile__review__title => 'Valorar CopyCat';

  @override
  String get settings__tile__review__subtitle =>
      'Deja una reseña en la App Store';

  @override
  String get collections__read_only__banner =>
      'Solo lectura en tu plan actual. Mejora para editar esta colección.';

  @override
  String get collections__read_only__toast =>
      'Esta colección es de solo lectura en tu plan actual. Mejora para editar todas las colecciones.';

  @override
  String get collections__read_only__upgrade_action => 'Mejorar';

  @override
  String get collections__locked_section__label => 'Bloqueado';

  @override
  String get transform__section__text_core => 'Texto básico';

  @override
  String get transform__section__text_utilities => 'Utilidades de texto';

  @override
  String get transform__section__struct => 'Estructura';

  @override
  String get transform__section__urls => 'URLs';

  @override
  String get transform__section__colors => 'Colores';

  @override
  String get transform__section__emails_phones => 'Correos / Teléfonos';

  @override
  String get transform__section__structured_text => 'Texto estructurado';

  @override
  String get transform__label__uppercase => 'Mayúsculas';

  @override
  String get transform__label__lowercase => 'Minúsculas';

  @override
  String get transform__label__capitalize => 'Primera en mayúscula';

  @override
  String get transform__label__trim_whitespace => 'Eliminar espacios';

  @override
  String get transform__label__remove_line_breaks => 'Eliminar saltos de línea';

  @override
  String get transform__label__normalize_spaces => 'Normalizar espacios';

  @override
  String get transform__label__reverse_text => 'Invertir texto';

  @override
  String get transform__label__deduplicate_lines =>
      'Eliminar líneas duplicadas';

  @override
  String get transform__label__json_prettify => 'JSON → formatear';

  @override
  String get transform__label__json_minify => 'JSON → minimizar';

  @override
  String get transform__label__url_encode => 'Codificar URL';

  @override
  String get transform__label__url_decode => 'Decodificar URL';

  @override
  String get transform__label__base64_encode => 'Codificar en Base64';

  @override
  String get transform__label__base64_decode => 'Decodificar Base64';

  @override
  String get transform__label__remove_tracking_params =>
      'Eliminar rastreadores';

  @override
  String get transform__label__extract_domain => 'Extraer dominio';

  @override
  String get transform__label__hex_to_rgb => 'HEX → RGB';

  @override
  String get transform__label__rgb_to_hex => 'RGB → HEX';

  @override
  String get transform__label__hex_to_hsl => 'HEX → HSL';

  @override
  String get transform__label__copy_cleaned => 'Copiar limpio';

  @override
  String get transform__label__extract_emails => 'Extraer correos';

  @override
  String get transform__label__extract_urls => 'Extraer URLs';

  @override
  String get transform__label__extract_numbers => 'Extraer números';

  @override
  String get transfer__scan_qr => 'Escanear código QR';

  @override
  String get transfer__show_qr => 'Mostrar código QR';

  @override
  String get transfer__enter_passcode => 'Introducir código de acceso';

  @override
  String get transfer__six_digit_passcode => 'Código de acceso de 6 dígitos';

  @override
  String get transfer__securely_transfer_via_qr =>
      'Transferir de forma segura a un dispositivo cercano mediante QR (Recomendado)';

  @override
  String get transfer__nearby_device => 'Transferir a dispositivo cercano';

  @override
  String get transfer__scan_qr_and_enter_passcode =>
      'Escanea este código QR en tu otro dispositivo y luego introduce el código de acceso.';

  @override
  String get transfer__enter_passcode_on_other_device =>
      'Introduce este código de acceso en el otro dispositivo.';

  @override
  String get transfer__show_passcode => 'Mostrar código de acceso';

  @override
  String get transfer__device_has_no_camera_use_file_import =>
      'Este dispositivo no tiene cámara. Usa la opción de importar archivo en su lugar.';

  @override
  String get transfer__scan_qr_from_other_device =>
      'Escanea el código QR desde tu otro dispositivo.';

  @override
  String get settings__personal_drive__title => 'Unidad Personal';

  @override
  String get settings__personal_drive__subtitle =>
      'Sincroniza tus clips de archivos con tu nube personal para una copia de seguridad segura y acceso desde varios dispositivos.';
}
