// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get app__name => 'CopyCat Clipboard';

  @override
  String get app__slogan => 'Um Clipboard, Possibilidades Ilimitadas';

  @override
  String get app__start_indexing => 'Iniciar Indexação';

  @override
  String get app__stop_indexing => 'Detener Indexação';

  @override
  String get app__image_not_found => 'Imagem não encontrada';

  @override
  String get app__unknown_error => 'Ocorreu um erro inesperado';

  @override
  String get app__downloading => 'Baixando...';

  @override
  String get app__download => 'Baixar';

  @override
  String get app__follow_link => 'Seguir Link';

  @override
  String get app__edit => 'Editar';

  @override
  String get app__export => 'Exportar';

  @override
  String get app__delete => 'Excluir';

  @override
  String get app__later => 'Pular';

  @override
  String get app__select => 'Selecionar';

  @override
  String get app__change => 'Alterar';

  @override
  String get app__confirm => 'Confirmar';

  @override
  String get app__action_required => 'Ação Requerida';

  @override
  String get app__feature_unavailable =>
      'Este recurso não está disponível para a sua plataforma.';

  @override
  String get app__preview => 'Pré-visualizar';

  @override
  String get app__open_file => 'Abrir arquivo';

  @override
  String get app__change_collection => 'Mudar Coleção';

  @override
  String get app__no_name => 'Sem Nome';

  @override
  String get app__share => 'Compartilhar';

  @override
  String get app__clip_actions => 'Ações do clipe';

  @override
  String get app__copy_content => 'Copiar conteúdo';

  @override
  String get app__paste_content => 'Colar conteúdo';

  @override
  String get app__loading => 'Carregando...';

  @override
  String get app__uploading => 'Carregando...';

  @override
  String get app__syncing => 'Sincronizando...';

  @override
  String app__sync_cooldown({required String time}) {
    return 'A sincronização está em período de espera. Por favor, aguarde $time antes de sincronizar novamente.';
  }

  @override
  String get app__sync => 'Sincronizar';

  @override
  String get app__queued => 'Na fila';

  @override
  String get app__local => 'Local';

  @override
  String get app__utc => 'UTC';

  @override
  String get app__send_message => 'Enviar Mensagem';

  @override
  String get app__send_email => 'Enviar E-mail';

  @override
  String get app__empty_clipboard => 'Seu clipboard está vazio.';

  @override
  String get app__load_more => 'Carregar Mais';

  @override
  String get app__more => 'Mais';

  @override
  String get app__search => 'Buscar';

  @override
  String get app__no_results => 'Nenhum resultado encontrado';

  @override
  String get app__locale_en => 'Inglês';

  @override
  String get app__locale_es => 'Espanhol';

  @override
  String get app__locale_fr => 'Francês';

  @override
  String get app__locale_de => 'Alemão';

  @override
  String get app__locale_zh => 'Chinês';

  @override
  String get app__locale_pt => 'Português';

  @override
  String get app__language => 'Idioma';

  @override
  String get app__yes => 'Sim';

  @override
  String get app__no => 'Não';

  @override
  String get app__quit => 'Sair';

  @override
  String get app__clear => 'Limpar';

  @override
  String get app__reset => 'Redefinir';

  @override
  String get app__continue => 'Continuar';

  @override
  String get app__paste => 'Colar';

  @override
  String get app__copycat_logo => 'Logo do CopyCat';

  @override
  String get app__logout => 'Sair';

  @override
  String get app__no_collection => 'Nenhuma coleção encontrada';

  @override
  String get app__create_collection => 'Criar Coleção';

  @override
  String get app__create => 'Criar';

  @override
  String get app__pro_tip => 'Dica Pro';

  @override
  String get app__try_again => 'Tente Novamente';

  @override
  String get app__realtime_connected => 'Conectado em tempo real';

  @override
  String get app__realtime_disconnected => 'Desconectado em tempo real';

  @override
  String get app__realtime_connecting => 'Conectando em tempo real...';

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
    return 'Recebido de $device';
  }

  @override
  String get app__ack__excluded => 'Excluído';

  @override
  String app__ack__excluded_with_reason({required String reason}) {
    return 'Excluído • $reason';
  }

  @override
  String get app__ack__reason_phone => 'Telefone';

  @override
  String get app__ack__reason_email => 'E-mail';

  @override
  String get app__ack__reason_credit_card => 'Cartão de crédito';

  @override
  String get app__ack__reason_sensitive_url => 'URL confidencial';

  @override
  String get app__ack__reason_app => 'Aplicativo confidencial';

  @override
  String get app__ack__reason_pattern => 'Padrão';

  @override
  String get app__ack__reason_title => 'Janela confidencial';

  @override
  String get app__ack__pasted => 'Colado';

  @override
  String get app__ack__pasting => 'Colando';

  @override
  String get app__ack__done => 'Concluído';

  @override
  String get app__ack__quit_app => 'Fechar Aplicativo';

  @override
  String get app__ack__deleted => 'Excluído';

  @override
  String get app__ack__internet_connected => 'Internet Conectada';

  @override
  String get app__ack__internet_disconnected => 'Internet Desconectada';

  @override
  String get app__ack__logout_success => 'Você saiu com sucesso.';

  @override
  String get app__ack__no_app_for_file =>
      'Nenhum aplicativo encontrado para abrir este arquivo.';

  @override
  String get app__ack__perm_fail_to_open_file =>
      'Permissão para abrir este arquivo não concedida.';

  @override
  String get app__ack__missing_e2e_setup =>
      'Configuração de criptografia ausente';

  @override
  String app__ack__failed_to_sync({
    required String entityType,
    required String message,
  }) {
    return 'Falha ao sincronizar $entityType: $message';
  }

  @override
  String app__index_pending({required int total}) {
    return '⚠️ Indexar $total clipes para torná-los pesquisáveis. Isso leva apenas um momento.';
  }

  @override
  String get app__indexing_completed =>
      '🎉 Indexação concluída. Seus clipes agora são pesquisáveis.';

  @override
  String get dialog__delete_clip__title => 'Excluir Clip';

  @override
  String dialog__delete_clip__subtitle({required int itemCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      other: 'Tem certeza de que deseja excluir estes clips?',
      one: 'Tem certeza de que deseja excluir este clip?',
    );
    return '$_temp0';
  }

  @override
  String get dialog__e2e__title => 'Criptografia de Ponta a Ponta';

  @override
  String get dialog__text__e2e_key_export =>
      'Parabéns, você configurou com sucesso a criptografia ponta a ponta.';

  @override
  String get dialog__text__e2e_key_export__note =>
      'Clique no botão abaixo para exportar sua chave de criptografia.\nSalve a chave em um local seguro para garantir que você possa configurar outros dispositivos para acessar suas informações criptografadas.';

  @override
  String get dialog__text__e2e_key_generate =>
      'Gere uma chave de criptografia e armazene-a com segurança. Esta chave é necessária para configurar outros dispositivos para acessar seus dados criptografados.';

  @override
  String get dialog__button__e2e_generating_key => 'Gerando';

  @override
  String get dialog__button__e2e_generate_key => 'Gerado';

  @override
  String get dialog__text__invalid_e2e_key => 'A chave importada é inválida!';

  @override
  String get dialog__text__e2e_key_import__note =>
      'Importe sua chave de criptografia abaixo para acessar seus dados criptografados neste dispositivo.';

  @override
  String get dialog__button__e2e_importing_key => 'Importando';

  @override
  String get dialog__button__e2e_import_key => 'Importar';

  @override
  String get dialog__button__e2e_clear_key => 'Limpar chave';

  @override
  String get dialog__title__e2e_clear_key => 'Limpar chave de criptografia';

  @override
  String get dialog__text__e2e_clear_key__confirm =>
      'Tem certeza de que deseja remover a chave de criptografia deste dispositivo? Você não poderá descriptografar clipes criptografados até importar a chave novamente.';

  @override
  String get dialog__text__inconsistent_time__title =>
      'Aviso de Sincronização de Tempo';

  @override
  String get dialog__text__inconsistent_time__content =>
      'Tempo Inconsistente Detectado no Dispositivo\n\nPara garantir uma sincronização precisa do clipboard, por favor, verifique e corrija as configurações de hora do seu dispositivo.\n\nConfigurações de tempo inconsistente podem causar problemas de sincronização.';

  @override
  String get dialog__text__inconsistent_time__still_off =>
      'O relógio ainda está dessincronizado. Atualize a hora do sistema manualmente.';

  @override
  String get dialog__text__inconsistent_time__ntp_unreachable =>
      'Não foi possível acessar o servidor de horário. Verifique sua conexão com a internet e sincronize o relógio manualmente.';

  @override
  String get dialog__text__inconsistent_time__check_failed =>
      'Falha na verificação do horário. Atualize o relógio do sistema manualmente.';

  @override
  String get dialog__button__try_again => 'Verificar Novamente';

  @override
  String get dialog__button__try_fix => 'Tentar Corrigir';

  @override
  String get dialog__record_keys__title => 'Registrar Atalho de Teclado';

  @override
  String get dialog__record_keys__subtitle =>
      'Digite seu atalho usando seu teclado e clique ';

  @override
  String dialog__delete_collection__title({required String collectionName}) {
    return 'Excluir $collectionName';
  }

  @override
  String get dialog__delete_collection__subtitle =>
      'Você tem certeza que deseja excluir esta coleção?';

  @override
  String get dialog__ack__sub_updated => 'Assinatura Atualizada';

  @override
  String get dialog__grant_entitlement__title => 'Direito Concedido';

  @override
  String get dialog__grant_entitlement__subtitle_p1 =>
      'Códigos de Direitos concedidos são compartilhados com indivíduos específicos para direitos personalizados. Você pode verificar se os convites ainda estão disponíveis ';

  @override
  String get dialog__grant_entitlement__subtitle_p2 => 'Clicando Aqui.';

  @override
  String get dialog__grant_entitlement__enter_code =>
      'Digite o código e pressione Enviar';

  @override
  String get dialog__grant_entitlement__code_label => 'Código';

  @override
  String get dialog__grant_entitlement__apply_code => 'Aplicar';

  @override
  String get view_button__switch_to_grid => 'Mudar para Layout de Grade';

  @override
  String get view_button__switch_to_list => 'Mudar para Layout de Lista';

  @override
  String get view_button__change_view => 'Alterar Visualização';

  @override
  String get view_button__view_window => 'Em Janela';

  @override
  String get view_button__view_dock_right => 'Ancorar à Direita';

  @override
  String get view_button__view_dock_bottom => 'Ancorar em Baixo';

  @override
  String get view_button__view_dock_left => 'Ancorar à Esquerda';

  @override
  String get view_button__view_dock_top => 'Ancorar no Topo';

  @override
  String get view_button__pin => 'Fixar no topo';

  @override
  String get view_button__unpin => 'Desfixar';

  @override
  String get sub_dialog__text__included => 'Incluído';

  @override
  String get sub_dialog__f1__title => 'Itens Ilimitados no Clipboard';

  @override
  String get sub_dialog__f1__subtitle =>
      'Nunca fique sem espaço com itens ilimitados no clipboard, garantindo que você sempre tenha acesso ao que copiou recentemente.';

  @override
  String get sub_dialog__f2__title =>
      'Suporte a todas as plataformas principais';

  @override
  String get sub_dialog__f2__subtitle =>
      'Sincronize sem emenda em todas as plataformas principais—Android, iOS, Windows, macOS e Linux —para uma produtividade ininterrupta em qualquer lugar.';

  @override
  String get sub_dialog__f3__title => 'Suporta Apple Universal Clipboard';

  @override
  String get sub_dialog__f3__subtitle =>
      'Transfira sem esforço o conteúdo do clipboard entre seus dispositivos Apple com suporte ao Apple Universal Clipboard.';

  @override
  String get sub_dialog__f4__title => 'Armazenamento no Dispositivo';

  @override
  String get sub_dialog__f4__subtitle =>
      'Mantenha seus dados seguros com armazenamento no dispositivo, garantindo que seus itens no clipboard estejam sempre ao seu alcance e sob seu controle.';

  @override
  String get sub_dialog__f5__title => 'Integração com Google Drive';

  @override
  String get sub_dialog__f5__subtitle =>
      'Armazene arquivos e mídias com segurança no Google Drive, integrando-se perfeitamente ao CopyCat Clipboard para um gerenciamento aprimorado de dados.';

  @override
  String get sub_dialog__f6__title => 'Busca Instantânea';

  @override
  String get sub_dialog__f6__subtitle =>
      'Encontre o que você precisa instantaneamente com poderosas capacidades de busca instantânea, tornando a recuperação dos itens do clipboard rápida e eficiente.';

  @override
  String get sub_dialog__f7__title => 'Sincronizando Até as Últimas 24 Horas';

  @override
  String get sub_dialog__f7__subtitle =>
      'Acesse e sincronize o histórico do seu clipboard em todos os seus dispositivos nas últimas 24 horas. Isso garante que você nunca perca itens importantes que copiou, tornando seu fluxo de trabalho perfeito e eficiente.';

  @override
  String get sub_dialog__f8__title => 'Até 3 Coleções';

  @override
  String get sub_dialog__f8__subtitle =>
      'Organize os itens do seu clipboard em até 3 coleções, proporcionando uma categorização simples para um melhor gerenciamento do fluxo de trabalho.';

  @override
  String get sub_dialog__f9__title => 'Sincronização em segundo plano';

  @override
  String get sub_dialog__f9__subtitle =>
      'A sincronização gratuita funciona com base no melhor esforço e pode levar até 15 minutos, dependendo da carga dos servidores.';

  @override
  String get sub_dialog__f10__title =>
      'Suporte à Criptografia de Ponta a Ponta';

  @override
  String get sub_dialog__f10__subtitle =>
      'A criptografia ponta a ponta tornará tudo criptografado para uma privacidade superior.';

  @override
  String get sub_dialog__text__pro_title => 'Com PRO';

  @override
  String get sub_dialog__text__pro_subtitle => 'Tudo incluído no Grátis +';

  @override
  String get sub_dialog__f11__title => 'Até 50 Coleções';

  @override
  String get sub_dialog__f11__subtitle =>
      'Organize os itens do seu clipboard em até 50 coleções para um gerenciamento definitivo.';

  @override
  String get sub_dialog__f12__title => 'Sincronizando Até os Últimos 30 Dias';

  @override
  String get sub_dialog__f12__subtitle =>
      'O histórico do clipboard é sincronizado em todos os seus dispositivos para clips criados nos últimos 30 dias. Isso significa que você pode acessar qualquer clip que copiou no mês passado, independentemente de qual dispositivo você está usando.';

  @override
  String get sub_dialog__f13__title => 'Sincronização em Tempo Real';

  @override
  String get sub_dialog__f13__subtitle =>
      'Experimente a sincronização em tempo real.';

  @override
  String get sub_dialog__f14__title => 'Suporte Rápido e Prioritário';

  @override
  String get sub_dialog__f14__subtitle =>
      'Obtenha suporte rápido e prioritário como um usuário PRO.';

  @override
  String get sub_dialog__f15__title => 'Acesso Antecipado a Novos Recursos';

  @override
  String get sub_dialog__f15__subtitle =>
      'Seja o primeiro a experimentar novos recursos e atualizações.';

  @override
  String get sub_dialog__f16__title => 'Regras de Exclusão Personalizadas';

  @override
  String get sub_dialog__f16__subtitle =>
      'Controle preciso sobre o seu clipboard. Permite que você defina o que copiar, de onde copiar e quando copiar.';

  @override
  String get sub_dialog__f17__title => 'Arrastar & Soltar';

  @override
  String get sub_dialog__f17__subtitle =>
      'Mova itens de forma fluida em qualquer direção nos seus dispositivos Desktop e Tablet.';

  @override
  String get sub_dialog__f18__title => 'Tematização';

  @override
  String get sub_dialog__f18__subtitle =>
      'Personalize todo o visual e a sensação do aplicativo para corresponder às suas preferências.';

  @override
  String get paywall_dialog__text__month => 'mês';

  @override
  String get paywall_dialog__text__year => 'ano';

  @override
  String get paywall_dialog__text__subscription => 'Assinatura';

  @override
  String get paywall_dialog__text__supported_platform =>
      'Para acessar os recursos premium no CopyCat Clipboard, por favor, assine através da Play Store ou Apple App Store. Sua assinatura será sincronizada em todos os seus dispositivos, incluindo Linux e Windows.';

  @override
  String get paywall_dialog__text__unlock_pro => 'Desbloquear CopyCat PRO';

  @override
  String get paywall_dialog__text__unlock_pro_p1 =>
      'Desfrute de mais de 30 dias de histórico sincronizado, mais de 50 coleções, criptografia de ponta a ponta, sincronização em tempo real, acesso aos recursos mais novos e muito mais.';

  @override
  String get paywall_dialog__text__try_again => 'Por favor, tente novamente';

  @override
  String get paywall_dialog__text__current_plan => 'Plano Atual';

  @override
  String get paywall_dialog__text__expired_plan => 'Plano Atual • Expirado';

  @override
  String paywall_dialog__text__trial_till({required DateTime till}) {
    final intl.DateFormat tillDateFormat = intl.DateFormat.yMMMd(localeName);
    final String tillString = tillDateFormat.format(till);

    return 'Teste até $tillString';
  }

  @override
  String get paywall_dialog__text__upgrade => 'Atualizar';

  @override
  String fab__create_collection({required String remaining}) {
    return 'Criar Coleção ( $remaining Restantes )';
  }

  @override
  String get fab__sync => 'Sincronizar';

  @override
  String get fab__sync_unavailable => 'Sincronização Indisponível';

  @override
  String get fab__sync_up_to_date => 'Já está atualizado.';

  @override
  String fab__sync_failed({required String message}) {
    return 'Falha na sincronização: $message';
  }

  @override
  String get layout__navbar__clipboard => 'Clipboard';

  @override
  String get layout__navbar__collections => 'Coleções';

  @override
  String get layout__navbar__settings => 'Configurações';

  @override
  String get search__tooltip__filter => 'Filtros de busca';

  @override
  String manage_sub__ack__promo_sub({required String till}) {
    return 'Você está usando uma assinatura promocional até $till';
  }

  @override
  String get manage_sub__button__text => 'Gerenciar Assinaturas';

  @override
  String get my_account__button__tooltip => 'Minha Conta';

  @override
  String get badges__tooltip__experimental =>
      'Este recurso é experimental e pode não funcionar como esperado.';

  @override
  String get badges__label__pro => 'Pro';

  @override
  String get badges__tooltip__pro_only =>
      'Este recurso está disponível apenas para usuários Pro.';

  @override
  String get collection_selector__tile__no_collection => 'Nenhuma Coleção';

  @override
  String get collection_selector__button__remove_collection =>
      'Remover Coleção';

  @override
  String get dialog__logout__title => 'Sair';

  @override
  String get dialog__logout__subtitle =>
      '⚠️ AVISO ⚠️\n\nSair excluirá as alterações não sincronizadas no banco de dados local. Tem certeza de que deseja continuar?';

  @override
  String get dialog__logging_out__ack =>
      'Finalizando sessão! Por favor, aguarde...';

  @override
  String get reset_pass__text__label => 'Redefinir sua senha';

  @override
  String get dnd__text__drop_here => 'Solte Aqui';

  @override
  String dnd__ack__error_max_drop_count({required int count}) {
    return 'Máximo de $count itens de arrasto permitidos de uma vez.';
  }

  @override
  String get search_filter__text__title => 'Filtros';

  @override
  String get search_filter__button__apply => 'Aplicar';

  @override
  String get search_filter__text__from => 'De';

  @override
  String get search_filter__text__select => 'Selecionar';

  @override
  String get search_filter__text__to => 'Para';

  @override
  String get search_filter__text__now => 'Agora';

  @override
  String get search_filter__text__including => 'Incluindo';

  @override
  String get search_filter__chip__text => 'Texto';

  @override
  String get search_filter__chip__url => 'URL';

  @override
  String get search_filter__chip__media => 'Mídia';

  @override
  String get search_filter__chip__docs => 'Documentos';

  @override
  String get search_filter__text__textCategories => 'Categorias de Texto';

  @override
  String get search_filter__text__exclusive => '( Exclusivo )';

  @override
  String get search_filter__text_cat__email => 'E-mail';

  @override
  String get search_filter__text_cat__phone => 'Telefone';

  @override
  String get search_filter__text_cat__color => 'Cor';

  @override
  String get search_filter__text_cat__struct => 'Estruturado';

  @override
  String get search_filter__text__sort_by => 'Ordenar Por';

  @override
  String get search_filter__sort_by__last_mod => 'Última Modificação';

  @override
  String get search_filter__sort_by__created => 'Criado';

  @override
  String get search_filter__sort_by__copy_count => 'Contagem de Cópias';

  @override
  String get search_filter__sort_by__last_copied => 'Última Cópia';

  @override
  String get search_filter__text__sort_order => 'Ordem de Classificação';

  @override
  String get search_filter__sort_ord__asc => 'Asc';

  @override
  String get search_filter__sort_ord__desc => 'Desc';

  @override
  String get search_filter__tooltip__clear => 'Limpar';

  @override
  String get search_filter__empty => '∅';

  @override
  String get search_filter__button__reset => 'Redefinir';

  @override
  String get login__local_signin__tooltip =>
      'Sem sincronização. Todos os dados permanecem no seu dispositivo.';

  @override
  String get login__local_signin__btn__label => 'Modo Offline';

  @override
  String get login__form__input__name => 'Digite seu bom nome';

  @override
  String get login__form__input__email => 'Digite seu e-mail';

  @override
  String get login__form__input__error_email =>
      'Por favor, insira um endereço de e-mail válido';

  @override
  String get login__form__input__password => 'Digite sua senha';

  @override
  String get login__form__input__error_password_length =>
      'Por favor, insira uma senha com no mínimo 6 caracteres';

  @override
  String get login__form__button__signin => 'Entrar';

  @override
  String get login__form__button__signup => 'Inscrever-se';

  @override
  String get login__form__button__forgot_password => 'Esqueceu sua senha?';

  @override
  String get login__form__text__signup => 'Não tem uma conta? Inscreva-se';

  @override
  String get login__form__text__old_user => 'Já tem uma conta? Entrar';

  @override
  String get login__form__text__reset_password =>
      'Enviar e-mail de redefinição de senha';

  @override
  String get login__form__text__reset_ack =>
      'E-mail de redefinição de senha enviado';

  @override
  String get login__form__button__back => 'Voltar para entrar';

  @override
  String get login__form__button__update_password => 'Atualizar Senha';

  @override
  String get login__form__text_tnc_p1 =>
      'Ao continuar, você concorda com as seguintes ';

  @override
  String get login__form__text_tnc_p2 => 'Políticas de Privacidade';

  @override
  String get login__form__text_tnc_p3 => ' e ';

  @override
  String get login__form__text_tnc_p4 => 'Termos de Serviço.';

  @override
  String get home__search__hint => 'Pesquisar no clipboard';

  @override
  String get collections__search__hint => 'Pesquisar coleção';

  @override
  String get home__search__reset => 'Redefinir Pesquisa';

  @override
  String get preview__vert_view__tab1_title => 'Pré-visualização';

  @override
  String get preview__vert_view__tab2__title => 'Detalhes';

  @override
  String get preview__card__missing_text => 'Este é um Clip Vazio';

  @override
  String get preview__card__video__play => 'Reproduzir Vídeo';

  @override
  String get preview__card__video__mute => 'Silenciar';

  @override
  String get preview__card__video__unmute => 'Ativar som';

  @override
  String get preview__card__video__close => 'Fechar reprodutor';

  @override
  String get preview__card__file__open => 'Abrir Arquivo';

  @override
  String get preview__form__title => 'Editar Detalhes';

  @override
  String get preview__inspector__lock_clip => 'Bloquear clipe';

  @override
  String get preview__inspector_lock_clip_description =>
      'Criptografe este clipe, desative a indexação de pesquisa e exija autenticação para visualizá-lo.';

  @override
  String get preview__form__input__title => 'Título';

  @override
  String get preview__form__input__description => 'Descrição';

  @override
  String get preview__inspector__title => 'Detalhes do clipe';

  @override
  String get preview__inspector__untitled => 'Clipe sem título';

  @override
  String get preview__inspector__saved => 'Detalhes salvos';

  @override
  String get preview__inspector__save_changes => 'Salvar alterações';

  @override
  String get preview__inspector__decrypt => 'Descriptografar';

  @override
  String get preview__inspector__open_source => 'Abrir origem';

  @override
  String get preview__inspector__section__actions => 'Ações';

  @override
  String get preview__inspector__section__details => 'Detalhes';

  @override
  String get preview__inspector__section__content => 'Conteúdo';

  @override
  String get preview__inspector__section__security => 'Segurança';

  @override
  String get preview__inspector__section__organize => 'Organizar';

  @override
  String get preview__inspector__label__created => 'Criado em';

  @override
  String get preview__inspector__label__modified => 'Modificado em';

  @override
  String get preview__inspector__label__last_copied => 'Última cópia';

  @override
  String get preview__inspector__label__copied_count => 'Total de cópias';

  @override
  String get preview__inspector__label__source_app => 'Aplicativo de origem';

  @override
  String get preview__inspector__label__source_url => 'URL de origem';

  @override
  String get preview__inspector__label__file_size => 'Tamanho do arquivo';

  @override
  String get preview__inspector__label__mime_type => 'Tipo MIME';

  @override
  String get preview__inspector__label__extension => 'Extensão';

  @override
  String get preview__inspector__label__characters => 'Caracteres';

  @override
  String get preview__inspector__label__lines => 'Linhas';

  @override
  String get preview__inspector__label__link => 'Link';

  @override
  String get preview__inspector__label__image_dimension => 'Dimensão';

  @override
  String get preview__inspector__label__device => 'Dispositivo';

  @override
  String get preview__inspector__label__storage => 'Armazenamento';

  @override
  String get preview__inspector__status__encrypted => 'Criptografado';

  @override
  String get preview__inspector__status__local_only => 'Somente local';

  @override
  String get preview__inspector__status__synced => 'Sincronizado';

  @override
  String get preview__inspector__status__not_synced => 'Não sincronizado';

  @override
  String get preview__inspector__status__download_required =>
      'Download necessário';

  @override
  String get preview__inspector__status__available => 'Disponível offline';

  @override
  String get preview__inspector__type__text => 'Texto';

  @override
  String get preview__inspector__type__media => 'Mídia';

  @override
  String get preview__inspector__type__file => 'Arquivo';

  @override
  String get preview__inspector__type__link => 'Link';

  @override
  String get reset_password__appbar__title => 'Redefina sua senha';

  @override
  String get reset_password__success_ack => 'Senha redefinida com sucesso';

  @override
  String get onboarding__text__welcome => 'Bem-vindo ao';

  @override
  String get onboarding__text__lets_continue => 'Vamos Continuar';

  @override
  String get onboarding__button__to_login => 'Entrar';

  @override
  String get onboarding__snackbar__export_success =>
      'Chave de criptografia exportada com sucesso.';

  @override
  String get onboarding__dialog__skip_export__title =>
      '✋ Faça Backup da Sua Chave de Criptografia';

  @override
  String get onboarding__dialog__skip_export__subtitle =>
      'Você ainda não exportou sua chave de criptografia. Sem um backup, você não poderá acessar seus clips criptografados se a chave for perdida ou se você trocar de dispositivos.\n\n👉 Se você já tem um backup seguro da sua chave, pode continuar com segurança. Caso contrário, recomendamos fortemente a exportação da chave agora para evitar a perda de dados. Você ainda deseja continuar?';

  @override
  String get onboarding__dialog__export_info__title =>
      '🤔 Por que Exportar a Chave de Criptografia?';

  @override
  String get onboarding__dialog__export_info__subtitle =>
      'Exportar sua chave de criptografia é essencial para acessar seus dados criptografados de forma segura em vários dispositivos. Sem a chave, seus dados criptografados permanecerão inacessíveis após a sincronização.\n\nMantenha um backup da sua chave de criptografia em um local seguro para evitar perda de dados. Lembre-se de que a chave é única para sua conta e não pode ser recuperada se perdida.\n\nNota: O CopyCat não pode acessar seus clips criptografados ou suas chaves de criptografia. Isso porque valorizamos sua privacidade acima de tudo.';

  @override
  String get onboarding__text__export_key_headline =>
      'Criptografia do Clipboard';

  @override
  String get onboarding__text__export_key_title =>
      '💪 Boa notícia! Criptografia está ativa para o seu clipboard';

  @override
  String get onboarding__button__export_key => 'Exportar Chave';

  @override
  String get onboarding__dialog__skip_gen_key__title =>
      '✋ Seus Clips Ficarão Inseguros';

  @override
  String get onboarding__dialog__skip_gen_key__subtitle =>
      'Você ainda não gerou uma chave de criptografia. Sem ela, seus clips permanecerão não criptografados e inseguros. Você pode gerar a chave mais tarde em Configurações ❯ Segurança. Você ainda deseja continuar?';

  @override
  String get onboarding__dialog__gen_key_info__title =>
      '🤔 Por que Preciso de Criptografia?';

  @override
  String get onboarding__dialog__gen_key_info__subtitle =>
      'A criptografia protege seus dados convertendo-os em um formato seguro que só pode ser acessado com uma chave. Sem criptografia, seus clips são armazenados em texto simples, tornando-os vulneráveis a acessos não autorizados. Ativar a criptografia garante que apenas você possa acessar seus dados sensíveis, proporcionando uma camada extra de segurança contra possíveis invasões.';

  @override
  String get onboarding__text__gen_key_headline =>
      'Configurar Criptografia do Clipboard';

  @override
  String onboarding__text__key_generated_title({required String keyPreview}) {
    return '🎉 Chave $keyPreview*** gerada com sucesso 🎉';
  }

  @override
  String get onboarding__button__regenerate_key => 'Regerar Chave';

  @override
  String get onboarding__text__no_key =>
      'Sua conta não tem nenhuma chave de criptografia';

  @override
  String get onboarding__button__generate_key => 'Gerar Chave';

  @override
  String get onboarding__button__do_it_later => 'Fazer mais tarde';

  @override
  String get onboarding__button__why_important => 'Por que é importante?';

  @override
  String get onboarding__snackbar__invalid_key =>
      'Esta não é uma chave de criptografia CopyCat válida';

  @override
  String get onboarding__dialog__skip_import__title =>
      '✋ Clips Criptografados Inacessíveis';

  @override
  String get onboarding__dialog__skip_import__subtitle =>
      'Você ainda não importou a chave de criptografia. Isso significa que todos os seus clips criptografados permanecerão inacessíveis localmente após a sincronização.\n\nPara acessá-los, importe a chave em Configurações ❯ Segurança.\nVocê ainda deseja continuar?';

  @override
  String get onboarding__dialog__reset_key__title =>
      '✋ Deletar Dados Criptografados Permanentemente';

  @override
  String get onboarding__dialog__reset_key__subtitle =>
      'Esta ação é irreversível. Tem certeza de que deseja deletar permanentemente todos os dados criptografados do servidor?';

  @override
  String get onboarding__snackbar__reset_key__success =>
      'Criptografia removida com sucesso.';

  @override
  String get onboarding__dialog__import_info__title =>
      '🤔 Onde está minha chave?';

  @override
  String get onboarding__dialog__import_info__subtitle =>
      'Sua chave de criptografia é um arquivo seguro gerado durante o processo de configuração da criptografia. Se você a perdeu, verifique sua pasta de downloads ou qualquer local de backup onde possa tê-la salvo. Sem esta chave, seus dados criptografados não podem ser acessados.\n\nSe você configurou a chave de criptografia em outro dispositivo, pode exportá-la em Configurações ❯ Segurança ❯ Cofre E2EE nesse dispositivo. Transfira a chave com segurança para este dispositivo para recuperar acesso aos seus dados criptografados.';

  @override
  String get onboarding__text__import_key_headline =>
      'Importar Chave de Criptografia do Clipboard';

  @override
  String get onboarding__text__import_key_title =>
      'Sua conta possui criptografia ativa atualmente.';

  @override
  String get onboarding__button__import_key => 'Importar Chave';

  @override
  String get onboarding__button__reset_key => 'Redefinir Criptografia';

  @override
  String get onboarding__button__where_key => 'Onde está a chave?';

  @override
  String get onboarding__text__go_home => 'Vamos para casa';

  @override
  String onboarding__restoration__failed({required String message}) {
    return 'Falha na restauração: $message';
  }

  @override
  String get onboarding__restoration_warning =>
      '⚠️ Por favor, mantenha esta tela aberta durante a sincronização para evitar corrupção ou inconsistências de dados.';

  @override
  String get sync_restore__title => 'Restaurando seu espaço de trabalho';

  @override
  String get sync_restore__subtitle =>
      'O CopyCat está trazendo suas coleções sincronizadas e o histórico do clipboard para este dispositivo.';

  @override
  String get sync_restore__checking_backup => 'Verificando backup remoto...';

  @override
  String get sync_restore__decrypting_title => 'Descriptografando clipes';

  @override
  String get sync_restore__decrypting_counting =>
      'Contando clipes criptografados...';

  @override
  String sync_restore__decrypting_progress({
    required int decrypted,
    required int total,
  }) {
    return '$decrypted de $total descriptografados';
  }

  @override
  String get sync_restore__workspace_restored =>
      'Espaço de trabalho restaurado';

  @override
  String get sync_restore__data_ready =>
      'Seus dados sincronizados estão prontos neste dispositivo.';

  @override
  String get sync_restore__restoring_collections =>
      'Restaurando coleções para manter os itens do clipboard organizados.';

  @override
  String get sync_restore__restoring_clips =>
      'As coleções foram restauradas. O histórico do clipboard é o próximo.';

  @override
  String get sync_restore__finishing_checks =>
      'Finalizando verificações de restauração.';

  @override
  String get sync_restore__no_synced_items =>
      'Nenhum item sincronizado encontrado';

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
  String get sync_restore__progress_complete => 'Concluído';

  @override
  String get sync_restore__status_ready => 'Pronto';

  @override
  String get sync_restore__status_restoring => 'Restaurando';

  @override
  String get sync_restore__collections_title => 'Coleções';

  @override
  String get sync_restore__collections_description =>
      'Grupos salvos e organização';

  @override
  String get sync_restore__clipboard_items_title => 'Itens do clipboard';

  @override
  String get sync_restore__clipboard_items_description =>
      'Histórico, texto, links, arquivos e mídia';

  @override
  String sync_restore__count_of_total({required int total}) {
    return 'de $total';
  }

  @override
  String get sync_restore__continue_to_copycat => 'Continuar para o CopyCat';

  @override
  String get sync_restore__failed_title => 'Falha na restauração';

  @override
  String get restore_clips__text__title => 'Restaurar Meu Clipboard';

  @override
  String get restore_clips__error__no_backup =>
      'Nenhum backup de clipboard encontrado';

  @override
  String restore_clips__text__total_count({required int totalCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      totalCount,
      locale: localeName,
      other: 'clips',
      one: 'clip',
    );
    return 'Você tem aproximadamente $totalCount $_temp0 para restaurar.';
  }

  @override
  String get restore_clips__sync_disable =>
      'A sincronização está atualmente desativada. Por favor, habilite-a para continuar.';

  @override
  String get restore_clips__preparing =>
      'Preparando para restaurar clips. Por favor, aguarde...';

  @override
  String restore_clips__restored({required int syncCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      syncCount,
      locale: localeName,
      other: 'clips',
      one: 'clip',
    );
    return 'Seus $syncCount $_temp0 foram restaurados com sucesso.';
  }

  @override
  String restore_clips__restoring({
    required int synced,
    required int totalCount,
  }) {
    return 'Restaurado: $synced de $totalCount clips.';
  }

  @override
  String get restore_collections__text__title => 'Restaurar Minhas Coleções';

  @override
  String get restore_collections__error__no_backup =>
      'Nenhum backup de coleção encontrado';

  @override
  String restore_collections__text__total_count({required int totalCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      totalCount,
      locale: localeName,
      other: 'coleções',
      one: 'coleção',
    );
    return 'Você tem aproximadamente $totalCount $_temp0 para restaurar.';
  }

  @override
  String get restore_collections__sync_disable =>
      'A sincronização está atualmente desativada. Por favor, habilite-a para continuar.';

  @override
  String get restore_collections__preparing =>
      'Preparando para restaurar coleções. Por favor, aguarde...';

  @override
  String restore_collections__restored({required int syncCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      syncCount,
      locale: localeName,
      other: 'coleções',
      one: 'coleção',
    );
    return 'Suas $syncCount $_temp0 foram restauradas com sucesso.';
  }

  @override
  String restore_collections__restoring({
    required int synced,
    required int totalCount,
  }) {
    return 'Restaurado: $synced de $totalCount coleções.';
  }

  @override
  String get drive__snackbar__success =>
      'Configuração do Drive Agora Completa.';

  @override
  String get drive__text__setting_up => 'Configurando e sincronizando...';

  @override
  String get drive__text__setting_up__warning =>
      'Por favor, aguarde enquanto finalizamos. Não feche o aplicativo.';

  @override
  String get create_clip__appbar__title__new => 'Novo Clip';

  @override
  String get create_clip__appbar__title__edit => 'Editar Clip';

  @override
  String get create_clip__button__save_new => 'Salvar como novo';

  @override
  String get create_clip__input__hint => 'Escreva o conteúdo do seu clip aqui';

  @override
  String get collections__text__tip =>
      'Para garantir que seus clips importantes estejam sempre disponíveis, independentemente do tempo, em todos os seus dispositivos, salve-os em uma coleção!';

  @override
  String get collections__appbar__title => 'Coleções';

  @override
  String get collections__appbar__title__create => 'Criar Coleção';

  @override
  String get collections__appbar__title__edit => 'Editar Coleção';

  @override
  String get collections__input__name => 'Nome';

  @override
  String get collections__input__description => 'Descrição';

  @override
  String get collections__label__emoji =>
      'Ícone da coleção (clique para alterar)';

  @override
  String get collections__validation__duplicate =>
      'Já existe uma coleção com este ícone e nome';

  @override
  String get collections__validation__name_required => 'O nome é obrigatório.';

  @override
  String get collections__validation__name_max_length =>
      'O nome deve ter no máximo 30 caracteres.';

  @override
  String get select_collection__appbar__title => 'Selecionar Coleção';

  @override
  String get account__dialog__delete_confirm__title =>
      'Solicitação de Exclusão de Conta';

  @override
  String get account__dialog__delete_confirm__description =>
      'Você será redirecionado para o formulário de solicitação de exclusão de conta, tem certeza?';

  @override
  String get account__list_tile__display_name => 'Nome de Exibição';

  @override
  String get account__list_tile__email => 'E-mail';

  @override
  String get account__list_tile__settings => 'Configurações da Conta';

  @override
  String get account__list_tile__danger_zone => 'Zona de Perigo';

  @override
  String get account__button__req_delete => 'Solicitar Exclusão de Conta';

  @override
  String get account__appbar__title => 'Minha Conta';

  @override
  String get settings__appbar__title => 'Configurações';

  @override
  String get settings__header__appearance => 'Aparência';

  @override
  String get settings__header__sorting => 'Ordenação padrão';

  @override
  String get settings__header__interactions => 'Interações';

  @override
  String get settings__tab__1 => 'Geral';

  @override
  String get settings__tab__2 => 'Personalização';

  @override
  String get settings__tab__3 => 'Cloud';

  @override
  String get settings__tab__4 => 'Segurança';

  @override
  String get settings__tab__5 => 'Experimental';

  @override
  String get settings__text__encryption => 'Criptografia';

  @override
  String get settings__text__sync_not_available =>
      'As configurações relacionadas à sincronização não estão disponíveis ao usar o clipboard local.';

  @override
  String get settings__appbar__er__title => 'Regras de Exclusão';

  @override
  String get settings__text__er__predefine => 'Regras de Exclusão Predefinidas';

  @override
  String get settings__text__er__pass_manager => 'Gerenciadores de Senha';

  @override
  String get settings__text__er__pass_manager__subtitle =>
      'Excluir capturas de gerenciadores de senhas';

  @override
  String get settings__text__er__cc => 'Número do Cartão de Crédito';

  @override
  String get settings__text__er__cc__subtitle =>
      'Excluir números de cartão detectados';

  @override
  String get settings__text__er__phone => 'Número de Telefone';

  @override
  String get settings__text__er__phone__subtitle =>
      'Excluir números de telefone detectados';

  @override
  String get settings__text__er__email => 'Endereço de E-mail';

  @override
  String get settings__text__er__email__subtitle =>
      'Excluir endereços de e-mail detectados';

  @override
  String get settings__text__er__url => 'Url Sensível';

  @override
  String get settings__text__er__url__subtitle =>
      'Excluir capturas com URLs sensíveis';

  @override
  String get settings__text__decrypted__note =>
      '🥳 Parabéns! Todos os seus clips foram descriptografados com sucesso localmente,\n portanto, a reconstrução do banco de dados não é necessária.';

  @override
  String get settings__appbar__cer__title =>
      'Regras de Exclusão Personalizadas';

  @override
  String get settings__switch__drag_n_drop__title => 'Arrastar e Soltar';

  @override
  String get settings__switch__drag_n_drop__subtitle =>
      'Permitir que os itens sejam movidos livremente em ambas as direções dentro do aplicativo.';

  @override
  String get settings__dropdown__no_copy_over_limit__title =>
      'Não Copiar Automaticamente Acima de';

  @override
  String settings__dropdown__no_copy_over_limit__subtitle({
    required String fileSize,
  }) {
    return 'Arquivos e Mídias acima de um determinado tamanho ($fileSize) não serão copiados automaticamente.';
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
      'Não Enviar Automaticamente Acima de';

  @override
  String settings__dropdown__no_upload_over_limit__subtitle({
    required String fileSize,
  }) {
    return 'Arquivos e Mídias acima de um determinado tamanho ($fileSize) não serão enviados automaticamente.';
  }

  @override
  String get settings__dropdown__sync_mode__title => 'Modo de Sincronização';

  @override
  String get settings__dropdown__sync_mode__subtitle =>
      'Selecione a velocidade de sincronização que melhor funciona para você.';

  @override
  String get settings__sync_mode__realtime => 'Tempo Real';

  @override
  String get settings__sync_mode__balanced => 'Balanceado';

  @override
  String get settings__dropdown__theme__title => 'Modo de Tema';

  @override
  String get settings__dropdown__default_sort__title => 'Ordenar por';

  @override
  String get settings__dropdown__default_sort_order__title =>
      'Ordem de classificação';

  @override
  String get settings__theme__system => 'Sistema';

  @override
  String get settings__theme__light => 'Claro';

  @override
  String get settings__theme__dark => 'Escuro';

  @override
  String get settings__dropdown__color_mode__title => 'Modo de Cor';

  @override
  String get settings__dropdown__color_mode__subtitle =>
      'Selecione o modo de cor para personalizar a aparência do aplicativo. A opção padrão é \'Tonal Spot\'.';

  @override
  String get settings__dropdown__clipboard_feedback__title =>
      'Clipboard Feedback';

  @override
  String get settings__dropdown__clipboard_feedback__subtitle =>
      'Choose how CopyCat responds when a clip is captured.';

  @override
  String get settings__clipboard_feedback__disabled => 'Disabled';

  @override
  String get settings__clipboard_feedback__copy_only => 'Apenas cópia';

  @override
  String get settings__clipboard_feedback__sync_only => 'Apenas sincronização';

  @override
  String get settings__clipboard_feedback__copy_and_sync =>
      'Cópia e sincronização';

  @override
  String get settings__clipboard_feedback__toast => 'Toast';

  @override
  String get settings__color_mode__tonalSpot => 'Tonal Spot';

  @override
  String get settings__color_mode__content => 'Conteúdo';

  @override
  String get settings__color_mode__expressive => 'Expressivo';

  @override
  String get settings__color_mode__fidelity => 'Fidelidade';

  @override
  String get settings__color_mode__fruit_salad => 'Salada de Frutas';

  @override
  String get settings__color_mode__monochrome => 'Monocromático';

  @override
  String get settings__color_mode__neutral => 'Neutro';

  @override
  String get settings__color_mode__rainbow => 'Arco-Íris';

  @override
  String get settings__color_mode__vibrant => 'Vibrante';

  @override
  String get settings__tile__cer_title => 'Regras Personalizadas';

  @override
  String get settings__tile__cer_subtitle =>
      'Exclua por app, título da janela do app/website, url do website ou padrão de regex';

  @override
  String get settings__tile__er_title => 'Regras de Exclusão';

  @override
  String get settings__tile__er_subtitle =>
      'Impeça que informações sejam copiadas para o clipboard. Clique para Controle Avançado.';

  @override
  String get settings__switch__enable_sync__title =>
      'Sincronização do Clipboard';

  @override
  String get settings__switch__enable_sync__subtitle =>
      'Sincronize seu clipboard entre os dispositivos sem esforço.';

  @override
  String get settings__switch__sync_file__title =>
      'Sincronização de Arquivos e Mídias';

  @override
  String get settings__switch__sync_file__subtitle =>
      'Alternar para sincronizar arquivos e clipes de mídia entre dispositivos.';

  @override
  String get settings__switch__paused__title =>
      'Pausar Monitoramento do Clipboard';

  @override
  String get settings__switch__paused__subtitle =>
      'Pause temporariamente o monitoramento do clipboard até um horário definido.';

  @override
  String settings__switch__paused_active__subtitle({required DateTime time}) {
    final intl.DateFormat timeDateFormat = intl.DateFormat(
      'h:mm a',
      localeName,
    );
    final String timeString = timeDateFormat.format(time);

    return 'Pausado até $timeString. Toque para retomar ou ajustar o tempo.';
  }

  @override
  String get settings__switch__smart_paste__title => 'Colagem Inteligente';

  @override
  String get settings__switch__smart_paste__subtitle =>
      'Cole o conteúdo diretamente no aplicativo com foco.';

  @override
  String get settings__switch__focus_loss_behavior__title =>
      'Manter a Janela Aberta ao Perder o Foco';

  @override
  String get settings__switch__focus_loss_behavior__subtitle =>
      'Quando o CopyCat perde o foco, mantenha-o aberto em segundo plano em vez de ocultá-lo automaticamente.';

  @override
  String get settings__switch__transform_behavior__title =>
      'Salvar transformações como novos clips';

  @override
  String get settings__switch__transform_behavior__subtitle =>
      'Quando ativado, as ações de transformação criam um novo clip em vez de copiar ou colar imediatamente.';

  @override
  String get settings__switch__type_search__title => 'Buscar enquanto digita';

  @override
  String get settings__switch__type_search__subtitle =>
      'Pesquise clipes enquanto digita na barra de busca.';

  @override
  String get settings__switch__startup__title => 'Lançar na Inicialização';

  @override
  String get settings__switch__startup__subtitle =>
      'Inicie automaticamente o CopyCat quando seu dispositivo for ligado.';

  @override
  String get settings__switch__tray_icon__title =>
      'Mostrar ícone na barra do sistema';

  @override
  String get settings__switch__tray_icon__subtitle =>
      'Exibe o ícone do CopyCat na barra de menu / bandeja do sistema.';

  @override
  String get settings__switch__hide_from_screen_capture__title =>
      'Ocultar em capturas de tela';

  @override
  String get settings__switch__hide_from_screen_capture__subtitle =>
      'Quando ativado, capturas e gravações de tela devem ocultar o conteúdo do CopyCat em plataformas compatíveis.';

  @override
  String get settings__switch__hotkey__title => 'Alternar com Tecla de Atalho';

  @override
  String get settings__switch__hotkey__subtitle =>
      'Use um atalho de teclado para acessar rapidamente o CopyCat Clipboard';

  @override
  String get settings__switch__paste_stack_hotkey__title =>
      'Atalho do Paste Stack';

  @override
  String get settings__switch__paste_stack_hotkey__subtitle =>
      'Use um atalho de teclado para abrir ou fechar o Paste Stack';

  @override
  String get settings__switch__quickpaste_hotkey__title =>
      'Atalho do Quick Paste';

  @override
  String get settings__switch__quickpaste_hotkey__subtitle =>
      'Use um atalho de teclado para acessar instantaneamente seus 10 principais itens da área de transferência';

  @override
  String get settings__hotkey__unassigned => 'Não Atribuído';

  @override
  String get settings__hotkey__preview_start => 'Pressione ';

  @override
  String get settings__hotkey__preview_end =>
      ' para mostrar ou ocultar o aplicativo.';

  @override
  String get settings__tile__theme_color__title => 'Cor do Tema';

  @override
  String get settings__tile__theme_color__subtitle =>
      'Essa cor influenciará o visual geral e a sensação do aplicativo.';

  @override
  String get settings__tile__desk_client__title =>
      'Baixar Cliente para Desktop';

  @override
  String get settings__tile__mobile_client__title =>
      'Baixar Cliente para Celular';

  @override
  String get settings__tile__client__subtitle =>
      'Acesse seu clipboard em todos os seus dispositivos.';

  @override
  String get settings__tile__e2e_setup__title =>
      'Configuração de Criptografia de Ponta a Ponta';

  @override
  String get settings__tile__e2e_setup__subtitle =>
      'Configure a criptografia para seus clips.';

  @override
  String get settings__switch__e2e__title => 'Ativar Criptografia';

  @override
  String get settings__switch__e2e__subtitle =>
      'Mude para ativar ou desativar a criptografia de ponta a ponta para seus clips.';

  @override
  String get settings__switch__e2e_nonce__title =>
      'Modo de alta segurança (recomendado)';

  @override
  String get settings__switch__e2e_nonce__subtitle =>
      'Usa AES-GCM para melhor proteção dos dados e detecção de alterações. (Versões antigas do aplicativo não conseguem descriptografar esses novos clipes)';

  @override
  String get settings__dialog__conn_gdrive__title => 'Reconectar Google Drive?';

  @override
  String get settings__dialog__conn_gdrive__subtitle =>
      'Seu Google Drive já está conectado! Deseja reconectar?\n\nPara evitar qualquer perda de dados, certifique-se de usar a mesma conta que antes.';

  @override
  String get settings__drive__connected => 'Conectado';

  @override
  String get settings__drive__loading => 'Carregando...';

  @override
  String get settings__drive__authorizing => 'Autorizando...';

  @override
  String get settings__drive__connect => 'Conectar';

  @override
  String get settings__drive__disconnected => 'Desconectado';

  @override
  String get settings__text__cloud__title => 'Drive na Nuvem';

  @override
  String get settings__text__cloud__name => 'Google Drive';

  @override
  String get settings__text__gdrive__error =>
      'O Google Drive não está conectado. A sincronização de arquivos e mídias está atualmente desativada.';

  @override
  String get settings__text__gdrive__info =>
      'Seus arquivos e mídias são sincronizados com segurança entre dispositivos por meio de provedores de nuvem suportados, garantindo que sua privacidade seja protegida. Quando múltiplos provedores estiverem conectados, você poderá escolher o armazenamento padrão para novos envios.';

  @override
  String get settings__drive__default_tooltip =>
      'Armazenamento padrão para envios';

  @override
  String get settings__drive__set_default => 'Definir como padrão';

  @override
  String get settings__tile__other_cloud__title =>
      'Configurar Outros Drives na Nuvem';

  @override
  String get settings__text__webdav__name => 'WebDAV';

  @override
  String get settings__text__webdav__info =>
      'Conecte seu servidor WebDAV (Nextcloud, ownCloud, Synology NAS, etc.) para armazenar e sincronizar seus arquivos e anexos de mídia.';

  @override
  String get settings__dialog__webdav__title => 'Armazenamento WebDAV';

  @override
  String get settings__dialog__webdav__preset_provider =>
      'Predefinição de Provedor';

  @override
  String get settings__dialog__webdav__server_url => 'URL do Servidor';

  @override
  String get settings__dialog__webdav__server_url_hint =>
      'https://cloud.example.com/remote.php/dav/files/username/';

  @override
  String get settings__dialog__webdav__username => 'Nome de usuário';

  @override
  String get settings__dialog__webdav__password =>
      'Senha / Senha de aplicativo';

  @override
  String get settings__dialog__webdav__base_path =>
      'Caminho da Pasta de Armazenamento';

  @override
  String get settings__dialog__webdav__base_path_helper =>
      'O caminho da pasta não pode ser alterado após a configuração. Para alterá-lo, desconecte primeiro.';

  @override
  String get settings__dialog__webdav__advanced => 'Avançado';

  @override
  String get settings__dialog__webdav__self_signed =>
      'Permitir Certificados Autoassinados / Inseguros';

  @override
  String get settings__dialog__webdav__auto_clean =>
      'Limpar automaticamente arquivos inativos após 30 dias';

  @override
  String get settings__dialog__webdav__auto_clean_subtitle =>
      'Como as credenciais do WebDAV permanecem privadas no seu dispositivo, os arquivos remotos não são removidos pela limpeza da nuvem. Quando ativado, os arquivos de mídia com mais de 30 dias desde a última modificação serão excluídos do seu servidor WebDAV. Clipes em coleções ou bloqueados estão sempre protegidos.';

  @override
  String get settings__dialog__webdav__test_conn => 'Testar Conexão';

  @override
  String get settings__dialog__webdav__testing => 'Testando conexão...';

  @override
  String get settings__dialog__webdav__test_success => 'Conexão bem-sucedida!';

  @override
  String get settings__dialog__webdav__disconnect => 'Desconectar';

  @override
  String get settings__dialog__webdav__save => 'Salvar e Conectar';

  @override
  String get settings__dialog__webdav__reconnect_title =>
      'Configurações do WebDAV';

  @override
  String get settings__dialog__webdav__reconnect_subtitle =>
      'O WebDAV já está conectado. Deseja atualizar as configurações ou desconectar?';

  @override
  String get settings__dialog__webdav__url_required =>
      'Insira uma URL de servidor WebDAV válida';

  @override
  String get settings__dialog__webdav__username_required =>
      'Insira um nome de usuário';

  @override
  String get settings__dialog__webdav__password_required =>
      'Insira uma senha ou token de aplicativo';

  @override
  String get settings__app_lock__title => 'Bloqueio do App';

  @override
  String get settings__app_lock__tile__subtitle =>
      'Exigir biometria ou PIN do dispositivo para acessar a área de transferência';

  @override
  String get settings__app_lock__no_biometrics =>
      'Nenhuma biometria ou credencial encontrada. Configure um PIN ou biometria nas configurações do dispositivo primeiro.';

  @override
  String get settings__app_lock__lock_after__title => 'Bloquear após';

  @override
  String get settings__app_lock__lock_after__subtitle =>
      'Bloquear automaticamente quando o app for para o fundo';

  @override
  String get settings__app_lock__timeout__immediately => 'Imediatamente';

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
  String get settings__lan__title => 'Rede Local';

  @override
  String get settings__lan__service_inactive =>
      'Inicie o serviço em segundo plano para usar a sincronização LAN';

  @override
  String get settings__lan__subtitle__disabled =>
      'Sincronize instantaneamente a área de transferência com dispositivos próximos';

  @override
  String get settings__lan__subtitle__mobile =>
      'Serviço em segundo plano procurando dispositivos próximos';

  @override
  String get settings__lan__searching => 'Procurando dispositivos…';

  @override
  String settings__lan__devices_found({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dispositivos encontrados',
      one: 'dispositivo encontrado',
    );
    return '$count $_temp0 na rede';
  }

  @override
  String get settings__auto_write__title => 'Escrita Automática ao Receber';

  @override
  String get settings__auto_write__subtitle =>
      'Copiar automaticamente os clipes recebidos para a área de transferência';

  @override
  String get settings__sync__manage_devices__title =>
      'Gerenciar Dispositivos de Sincronização';

  @override
  String get settings__sync__manage_devices__subtitle =>
      'Ver dispositivos ativos e remover dispositivos do acesso de sincronização.';

  @override
  String get settings__lan_mesh__app_bar_title => 'Rede Local';

  @override
  String get settings__lan_mesh__unknown_device => 'Dispositivo desconhecido';

  @override
  String get settings__lan_mesh__searching =>
      'Procurando dispositivos na rede…';

  @override
  String get settings__lan_mesh__reachable => 'Acessível';

  @override
  String get settings__lan_mesh__unreachable => 'Inacessível';

  @override
  String get settings__lan_mesh__disabled_banner =>
      'A sincronização LAN está desativada. Ative-a nas Configurações para descobrir dispositivos próximos.';

  @override
  String get settings__device_mgmt__app_bar_title =>
      'Gerenciar Dispositivos de Sincronização';

  @override
  String get settings__device_mgmt__dialog_title =>
      'Remover Acesso de Sincronização';

  @override
  String get settings__device_mgmt__dialog_cancel => 'Cancelar';

  @override
  String get settings__device_mgmt__dialog_remove => 'Remover';

  @override
  String get settings__device_mgmt__revoke_failed =>
      'Falha ao remover o acesso de sincronização.';

  @override
  String get settings__device_mgmt__active_now => 'Ativo agora';

  @override
  String settings__device_mgmt__today_at({required String time}) {
    return 'Hoje às $time';
  }

  @override
  String settings__device_mgmt__days_ago({required int count}) {
    return 'há ${count}d';
  }

  @override
  String get settings__device_mgmt__load_failed =>
      'Falha ao carregar dispositivos.';

  @override
  String get settings__device_mgmt__retry => 'Tentar novamente';

  @override
  String get settings__device_mgmt__empty =>
      'Nenhum dispositivo de sincronização encontrado.';

  @override
  String get settings__device_mgmt__max_limit_tooltip =>
      'Número máximo de dispositivos que você pode sincronizar com seu plano atual.';

  @override
  String settings__device_mgmt__max_limit_label({required int count}) {
    return 'Limite Máx • $count';
  }

  @override
  String get settings__device_mgmt__active_count_tooltip =>
      'Número de dispositivos ativos atualmente.';

  @override
  String settings__device_mgmt__active_count_label({required int count}) {
    return 'Ativos • $count';
  }

  @override
  String settings__device_card__last_seen({required String time}) {
    return 'Visto por último: $time';
  }

  @override
  String get settings__device_card__revoke => 'Revogar';

  @override
  String get device_mgmt_verification_failed =>
      'Não foi possível verificar o acesso ao dispositivo de sincronização no momento. Por favor, verifique sua conexão com a Internet e tente novamente.';

  @override
  String get device_mgmt_limit_reached =>
      'A sincronização está desativada neste dispositivo porque o limite de dispositivos do seu plano foi atingido. Remova outro dispositivo em Configurações > Sincronização > Gerenciar Dispositivos de Sincronização.';

  @override
  String get custom_er__nav__1 => 'App';

  @override
  String get custom_er__nav__2 => 'Título da Janela';

  @override
  String get custom_er__nav__3 => 'Url';

  @override
  String get custom_er__nav__4 => 'Padrão de Texto';

  @override
  String get custom_er__text__not_supported =>
      'Esta exclusão ainda não é suportada';

  @override
  String get custom_er__tile__add_app => 'Adicionar um aplicativo';

  @override
  String get custom_er__text__no_app =>
      'Nenhum aplicativo personalizado ainda foi excluído';

  @override
  String get custom_er__button__remove_app => 'Remover este aplicativo';

  @override
  String get custom_er__tile__pattern =>
      'Evitar cópia quando o conteúdo copiado corresponder a esses padrões';

  @override
  String get custom_er__text__no_pattern =>
      'Nenhum padrão personalizado (s) excluído';

  @override
  String get custom_er__button__remove_pattern => 'Remover este padrão';

  @override
  String get custom_er__tile__url =>
      'Evitar cópia a partir de website correspondendo a estes segmentos de url.';

  @override
  String get custom_er__input__url_hint =>
      'Digite uma url ou parte de uma url aqui.';

  @override
  String get custom_er__text__no_url => 'Nenhuma url personalizada(s) excluída';

  @override
  String get custom_er__button__remove_url => 'Remover esta url';

  @override
  String get custom_er__tile__title =>
      'Evitar cópia de app ou website quando o título da janela corresponder.';

  @override
  String get custom_er__text__no_title =>
      'Nenhum título personalizado(s) excluído';

  @override
  String get custom_er__button__remove_title => 'Remover este título';

  @override
  String get about__tile__discord => 'Discord • Conectar';

  @override
  String get about__tile__youtube => 'YouTube • Tutorial';

  @override
  String get about__tile__read_tut => 'Ler • Tutorial';

  @override
  String get about__tile__github => 'Github • Código aberto';

  @override
  String get about__tile__website => 'EntilityStudio • Site';

  @override
  String get about__tile__support => 'Suporte';

  @override
  String get abc_title => 'Papel de parede de fundo';

  @override
  String get abc__tile__subtitle => 'Ouça o papel de parede em segundo plano';

  @override
  String get abc__tip__why_title => 'Por que essas permissões são necessárias?';

  @override
  String get abc__tip__why_subtitle =>
      'Essas permissões garantem que o CopyCat funcione corretamente em segundo plano, permitindo detectar conteúdo copiado e fornecer uma experiência contínua sem interrupções.';

  @override
  String get abc__heading__req_perm => 'Permissões necessárias';

  @override
  String get abc__tile__notification_title => 'Acesso à notificação';

  @override
  String get abc__tile__notification_subtitle =>
      'Exibe uma notificação persistente para informar que o CopyCat está em execução em segundo plano, garantindo transparência e privacidade.';

  @override
  String get abc__tile__battery_opt_title => 'Otimização de bateria';

  @override
  String get abc__tile__battery_opt_subtitle =>
      'Evita que o sistema desligue o CopyCat enquanto ele está em segundo plano, garantindo uma experiência contínua.';

  @override
  String get abc__tile__overlay_title => 'Permissão de sobreposição';

  @override
  String get abc__tile__overlay_subtitle =>
      'Permite que o CopyCat leia a área de transferência abrindo brevemente uma janela transparente sobre a tela e a fechando imediatamente depois.';

  @override
  String get abc__tile__acc_title => 'Serviço de acessibilidade';

  @override
  String get abc__tile__acc_subtitle =>
      'Inicia o ouvinte em segundo plano do CopyCat para detectar quando você copiar algo e garante que o serviço seja reiniciado automaticamente após uma reinicialização.';

  @override
  String get abc__ack__ready => 'Configuração pronta para ser configurada.';

  @override
  String get abc__ack__preparing => 'Preparando configuração, aguarde...';

  @override
  String get abc__perm_alert_open_setting__button => 'Abrir configurações';

  @override
  String get abc__overlay_perm_alert__title => 'Permissão de sobreposição';

  @override
  String get abc__overlay_perm_alert__subtitle =>
      'O CopyCat Clipboard precisa da permissão \'Desenhar sobre outros aplicativos\' para ler o conteúdo da área de transferência em segundo plano.';

  @override
  String get abc__overlay_perm_alert__p1_prefix => 'Esta permissão é ';

  @override
  String get abc__overlay_perm_alert__p1_bold =>
      'usada apenas para detecção da área de transferência';

  @override
  String get abc__overlay_perm_alert__p1_suffix =>
      ' quando você copia algo em segundo plano.';

  @override
  String get abc__overlay_perm_alert__p2_prefix =>
      'Quando habilitado, o CopyCat ';

  @override
  String get abc__overlay_perm_alert__p2_bold =>
      'cria uma janela transparente de 0 pixels';

  @override
  String get abc__overlay_perm_alert__p2_suffix =>
      ' para brevemente trazer o aplicativo para o primeiro plano e ler os dados da área de transferência.';

  @override
  String get abc__overlay_perm_alert__p3_prefix => 'O aplicativo ';

  @override
  String get abc__overlay_perm_alert__p3_bold => 'não mostra nada';

  @override
  String get abc__overlay_perm_alert__p3_suffix =>
      ' na sua tela durante este processo.';

  @override
  String get abc__overlay_perm_alert__p4_prefix =>
      'Em alguns dispositivos, o sistema pode mostrar uma mensagem rápida ';

  @override
  String get abc__overlay_perm_alert__p4_bold =>
      '\'CopyCat colou da sua área de transferência\'';

  @override
  String get abc__overlay_perm_alert__p4_suffix =>
      ' quando o CopyCat lê o conteúdo da sua área de transferência.';

  @override
  String get abc__overlay_perm_alert__agree =>
      'Ao conceder esta permissão, você concorda com o uso descrito acima.';

  @override
  String get abc__accessibility_perm_alert__title =>
      'Permissão de acessibilidade';

  @override
  String get abc__accessibility_perm_alert__subtitle =>
      'O CopyCat Clipboard requer o Serviço de Acessibilidade para funcionar em segundo plano e detectar e sincronizar a área de transferência em tempo real.';

  @override
  String get abc__accessibility_perm_alert__p1_prefix => 'Este serviço é ';

  @override
  String get abc__accessibility_perm_alert__p1_bold => 'usado apenas';

  @override
  String get abc__accessibility_perm_alert__p1_suffix =>
      ' para detectar o conteúdo da área de transferência e sincronizá-lo entre dispositivos quando habilitado.';

  @override
  String get abc__accessibility_perm_alert__p2_prefix => 'Você pode ';

  @override
  String get abc__accessibility_perm_alert__p2_bold =>
      'excluir aplicativos específicos';

  @override
  String get abc__accessibility_perm_alert__p2_suffix =>
      ' usando o recurso de Regras de Exclusão.';

  @override
  String get abc__accessibility_perm_alert__p3_prefix => 'O aplicativo ';

  @override
  String get abc__accessibility_perm_alert__p3_bold =>
      'não acessa nenhum outro dado';

  @override
  String get abc__accessibility_perm_alert__p3_suffix =>
      ' além do conteúdo da área de transferência.';

  @override
  String get abc__accessibility_perm_alert__p4_prefix =>
      'Os dados da área de transferência ';

  @override
  String get abc__accessibility_perm_alert__p4_bold =>
      'não são compartilhados externamente';

  @override
  String get abc__accessibility_perm_alert__p4_suffix =>
      ' e permanecem privados nos seus dispositivos.';

  @override
  String get abc__accessibility_perm_alert__p5_prefix =>
      'Os dados da área de transferência ';

  @override
  String get abc__accessibility_perm_alert__p5_bold =>
      'são criptografados de ponta a ponta';

  @override
  String get abc__accessibility_perm_alert__p5_suffix =>
      ' (se habilitado) em trânsito e em repouso, garantindo a privacidade entre dispositivos.';

  @override
  String get abc__accessibility_perm_alert__agree =>
      'Ao habilitar o Serviço de Acessibilidade, você reconhece e concorda com os termos acima.';

  @override
  String get abc__other_setting__title => 'Outras configurações';

  @override
  String get abc__tile__two_way_sync__title => 'Sincronização bidirecional';

  @override
  String abc__tile__two_way_sync__subtitle({required String warning}) {
    return 'Mantém sua área de transferência sincronizada instantaneamente entre dispositivos.\n$warning';
  }

  @override
  String get abc__tile__two_way_sync__realtime_required =>
      '⚠️ O modo em tempo real é obrigatório.';

  @override
  String get abc__ack__detection_mode_cleared => 'Modo de detecção limpo';

  @override
  String get abc__ack__detection_mode_updated => 'Modo de detecção atualizado';

  @override
  String abc__ack__detection_mode_update_failed({required String message}) {
    return 'Falha ao atualizar o modo de detecção: $message';
  }

  @override
  String get abc__detection_mode__title => 'Modo de detecção';

  @override
  String get abc__detection_mode__subtitle__enabled =>
      'Escolha como o CopyCat detecta ações de cópia em outros aplicativos. O CopyCat permanece inativo até você escolher um modo.';

  @override
  String get abc__detection_mode__subtitle__disabled =>
      'Ative o serviço de acessibilidade primeiro e, em seguida, escolha um modo de detecção.';

  @override
  String get abc__detection_mode__mode_1 => 'Eficiente';

  @override
  String get abc__detection_mode__mode_2 => 'Compatibilidade máxima';

  @override
  String get abc__network__header => 'Rede';

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
    return 'Você tem atualmente $count clipes criptografados que estão inacessíveis.';
  }

  @override
  String get encrypted_stat__all_decrypted =>
      '🥳 Parabéns! Todos os seus clipes foram descriptografados localmente com sucesso, então não é necessário reconstruir o banco de dados.';

  @override
  String get encrypted_stat__rebuild_database => 'Reconstruir banco de dados';

  @override
  String tray__tooltip__paused_till({required String time}) {
    return 'CopyCat Clipboard - Em pausa até $time';
  }

  @override
  String get tray__menu__resume_copycat => 'Retomar';

  @override
  String get tray__menu__pause_copycat => 'Pausar';

  @override
  String get tray__menu__paste_stack => 'Paste Stack';

  @override
  String get tray__menu__restart_app => 'Reiniciar';

  @override
  String get tray__dialog__quit__subtitle =>
      'Tem certeza de que deseja sair do aplicativo?';

  @override
  String get splash__checking_authentication => 'Verificando autenticação...';

  @override
  String paste_stack__title({required int count}) {
    return 'Paste Stack • $count';
  }

  @override
  String get paste_stack__reorder_hint =>
      'Você pode arrastar os itens para reordená-los.';

  @override
  String get paste_stack__reverse_tooltip => 'Inverter pilha';

  @override
  String paste_stack__limit_note({required int count}) {
    return 'Você tem um limite de $count itens';
  }

  @override
  String get multi_paste__title => 'Configuração de colagem múltipla';

  @override
  String get multi_paste__subtitle =>
      'Controle como os clipes selecionados são mesclados e temporizados.';

  @override
  String get multi_paste__stat__selected => 'Selecionados';

  @override
  String get multi_paste__stat__text => 'Texto';

  @override
  String get multi_paste__stat__non_text => 'Conteúdo não textual';

  @override
  String get multi_paste__merge__title =>
      'Mesclar clipes de texto consecutivos';

  @override
  String get multi_paste__merge__subtitle =>
      'Clipes de texto são mesclados até que um clipe não textual interrompa a sequência.';

  @override
  String get multi_paste__separator__title => 'Separador';

  @override
  String get multi_paste__separator__new_line => 'Nova linha';

  @override
  String get multi_paste__separator__space => 'Espaço';

  @override
  String get multi_paste__separator__custom => 'Personalizado';

  @override
  String get multi_paste__separator__custom_label => 'Separador personalizado';

  @override
  String get multi_paste__separator__custom_hint =>
      'Aceita sequências de escape como \\n e \\t';

  @override
  String get multi_paste__pacing__title => 'Temporização da colagem';

  @override
  String get multi_paste__pacing__subtitle =>
      'Aumente o atraso se o aplicativo de destino perder eventos de colagem.';

  @override
  String get multi_paste__wait_between_pastes => 'Intervalo entre colagens';

  @override
  String get multi_paste__validation__wait_positive =>
      'O tempo de espera deve ser um número positivo.';

  @override
  String get multi_paste__validation__custom_separator_required =>
      'Informe um separador personalizado.';

  @override
  String get settings__tile__backup_restore__title => 'Backup e restauração';

  @override
  String get settings__tile__backup_restore__subtitle =>
      'Crie backups .ccbkup e restaure localmente';

  @override
  String get settings__switch__rich_data_capture__title =>
      'Captura de dados avançada';

  @override
  String get settings__switch__rich_data_capture__subtitle =>
      'Mantenha a formatação ao copiar e colar entre aplicativos.';

  @override
  String get settings__decrypt__title =>
      'Descriptografia da área de transferência';

  @override
  String settings__decrypt__count({required int count}) {
    return 'Atualmente você tem $count clipes criptografados localmente.';
  }

  @override
  String settings__decrypt__progress({
    required int decrypted,
    required int total,
  }) {
    return 'Descriptografados: $decrypted de $total clipes.';
  }

  @override
  String get settings__decrypt__warning =>
      '⚠️ Mantenha esta tela aberta durante esse processo para evitar corrupção de dados ou inconsistências.';

  @override
  String get not_found__title => 'Página não encontrada';

  @override
  String get not_found__subtitle =>
      'A página que você está procurando não foi encontrada.';

  @override
  String get not_found__go_home => 'Ir para o início';

  @override
  String get backup_restore__dialog__save_as => 'Salvar backup como';

  @override
  String get backup_restore__busy__creating => 'Criando backup...';

  @override
  String get backup_restore__error__encryption_unavailable =>
      'A criptografia está ativada, mas está indisponível no momento. Desbloqueie o E2EE e tente novamente.';

  @override
  String backup_restore__snackbar__saved({required String outputPath}) {
    return 'Backup salvo em $outputPath';
  }

  @override
  String backup_restore__snackbar__create_failed({required String message}) {
    return 'Falha no backup: $message';
  }

  @override
  String get backup_restore__dialog__select_file =>
      'Selecionar arquivo de backup';

  @override
  String get backup_restore__dialog__restore_title => 'Restaurar backup';

  @override
  String get backup_restore__dialog__restore_subtitle =>
      'Digite a senha se este backup estiver protegido por senha.';

  @override
  String get backup_restore__dialog__restore_action => 'Restaurar';

  @override
  String get backup_restore__busy__restoring => 'Restaurando backup...';

  @override
  String backup_restore__snackbar__restore_completed({
    required int clips,
    required int collections,
  }) {
    return 'Restauração concluída: $clips clipes, $collections coleções.';
  }

  @override
  String backup_restore__snackbar__restore_failed({required String message}) {
    return 'Falha na restauração: $message';
  }

  @override
  String get backup_restore__error__select_clip_type =>
      'Selecione pelo menos um tipo de clipe.';

  @override
  String get backup_restore__error__from_after_to =>
      'A data inicial deve ser anterior à data final.';

  @override
  String get backup_restore__dialog__options__description =>
      'Escolha o que incluir neste arquivo de backup.';

  @override
  String get backup_restore__section__clip_types => 'Tipos de clipe';

  @override
  String get backup_restore__section__cached_files => 'Arquivos em cache';

  @override
  String get backup_restore__input__max_cached_file_size =>
      'Tamanho máximo dos arquivos em cache (MB)';

  @override
  String get backup_restore__input__max_cached_file_size__hint =>
      'Opcional, ex.: 50';

  @override
  String get backup_restore__error__positive_number =>
      'Digite um número positivo.';

  @override
  String get backup_restore__text__select_file_media_for_cache_limit =>
      'Selecione os tipos de clipe Arquivo ou Mídia para configurar um tamanho máximo dos arquivos em cache.';

  @override
  String get backup_restore__section__date_range => 'Intervalo de datas';

  @override
  String get backup_restore__from_date => 'Data inicial';

  @override
  String get backup_restore__to_date => 'Data final';

  @override
  String get backup_restore__no_minimum_date => 'Sem data mínima';

  @override
  String get backup_restore__no_maximum_date => 'Sem data máxima';

  @override
  String get backup_restore__clear_date_filter => 'Limpar filtro de data';

  @override
  String get backup_restore__section__security => 'Segurança';

  @override
  String get backup_restore__toggle__password_protect =>
      'Proteger backup com senha';

  @override
  String get backup_restore__input__password => 'Senha';

  @override
  String get backup_restore__input__password__hint => 'Pelo menos 6 caracteres';

  @override
  String get backup_restore__error__password_min_length =>
      'A senha deve ter pelo menos 6 caracteres.';

  @override
  String get backup_restore__dialog__create_manual_title =>
      'Criar backup manual';

  @override
  String get backup_restore__appbar__title => 'Backup e restauração';

  @override
  String get backup_restore__card__title => 'Backup e restauração manuais';

  @override
  String get backup_restore__card__subtitle =>
      'Crie arquivos .ccbkup locais com proteção opcional por senha e restaure-os localmente com deduplicação por melhor esforço.';

  @override
  String get backup_restore__actions__title => 'Ações';

  @override
  String get backup_restore__button__create => 'Criar backup';

  @override
  String get backup_restore__button__restore => 'Restaurar backup';

  @override
  String get backup_restore__snapshot__backup_title =>
      'Último resumo do backup';

  @override
  String get backup_restore__snapshot__restore_title =>
      'Último resumo da restauração';

  @override
  String get backup_restore__snapshot__restore_subtitle =>
      'Deduplicação por melhor esforço e relatório de integridade';

  @override
  String get backup_restore__empty_session =>
      'Nenhum backup ou restauração foi executado nesta sessão ainda.';

  @override
  String get backup_restore__label__collections => 'Coleções';

  @override
  String get backup_restore__label__clips => 'Clipes';

  @override
  String get backup_restore__label__files_included => 'Arquivos incluídos';

  @override
  String get backup_restore__label__files_missing => 'Arquivos ausentes';

  @override
  String get backup_restore__label__files_skipped_by_size =>
      'Ignorados por tamanho';

  @override
  String get backup_restore__label__encrypted_clips => 'Clipes criptografados';

  @override
  String get backup_restore__label__collections_restored =>
      'Coleções restauradas';

  @override
  String get backup_restore__label__collections_duplicates =>
      'Coleções duplicadas';

  @override
  String get backup_restore__label__collections_failed => 'Coleções com falha';

  @override
  String get backup_restore__label__clips_restored => 'Clipes restaurados';

  @override
  String get backup_restore__label__clips_duplicates => 'Clipes duplicados';

  @override
  String get backup_restore__label__clips_failed => 'Clipes com falha';

  @override
  String get backup_restore__label__attachments_restored =>
      'Anexos restaurados';

  @override
  String get backup_restore__label__attachments_missing => 'Anexos ausentes';

  @override
  String get backup_restore__label__attachments_failed => 'Anexos com falha';

  @override
  String get backup_restore__label__corrupt_entries => 'Entradas corrompidas';

  @override
  String get subscription__loading => 'Carregando...';

  @override
  String get review__dialog__title => 'Está gostando do CopyCat até aqui?';

  @override
  String get review__dialog__message =>
      'Uma avaliação rápida ajuda mais pessoas a descobrirem o CopyCat e incentiva a chegada de novos recursos.';

  @override
  String get review__dialog__never => 'Nunca';

  @override
  String get review__dialog__remind_later => 'Lembrar em 7 dias';

  @override
  String get review__dialog__rate_now => 'Avaliar agora';

  @override
  String get settings__tile__review__title => 'Avaliar o CopyCat';

  @override
  String get settings__tile__review__subtitle =>
      'Deixe uma avaliação na App Store';

  @override
  String get collections__read_only__banner =>
      'Somente leitura no seu plano atual. Faça upgrade para editar esta coleção.';

  @override
  String get collections__read_only__toast =>
      'Esta coleção é somente leitura no seu plano atual. Faça upgrade para editar todas as coleções.';

  @override
  String get collections__read_only__upgrade_action => 'Fazer upgrade';

  @override
  String get collections__locked_section__label => 'Bloqueado';

  @override
  String get transform__section__text_core => 'Texto básico';

  @override
  String get transform__section__text_utilities => 'Utilitários de texto';

  @override
  String get transform__section__struct => 'Estrutura';

  @override
  String get transform__section__urls => 'URLs';

  @override
  String get transform__section__colors => 'Cores';

  @override
  String get transform__section__emails_phones => 'E-mails / Telefones';

  @override
  String get transform__section__structured_text => 'Texto estruturado';

  @override
  String get transform__label__uppercase => 'Maiúsculas';

  @override
  String get transform__label__lowercase => 'Minúsculas';

  @override
  String get transform__label__capitalize => 'Capitalizar';

  @override
  String get transform__label__trim_whitespace => 'Remover espaços';

  @override
  String get transform__label__remove_line_breaks => 'Remover quebras de linha';

  @override
  String get transform__label__normalize_spaces => 'Normalizar espaços';

  @override
  String get transform__label__reverse_text => 'Inverter texto';

  @override
  String get transform__label__deduplicate_lines => 'Remover linhas duplicadas';

  @override
  String get transform__label__json_prettify => 'JSON → formatar';

  @override
  String get transform__label__json_minify => 'JSON → minificar';

  @override
  String get transform__label__url_encode => 'Codificar URL';

  @override
  String get transform__label__url_decode => 'Decodificar URL';

  @override
  String get transform__label__base64_encode => 'Codificar em Base64';

  @override
  String get transform__label__base64_decode => 'Decodificar Base64';

  @override
  String get transform__label__remove_tracking_params => 'Remover rastreadores';

  @override
  String get transform__label__extract_domain => 'Extrair domínio';

  @override
  String get transform__label__hex_to_rgb => 'HEX → RGB';

  @override
  String get transform__label__rgb_to_hex => 'RGB → HEX';

  @override
  String get transform__label__hex_to_hsl => 'HEX → HSL';

  @override
  String get transform__label__copy_cleaned => 'Copiar limpo';

  @override
  String get transform__label__extract_emails => 'Extrair e-mails';

  @override
  String get transform__label__extract_urls => 'Extrair URLs';

  @override
  String get transform__label__extract_numbers => 'Extrair números';

  @override
  String get transfer__scan_qr => 'Escanear QR';

  @override
  String get transfer__show_qr => 'Mostrar QR';

  @override
  String get transfer__enter_passcode => 'Inserir código de acesso';

  @override
  String get transfer__six_digit_passcode => 'Código de acesso de 6 dígitos';

  @override
  String get transfer__securely_transfer_via_qr =>
      'Transferir com segurança para dispositivo próximo via QR (Recomendado)';

  @override
  String get transfer__nearby_device => 'Transferir para dispositivo próximo';

  @override
  String get transfer__scan_qr_and_enter_passcode =>
      'Escaneie este QR no seu outro dispositivo e depois insira o código de acesso.';

  @override
  String get transfer__enter_passcode_on_other_device =>
      'Insira este código de acesso no outro dispositivo.';

  @override
  String get transfer__show_passcode => 'Mostrar código de acesso';

  @override
  String get transfer__device_has_no_camera_use_file_import =>
      'Este dispositivo não possui câmera. Use a opção de importação de arquivo.';

  @override
  String get transfer__scan_qr_from_other_device =>
      'Escaneie o QR do seu outro dispositivo.';

  @override
  String get settings__personal_drive__title => 'Armazenamento Pessoal';

  @override
  String get settings__personal_drive__subtitle =>
      'Sincronize seus clipes de arquivos com sua nuvem pessoal para backup seguro e acesso em vários dispositivos.';
}
