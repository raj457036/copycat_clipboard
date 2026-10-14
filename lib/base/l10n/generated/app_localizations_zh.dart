// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get app__name => 'CopyCat 剪贴板';

  @override
  String get app__slogan => '一个剪贴板，无限可能';

  @override
  String get app__start_indexing => '开始索引';

  @override
  String get app__stop_indexing => '停止索引';

  @override
  String get app__image_not_found => '未找到图片';

  @override
  String get app__unknown_error => '发生意外错误';

  @override
  String get app__downloading => '下载中...';

  @override
  String get app__download => '下载';

  @override
  String get app__follow_link => '跟随链接';

  @override
  String get app__edit => '编辑';

  @override
  String get app__export => '导出';

  @override
  String get app__delete => '删除';

  @override
  String get app__later => '稍后';

  @override
  String get app__select => '选择';

  @override
  String get app__change => '更改';

  @override
  String get app__confirm => '确认';

  @override
  String get app__action_required => '需要操作';

  @override
  String get app__feature_unavailable => '此功能在您的平台上不可用。';

  @override
  String get app__preview => '预览';

  @override
  String get app__open_file => '打开文件';

  @override
  String get app__change_collection => '更改收藏';

  @override
  String get app__no_name => '无名称';

  @override
  String get app__share => '分享';

  @override
  String get app__clip_actions => '剪贴项操作';

  @override
  String get app__copy_content => '复制内容';

  @override
  String get app__paste_content => '粘贴内容';

  @override
  String get app__loading => '加载中...';

  @override
  String get app__uploading => '上传中...';

  @override
  String get app__syncing => '同步中...';

  @override
  String app__sync_cooldown({required String time}) {
    return '同步处于冷却状态。请等待 $time 后再进行同步。';
  }

  @override
  String get app__sync => '同步';

  @override
  String get app__queued => '排队中';

  @override
  String get app__local => '本地';

  @override
  String get app__utc => 'UTC';

  @override
  String get app__send_message => '发送消息';

  @override
  String get app__send_email => '发送邮件';

  @override
  String get app__empty_clipboard => '您的剪贴板是空的。';

  @override
  String get app__load_more => '加载更多';

  @override
  String get app__more => '更多';

  @override
  String get app__search => '搜索';

  @override
  String get app__no_results => '未找到结果';

  @override
  String get app__locale_en => '英语';

  @override
  String get app__locale_es => '西班牙语';

  @override
  String get app__locale_fr => '法语';

  @override
  String get app__locale_de => '德语';

  @override
  String get app__locale_zh => '中文';

  @override
  String get app__locale_pt => '葡萄牙语';

  @override
  String get app__language => '语言';

  @override
  String get app__yes => '是';

  @override
  String get app__no => '否';

  @override
  String get app__quit => '退出';

  @override
  String get app__clear => '清除';

  @override
  String get app__reset => '重置';

  @override
  String get app__continue => '继续';

  @override
  String get app__paste => '粘贴';

  @override
  String get app__copycat_logo => 'CopyCat 标志';

  @override
  String get app__logout => '登出';

  @override
  String get app__no_collection => '未找到收藏';

  @override
  String get app__create_collection => '创建收藏';

  @override
  String get app__create => '创建';

  @override
  String get app__pro_tip => '专业提示';

  @override
  String get app__try_again => '重试';

  @override
  String get app__realtime_connected => '实时连接';

  @override
  String get app__realtime_disconnected => '实时断开连接';

  @override
  String get app__realtime_connecting => '实时连接中...';

  @override
  String get app__ack__exported => '已导出';

  @override
  String get app__ack__copied => '已复制';

  @override
  String app__ack__copied_from_device({required String device}) {
    return '已从 $device 复制';
  }

  @override
  String app__ack__received_from_device({required String device}) {
    return '已从 $device 接收';
  }

  @override
  String get app__ack__excluded => '已排除';

  @override
  String app__ack__excluded_with_reason({required String reason}) {
    return '已排除 • $reason';
  }

  @override
  String get app__ack__reason_phone => '电话号码';

  @override
  String get app__ack__reason_email => '电子邮件';

  @override
  String get app__ack__reason_credit_card => '信用卡';

  @override
  String get app__ack__reason_sensitive_url => '敏感网址';

  @override
  String get app__ack__reason_app => '敏感应用';

  @override
  String get app__ack__reason_pattern => '自定义规则';

  @override
  String get app__ack__reason_title => '敏感窗口';

  @override
  String get app__ack__pasted => '已粘贴';

  @override
  String get app__ack__pasting => '粘贴中';

  @override
  String get app__ack__done => '完成';

  @override
  String get app__ack__quit_app => '退出应用';

  @override
  String get app__ack__deleted => '已删除';

  @override
  String get app__ack__internet_connected => '互联网已连接';

  @override
  String get app__ack__internet_disconnected => '互联网已断开连接';

  @override
  String get app__ack__logout_success => '您已成功退出。';

  @override
  String get app__ack__no_app_for_file => '未找到打开此文件的应用程序。';

  @override
  String get app__ack__perm_fail_to_open_file => '未授予打开此文件的权限。';

  @override
  String get app__ack__missing_e2e_setup => '缺少加密设置';

  @override
  String app__ack__failed_to_sync({
    required String entityType,
    required String message,
  }) {
    return '同步 $entityType 失败：$message';
  }

  @override
  String app__index_pending({required int total}) {
    return '⚠️ 索引 $total 个剪辑以使其可搜索。只需片刻。';
  }

  @override
  String get app__indexing_completed => '🎉 索引完成。您的剪辑现在可以搜索。';

  @override
  String get dialog__delete_clip__title => '删除剪辑';

  @override
  String dialog__delete_clip__subtitle({required int itemCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      one: '确定要删除此剪辑吗？',
      other: '确定要删除这些剪辑吗？',
    );
    return '$_temp0';
  }

  @override
  String get dialog__e2e__title => '端到端加密';

  @override
  String get dialog__text__e2e_key_export => '恭喜，您已成功配置端到端加密。';

  @override
  String get dialog__text__e2e_key_export__note =>
      '点击下方按钮导出您的加密密钥。\n将密钥保存在安全地方，以确保您可以在其他设备上设置访问加密信息。';

  @override
  String get dialog__text__e2e_key_generate =>
      '生成加密密钥并妥善存储。此密钥是设置其他设备以访问加密数据所必需的。';

  @override
  String get dialog__button__e2e_generating_key => '生成中';

  @override
  String get dialog__button__e2e_generate_key => '已生成';

  @override
  String get dialog__text__invalid_e2e_key => '导入的密钥无效！';

  @override
  String get dialog__text__e2e_key_import__note => '在下方导入加密密钥，以便在此设备上访问加密数据。';

  @override
  String get dialog__button__e2e_importing_key => '导入中';

  @override
  String get dialog__button__e2e_import_key => '导入';

  @override
  String get dialog__button__e2e_clear_key => '清除密钥';

  @override
  String get dialog__title__e2e_clear_key => '清除加密密钥';

  @override
  String get dialog__text__e2e_clear_key__confirm =>
      '您确定要从此设备中移除加密密钥吗？在重新导入密钥之前，您将无法解密已加密的剪贴板内容。';

  @override
  String get dialog__text__inconsistent_time__title => '时间同步警告';

  @override
  String get dialog__text__inconsistent_time__content =>
      '检测到设备时间不一致\n\n为了确保准确的剪贴板同步，请检查并更正您的设备时间设置。\n\n时间设置不一致可能会导致同步问题。';

  @override
  String get dialog__text__inconsistent_time__still_off =>
      '系统时钟仍未同步。请手动校准系统时间。';

  @override
  String get dialog__text__inconsistent_time__ntp_unreachable =>
      '无法连接时间服务器。请检查网络连接，并手动同步系统时钟。';

  @override
  String get dialog__text__inconsistent_time__check_failed =>
      '时间检查失败。请手动更新系统时钟。';

  @override
  String get dialog__button__try_again => '再次检查';

  @override
  String get dialog__button__try_fix => '尝试自动修复';

  @override
  String get dialog__record_keys__title => '记录键盘快捷键';

  @override
  String get dialog__record_keys__subtitle => '使用键盘输入您的快捷键并点击 ';

  @override
  String dialog__delete_collection__title({required String collectionName}) {
    return '删除 $collectionName';
  }

  @override
  String get dialog__delete_collection__subtitle => '确定要删除此收藏夹吗？';

  @override
  String get dialog__ack__sub_updated => '订阅已更新';

  @override
  String get dialog__grant_entitlement__title => '授予权限';

  @override
  String get dialog__grant_entitlement__subtitle_p1 =>
      '特定个人共享权限码以获得自定义权限。您可以通过';

  @override
  String get dialog__grant_entitlement__subtitle_p2 => '点击这里查看邀请是否仍可用。';

  @override
  String get dialog__grant_entitlement__enter_code => '输入代码并按提交';

  @override
  String get dialog__grant_entitlement__code_label => '代码';

  @override
  String get dialog__grant_entitlement__apply_code => '应用';

  @override
  String get view_button__switch_to_grid => '切换到网格布局';

  @override
  String get view_button__switch_to_list => '切换到列表布局';

  @override
  String get view_button__change_view => '更改视图';

  @override
  String get view_button__view_window => '窗口化';

  @override
  String get view_button__view_dock_right => '右侧停靠';

  @override
  String get view_button__view_dock_bottom => '底部停靠';

  @override
  String get view_button__view_dock_left => '左侧停靠';

  @override
  String get view_button__view_dock_top => '顶部停靠';

  @override
  String get view_button__pin => '置顶';

  @override
  String get view_button__unpin => '取消置顶';

  @override
  String get sub_dialog__text__included => '包含';

  @override
  String get sub_dialog__f1__title => '无限剪贴板项目';

  @override
  String get sub_dialog__f1__subtitle => '无限制的剪贴板项目确保您始终可以访问最近的复制内容。';

  @override
  String get sub_dialog__f2__title => '支持所有主要平台';

  @override
  String get sub_dialog__f2__subtitle =>
      '在所有主要平台上无缝同步—Android、iOS、Windows、macOS 和 Linux，实现无缝的生产力。';

  @override
  String get sub_dialog__f3__title => '支持 Apple 通用剪贴板';

  @override
  String get sub_dialog__f3__subtitle =>
      '通过支持 Apple 的通用剪贴板，轻松在 Apple 设备之间传输剪贴板内容。';

  @override
  String get sub_dialog__f4__title => '设备内存储';

  @override
  String get sub_dialog__f4__subtitle =>
      '使用设备内存储保护您的数据，确保您的剪贴板项目始终触手可及，掌握在您手中。';

  @override
  String get sub_dialog__f5__title => 'Google Drive 集成';

  @override
  String get sub_dialog__f5__subtitle =>
      '将文件和媒体安全地存储在 Google Drive 上，便于与 CopyCat 剪贴板无缝集成，增强数据管理。';

  @override
  String get sub_dialog__f6__title => '即时搜索';

  @override
  String get sub_dialog__f6__subtitle => '通过强大的即时搜索功能快速找到所需内容，使剪贴板项目的检索高效且快捷。';

  @override
  String get sub_dialog__f7__title => '最近24小时内的同步';

  @override
  String get sub_dialog__f7__subtitle =>
      '在所有设备上访问和同步您过去 24 小时内的剪贴板历史记录。确保您不会丢失任何重要复制的项目，使您的工作流程无缝和高效。';

  @override
  String get sub_dialog__f8__title => '最多 3 个收藏';

  @override
  String get sub_dialog__f8__subtitle =>
      '将您的剪贴板项目整理到最多 3 个收藏中，从而提供更好的分类以提高工作效率。';

  @override
  String get sub_dialog__f9__title => '后台同步';

  @override
  String get sub_dialog__f9__subtitle =>
      '免费版同步采用尽力而为机制，具体可能因服务器负载而最多需要 15 分钟完成。';

  @override
  String get sub_dialog__f10__title => '支持端到端加密';

  @override
  String get sub_dialog__f10__subtitle => 'E2EE 将对所有内容进行加密，以实现出色的隐私保护。';

  @override
  String get sub_dialog__text__pro_title => '拥有 PRO';

  @override
  String get sub_dialog__text__pro_subtitle => '免费版包含的所有功能 +';

  @override
  String get sub_dialog__f11__title => '最多 50 个收藏';

  @override
  String get sub_dialog__f11__subtitle => '将您的剪贴板项目整理到最多 50 个收藏中，以实现最佳管理。';

  @override
  String get sub_dialog__f12__title => '最近 30 天的同步';

  @override
  String get sub_dialog__f12__subtitle =>
      '在所有设备上同步您最近30天内复制的剪贴板历史记录。这意味着无论您使用哪个设备，您都可以访问上个月复制的任意剪辑。';

  @override
  String get sub_dialog__f13__title => '实时同步';

  @override
  String get sub_dialog__f13__subtitle => '体验快速的同步效果。';

  @override
  String get sub_dialog__f14__title => '更快、更优先的支持';

  @override
  String get sub_dialog__f14__subtitle => '作为 PRO 用户，获得及时和优先级的支持。';

  @override
  String get sub_dialog__f15__title => '新功能的提前体验';

  @override
  String get sub_dialog__f15__subtitle => '率先尝试新功能和更新。';

  @override
  String get sub_dialog__f16__title => '自定义排除规则';

  @override
  String get sub_dialog__f16__subtitle => '精确控制您的剪贴板。允许您定义复制的内容、复制来源和复制时间。';

  @override
  String get sub_dialog__f17__title => '拖放功能';

  @override
  String get sub_dialog__f17__subtitle => '在桌面和平板设备上无缝移动项目。';

  @override
  String get sub_dialog__f18__title => '主题定制';

  @override
  String get sub_dialog__f18__subtitle => '自定义应用程序的整体外观，以匹配您的偏好。';

  @override
  String get paywall_dialog__text__month => '月';

  @override
  String get paywall_dialog__text__year => '年';

  @override
  String get paywall_dialog__text__subscription => '订阅';

  @override
  String get paywall_dialog__text__supported_platform =>
      '要访问 CopyCat 剪贴板上的高级功能，请通过 Google Play 或 Apple App Store 进行订阅。您的订阅将在所有设备（包括 Linux 和 Windows）上同步。';

  @override
  String get paywall_dialog__text__unlock_pro => '解锁 CopyCat PRO';

  @override
  String get paywall_dialog__text__unlock_pro_p1 =>
      '享受超过 30 天的同步历史记录、超过 50 个收藏、端到端加密、实时同步、新功能访问等。';

  @override
  String get paywall_dialog__text__try_again => '请再试一次';

  @override
  String get paywall_dialog__text__current_plan => '当前方案';

  @override
  String get paywall_dialog__text__expired_plan => '当前方案 • 已过期';

  @override
  String paywall_dialog__text__trial_till({required DateTime till}) {
    final intl.DateFormat tillDateFormat = intl.DateFormat.yMMMd(localeName);
    final String tillString = tillDateFormat.format(till);

    return '试用至 $tillString';
  }

  @override
  String get paywall_dialog__text__upgrade => '升级';

  @override
  String fab__create_collection({required String remaining}) {
    return '创建收藏 (剩余 $remaining)';
  }

  @override
  String get fab__sync => '同步';

  @override
  String get fab__sync_unavailable => '同步不可用';

  @override
  String get fab__sync_up_to_date => '已是最新状态。';

  @override
  String fab__sync_failed({required String message}) {
    return '同步失败：$message';
  }

  @override
  String get layout__navbar__clipboard => '剪贴板';

  @override
  String get layout__navbar__collections => '收藏';

  @override
  String get layout__navbar__settings => '设置';

  @override
  String get search__tooltip__filter => '搜索筛选';

  @override
  String manage_sub__ack__promo_sub({required String till}) {
    return '您正在使用促销订阅，直到 $till';
  }

  @override
  String get manage_sub__button__text => '管理订阅';

  @override
  String get my_account__button__tooltip => '我的账户';

  @override
  String get badges__tooltip__experimental => '此功能为实验性功能，可能无法正常工作。';

  @override
  String get badges__label__pro => 'Pro';

  @override
  String get badges__tooltip__pro_only => '此功能仅适用于专业用户。';

  @override
  String get collection_selector__tile__no_collection => '无收藏';

  @override
  String get collection_selector__button__remove_collection => '移除收藏';

  @override
  String get dialog__logout__title => '登出';

  @override
  String get dialog__logout__subtitle =>
      '⚠️ 警告 ⚠️\n\n登出将删除本地数据库中的未同步更改。您确定要继续吗？';

  @override
  String get dialog__logging_out__ack => '正在退出！请稍等...';

  @override
  String get reset_pass__text__label => '重置您的密码';

  @override
  String get dnd__text__drop_here => '拖放到此处';

  @override
  String dnd__ack__error_max_drop_count({required int count}) {
    return '一次最多允许拖放 $count 项。';
  }

  @override
  String get search_filter__text__title => '筛选';

  @override
  String get search_filter__button__apply => '应用';

  @override
  String get search_filter__text__from => '从';

  @override
  String get search_filter__text__select => '选择';

  @override
  String get search_filter__text__to => '到';

  @override
  String get search_filter__text__now => '现在';

  @override
  String get search_filter__text__including => '包括';

  @override
  String get search_filter__chip__text => '文本';

  @override
  String get search_filter__chip__url => '网址';

  @override
  String get search_filter__chip__media => '媒体';

  @override
  String get search_filter__chip__docs => '文档';

  @override
  String get search_filter__text__textCategories => '文本类别';

  @override
  String get search_filter__text__exclusive => '( 专属 )';

  @override
  String get search_filter__text_cat__email => '邮箱';

  @override
  String get search_filter__text_cat__phone => '电话号码';

  @override
  String get search_filter__text_cat__color => '颜色';

  @override
  String get search_filter__text_cat__struct => '结构化';

  @override
  String get search_filter__text__sort_by => '排序依据';

  @override
  String get search_filter__sort_by__last_mod => '最后修改';

  @override
  String get search_filter__sort_by__created => '创建时间';

  @override
  String get search_filter__sort_by__copy_count => '复制次数';

  @override
  String get search_filter__sort_by__last_copied => '上次复制';

  @override
  String get search_filter__text__sort_order => '排序顺序';

  @override
  String get search_filter__sort_ord__asc => '升序';

  @override
  String get search_filter__sort_ord__desc => '降序';

  @override
  String get search_filter__tooltip__clear => '清除';

  @override
  String get search_filter__empty => '∅';

  @override
  String get search_filter__button__reset => '重置';

  @override
  String get login__local_signin__tooltip => '无同步。所有数据都保存在您的设备上。';

  @override
  String get login__local_signin__btn__label => '离线模式';

  @override
  String get login__form__input__name => '输入您的大名';

  @override
  String get login__form__input__email => '输入您的邮箱';

  @override
  String get login__form__input__error_email => '请输入有效的邮件地址';

  @override
  String get login__form__input__password => '输入您的密码';

  @override
  String get login__form__input__error_password_length => '请输入至少6位长的密码';

  @override
  String get login__form__button__signin => '登录';

  @override
  String get login__form__button__signup => '注册';

  @override
  String get login__form__button__forgot_password => '忘记密码？';

  @override
  String get login__form__text__signup => '还没有账号？注册';

  @override
  String get login__form__text__old_user => '已有账号？登录';

  @override
  String get login__form__text__reset_password => '发送密码重置邮件';

  @override
  String get login__form__text__reset_ack => '密码重置邮件已发送';

  @override
  String get login__form__button__back => '返回登录';

  @override
  String get login__form__button__update_password => '更新密码';

  @override
  String get login__form__text_tnc_p1 => '继续即表示您同意以下 ';

  @override
  String get login__form__text_tnc_p2 => '隐私政策';

  @override
  String get login__form__text_tnc_p3 => ' 和 ';

  @override
  String get login__form__text_tnc_p4 => '服务条款。';

  @override
  String get home__search__hint => '在剪贴板中搜索';

  @override
  String get collections__search__hint => '搜索集合';

  @override
  String get home__search__reset => '重置搜索';

  @override
  String get preview__vert_view__tab1_title => '预览';

  @override
  String get preview__vert_view__tab2__title => '详细信息';

  @override
  String get preview__card__missing_text => '这是一个空剪辑';

  @override
  String get preview__card__video__play => '播放视频';

  @override
  String get preview__card__video__mute => '静音';

  @override
  String get preview__card__video__unmute => '取消静音';

  @override
  String get preview__card__video__close => '关闭播放器';

  @override
  String get preview__card__file__open => '打开文件';

  @override
  String get preview__form__title => '编辑详情';

  @override
  String get preview__inspector__lock_clip => '锁定片段';

  @override
  String get preview__inspector_lock_clip_description =>
      '加密此片段，禁用搜索索引，并要求身份验证才能查看。';

  @override
  String get preview__form__input__title => '标题';

  @override
  String get preview__form__input__description => '描述';

  @override
  String get preview__inspector__title => '剪辑详情';

  @override
  String get preview__inspector__untitled => '未命名剪辑';

  @override
  String get preview__inspector__saved => '详情已保存';

  @override
  String get preview__inspector__save_changes => '保存更改';

  @override
  String get preview__inspector__decrypt => '解密';

  @override
  String get preview__inspector__open_source => '打开来源';

  @override
  String get preview__inspector__section__actions => '操作';

  @override
  String get preview__inspector__section__details => '详情';

  @override
  String get preview__inspector__section__content => '内容';

  @override
  String get preview__inspector__section__security => '安全';

  @override
  String get preview__inspector__section__organize => '整理';

  @override
  String get preview__inspector__label__created => '创建时间';

  @override
  String get preview__inspector__label__modified => '修改时间';

  @override
  String get preview__inspector__label__last_copied => '上次复制';

  @override
  String get preview__inspector__label__copied_count => '复制次数';

  @override
  String get preview__inspector__label__source_app => '来源应用';

  @override
  String get preview__inspector__label__source_url => '来源网址';

  @override
  String get preview__inspector__label__file_size => '文件大小';

  @override
  String get preview__inspector__label__mime_type => 'MIME 类型';

  @override
  String get preview__inspector__label__extension => '扩展名';

  @override
  String get preview__inspector__label__characters => '字符数';

  @override
  String get preview__inspector__label__lines => '行数';

  @override
  String get preview__inspector__label__link => '链接';

  @override
  String get preview__inspector__label__image_dimension => '图片尺寸';

  @override
  String get preview__inspector__label__device => '设备';

  @override
  String get preview__inspector__label__storage => '存储位置';

  @override
  String get preview__inspector__status__encrypted => '已加密';

  @override
  String get preview__inspector__status__local_only => '仅本地';

  @override
  String get preview__inspector__status__synced => '已同步';

  @override
  String get preview__inspector__status__not_synced => '未同步';

  @override
  String get preview__inspector__status__download_required => '需要下载';

  @override
  String get preview__inspector__status__available => '可离线使用';

  @override
  String get preview__inspector__type__text => '文本';

  @override
  String get preview__inspector__type__media => '媒体';

  @override
  String get preview__inspector__type__file => '文件';

  @override
  String get preview__inspector__type__link => '链接';

  @override
  String get reset_password__appbar__title => '重置您的密码';

  @override
  String get reset_password__success_ack => '密码重置成功';

  @override
  String get onboarding__text__welcome => '欢迎来到';

  @override
  String get onboarding__text__lets_continue => '让我们继续';

  @override
  String get onboarding__button__to_login => '登录';

  @override
  String get onboarding__snackbar__export_success => '加密密钥成功导出。';

  @override
  String get onboarding__dialog__skip_export__title => '✋ 备份您的加密密钥';

  @override
  String get onboarding__dialog__skip_export__subtitle =>
      '您还没有导出您的加密密钥。如果没有备份，当密钥丢失或您切换设备时，您将无法访问您的加密剪辑。\n\n👉 如果您已经有密钥的安全备份，可以放心继续。否则，我们强烈建议您现在导出密钥以避免数据丢失。您是否仍希望继续？';

  @override
  String get onboarding__dialog__export_info__title => '🤔 为什么要导出加密密钥？';

  @override
  String get onboarding__dialog__export_info__subtitle =>
      '导出您的加密密钥对于在多个设备上安全访问您的加密数据至关重要。没有密钥，您的加密数据在同步后将无法访问。\n\n在安全位置保留您的加密密钥备份以防止数据丢失。请记住，密钥是您账户的唯一身份标识，若丢失则无法恢复。\n\n注意：CopyCat无法访问您的加密剪辑或加密密钥。因为我们将您的隐私置于首位。';

  @override
  String get onboarding__text__export_key_headline => '剪贴板加密';

  @override
  String get onboarding__text__export_key_title => '💪 好消息！您的剪贴板已激活加密';

  @override
  String get onboarding__button__export_key => '导出密钥';

  @override
  String get onboarding__dialog__skip_gen_key__title => '✋ 您的剪辑将不安全';

  @override
  String get onboarding__dialog__skip_gen_key__subtitle =>
      '您还没有生成加密密钥。没有它，您的剪辑将保持为未加密状态并不安全。您可以稍后在 设置 ❯ 安全 中生成密钥。您是否仍希望继续？';

  @override
  String get onboarding__dialog__gen_key_info__title => '🤔 我为什么需要加密？';

  @override
  String get onboarding__dialog__gen_key_info__subtitle =>
      '加密通过将您的数据转换为仅用密钥才能访问的格式来保护您的数据。没有加密，您的剪辑将以明文存储，使其容易遭受未经授权的访问。启用加密可确保只有您可以访问您的敏感数据，为潜在的数据泄露提供了额外的安全层。';

  @override
  String get onboarding__text__gen_key_headline => '设置剪贴板加密';

  @override
  String onboarding__text__key_generated_title({required String keyPreview}) {
    return '🎉 已成功生成密钥 $keyPreview*** 🎉';
  }

  @override
  String get onboarding__button__regenerate_key => '重新生成密钥';

  @override
  String get onboarding__text__no_key => '您的账户没有任何加密密钥';

  @override
  String get onboarding__button__generate_key => '生成密钥';

  @override
  String get onboarding__button__do_it_later => '稍后再做';

  @override
  String get onboarding__button__why_important => '为什么重要？';

  @override
  String get onboarding__snackbar__invalid_key => '这不是一个有效的 CopyCat 加密密钥';

  @override
  String get onboarding__dialog__skip_import__title => '✋ 加密剪辑不可访问';

  @override
  String get onboarding__dialog__skip_import__subtitle =>
      '您还没有导入加密密钥。这意味着您的所有加密剪辑在同步后将无法在本地访问。\n\n要访问它们，请从 设置 ❯ 安全 中导入密钥。\n您是否仍希望继续？';

  @override
  String get onboarding__dialog__reset_key__title => '✋ 永久删除加密数据';

  @override
  String get onboarding__dialog__reset_key__subtitle =>
      '此操作不可撤销。您确定要从服务器永久删除所有加密数据吗？';

  @override
  String get onboarding__snackbar__reset_key__success => '加密已成功移除。';

  @override
  String get onboarding__dialog__import_info__title => '🤔 我的密钥在哪里？';

  @override
  String get onboarding__dialog__import_info__subtitle =>
      '您的加密密钥是加密设置过程中的一个安全文件。如果您找不到它，请检查您的下载文件夹或您可能保存的任何备份位置。没有这个密钥，您的加密数据将无法访问。\n\n如果您在另一个设备上设置了加密密钥，可以通过转到设置 ❯ 安全 ❯ E2EE 保险箱导出密钥。将密钥安全地传输到此设备以重新获得对您的加密数据的访问权限。';

  @override
  String get onboarding__text__import_key_headline => '导入剪贴板加密密钥';

  @override
  String get onboarding__text__import_key_title => '您的帐户当前已激活加密。';

  @override
  String get onboarding__button__import_key => '导入密钥';

  @override
  String get onboarding__button__reset_key => '重置加密';

  @override
  String get onboarding__button__where_key => '密钥在哪里？';

  @override
  String get onboarding__text__go_home => '回家吧';

  @override
  String onboarding__restoration__failed({required String message}) {
    return '恢复失败: $message';
  }

  @override
  String get onboarding__restoration_warning =>
      '⚠️ 请在同步过程中保持此页面打开，以避免数据损坏或不一致。';

  @override
  String get sync_restore__title => '正在恢复你的工作区';

  @override
  String get sync_restore__subtitle => 'CopyCat 正在将已同步的收藏和剪贴板历史恢复到此设备。';

  @override
  String get sync_restore__checking_backup => '正在检查远程备份...';

  @override
  String get sync_restore__decrypting_title => '正在解密剪辑';

  @override
  String get sync_restore__decrypting_counting => '正在统计加密剪辑...';

  @override
  String sync_restore__decrypting_progress({
    required int decrypted,
    required int total,
  }) {
    return '已解密 $decrypted / $total';
  }

  @override
  String get sync_restore__workspace_restored => '工作区已恢复';

  @override
  String get sync_restore__data_ready => '你的同步数据已可在此设备上使用。';

  @override
  String get sync_restore__restoring_collections => '正在恢复收藏，以保持剪贴板项目的组织结构。';

  @override
  String get sync_restore__restoring_clips => '收藏已恢复。接下来恢复剪贴板历史。';

  @override
  String get sync_restore__finishing_checks => '正在完成恢复检查。';

  @override
  String get sync_restore__no_synced_items => '未找到已同步项目';

  @override
  String sync_restore__restored_count({required int count}) {
    return '已恢复 $count 项';
  }

  @override
  String sync_restore__restored_of_total({
    required int synced,
    required int total,
  }) {
    return '已恢复 $synced / $total 项';
  }

  @override
  String get sync_restore__progress_estimating => '正在估算';

  @override
  String get sync_restore__progress_complete => '已完成';

  @override
  String get sync_restore__status_ready => '就绪';

  @override
  String get sync_restore__status_restoring => '恢复中';

  @override
  String get sync_restore__collections_title => '收藏';

  @override
  String get sync_restore__collections_description => '已保存的分组和组织结构';

  @override
  String get sync_restore__clipboard_items_title => '剪贴板项目';

  @override
  String get sync_restore__clipboard_items_description => '历史、文本、链接、文件和媒体';

  @override
  String sync_restore__count_of_total({required int total}) {
    return '共 $total 项';
  }

  @override
  String get sync_restore__continue_to_copycat => '继续使用 CopyCat';

  @override
  String get sync_restore__failed_title => '恢复失败';

  @override
  String get restore_clips__text__title => '恢复我的剪贴板';

  @override
  String get restore_clips__error__no_backup => '未找到剪贴板备份';

  @override
  String restore_clips__text__total_count({required int totalCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      totalCount,
      locale: localeName,
      zero: '剪贴板',
      one: '剪贴板',
      other: '剪贴板',
    );
    return '您大约有 $totalCount $_temp0 需要恢复。';
  }

  @override
  String get restore_clips__sync_disable => '当前未启用同步。请启用同步以继续。';

  @override
  String get restore_clips__preparing => '正在准备恢复剪贴板，请稍候...';

  @override
  String restore_clips__restored({required int syncCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      syncCount,
      locale: localeName,
      zero: '剪贴板',
      one: '剪贴板',
      other: '剪贴板',
    );
    return '您的 $syncCount $_temp0 已成功恢复。';
  }

  @override
  String restore_clips__restoring({
    required int synced,
    required int totalCount,
  }) {
    return '已恢复: $synced / $totalCount 个剪贴板。';
  }

  @override
  String get restore_collections__text__title => '恢复我的收藏夹';

  @override
  String get restore_collections__error__no_backup => '未找到收藏夹备份';

  @override
  String restore_collections__text__total_count({required int totalCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      totalCount,
      locale: localeName,
      zero: '收藏夹',
      one: '收藏夹',
      other: '收藏夹',
    );
    return '您大约有 $totalCount $_temp0 需要恢复。';
  }

  @override
  String get restore_collections__sync_disable => '当前未启用同步。请启用同步以继续。';

  @override
  String get restore_collections__preparing => '正在准备恢复收藏夹，请稍候...';

  @override
  String restore_collections__restored({required int syncCount}) {
    String _temp0 = intl.Intl.pluralLogic(
      syncCount,
      locale: localeName,
      zero: '收藏夹',
      one: '收藏夹',
      other: '收藏夹',
    );
    return '您的 $syncCount $_temp0 已成功恢复。';
  }

  @override
  String restore_collections__restoring({
    required int synced,
    required int totalCount,
  }) {
    return '已恢复: $synced / $totalCount 个收藏夹。';
  }

  @override
  String get drive__snackbar__success => '驱动设置已完成。';

  @override
  String get drive__text__setting_up => '设置和同步中...';

  @override
  String get drive__text__setting_up__warning => '请稍候，直到我们完成此步骤。不要关闭应用程序。';

  @override
  String get create_clip__appbar__title__new => '新剪辑';

  @override
  String get create_clip__appbar__title__edit => '编辑剪辑';

  @override
  String get create_clip__button__save_new => '保存为新';

  @override
  String get create_clip__input__hint => '在此处编写您的剪辑内容';

  @override
  String get collections__text__tip => '确保您的重要剪辑在任何时间、任何设备上都可用，将它们保存在收藏夹中！';

  @override
  String get collections__appbar__title => '收藏夹';

  @override
  String get collections__appbar__title__create => '创建收藏';

  @override
  String get collections__appbar__title__edit => '编辑收藏';

  @override
  String get collections__input__name => '名称';

  @override
  String get collections__input__description => '描述';

  @override
  String get collections__label__emoji => '收藏夹图标（点击更改）';

  @override
  String get collections__validation__duplicate => '已存在相同名称和图标的收藏夹';

  @override
  String get collections__validation__name_required => '请输入名称。';

  @override
  String get collections__validation__name_max_length => '名称最多 30 个字符。';

  @override
  String get select_collection__appbar__title => '选择收藏';

  @override
  String get account__dialog__delete_confirm__title => '账户删除申请';

  @override
  String get account__dialog__delete_confirm__description =>
      '您将被重定向到账户删除申请表，您确定吗？';

  @override
  String get account__list_tile__display_name => '显示名称';

  @override
  String get account__list_tile__email => '邮箱';

  @override
  String get account__list_tile__settings => '账户设置';

  @override
  String get account__list_tile__danger_zone => '危险区域';

  @override
  String get account__button__req_delete => '申请账户删除';

  @override
  String get account__appbar__title => '我的账户';

  @override
  String get settings__appbar__title => '设置';

  @override
  String get settings__header__appearance => '外观';

  @override
  String get settings__header__sorting => '默认排序';

  @override
  String get settings__header__interactions => '交互';

  @override
  String get settings__tab__1 => '常规';

  @override
  String get settings__tab__2 => '个性化';

  @override
  String get settings__tab__3 => '云端';

  @override
  String get settings__tab__4 => '安全';

  @override
  String get settings__tab__5 => '实验性';

  @override
  String get settings__text__encryption => '加密';

  @override
  String get settings__text__sync_not_available => '使用本地剪贴板时，同步相关配置不可用。';

  @override
  String get settings__appbar__er__title => '排除规则';

  @override
  String get settings__text__er__predefine => '预定义排除规则';

  @override
  String get settings__text__er__pass_manager => '密码管理器';

  @override
  String get settings__text__er__pass_manager__subtitle => '排除来自密码管理器应用的剪贴内容';

  @override
  String get settings__text__er__cc => '信用卡号';

  @override
  String get settings__text__er__cc__subtitle => '排除检测到的信用卡号';

  @override
  String get settings__text__er__phone => '电话号码';

  @override
  String get settings__text__er__phone__subtitle => '排除检测到的电话号码';

  @override
  String get settings__text__er__email => '电子邮件地址';

  @override
  String get settings__text__er__email__subtitle => '排除检测到的电子邮件地址';

  @override
  String get settings__text__er__url => '敏感网址';

  @override
  String get settings__text__er__url__subtitle => '排除包含敏感网址的剪贴内容';

  @override
  String get settings__text__decrypted__note =>
      '🥳 恭喜！您所有的剪辑已成功在本地解密，\n因此不需要重建数据库。';

  @override
  String get settings__appbar__cer__title => '自定义排除规则';

  @override
  String get settings__switch__drag_n_drop__title => '拖放';

  @override
  String get settings__switch__drag_n_drop__subtitle => '允许项目在应用内自由双向移动。';

  @override
  String get settings__dropdown__no_copy_over_limit__title => '不自动复制超过';

  @override
  String settings__dropdown__no_copy_over_limit__subtitle({
    required String fileSize,
  }) {
    return '超过一定大小($fileSize)的文件和媒体不会自动复制。';
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
  String get settings__dropdown__no_upload_over_limit__title => '不自动上传超过';

  @override
  String settings__dropdown__no_upload_over_limit__subtitle({
    required String fileSize,
  }) {
    return '超过一定大小($fileSize)的文件和媒体不会自动上传。';
  }

  @override
  String get settings__dropdown__sync_mode__title => '同步模式';

  @override
  String get settings__dropdown__sync_mode__subtitle => '选择最适合您的同步速度。';

  @override
  String get settings__sync_mode__realtime => '实时';

  @override
  String get settings__sync_mode__balanced => '平衡';

  @override
  String get settings__dropdown__theme__title => '主题模式';

  @override
  String get settings__dropdown__default_sort__title => '排序方式';

  @override
  String get settings__dropdown__default_sort_order__title => '排序顺序';

  @override
  String get settings__theme__system => '系统';

  @override
  String get settings__theme__light => '浅色';

  @override
  String get settings__theme__dark => '深色';

  @override
  String get settings__dropdown__color_mode__title => '颜色模式';

  @override
  String get settings__dropdown__color_mode__subtitle =>
      '选择颜色模式以自定义应用程序的外观。默认选项为“色调点”。';

  @override
  String get settings__dropdown__clipboard_feedback__title => '剪贴板反馈';

  @override
  String get settings__dropdown__clipboard_feedback__subtitle =>
      '选择 CopyCat 在捕获剪辑时的响应方式。';

  @override
  String get settings__clipboard_feedback__disabled => '禁用';

  @override
  String get settings__clipboard_feedback__copy_only => '仅复制';

  @override
  String get settings__clipboard_feedback__sync_only => '仅同步';

  @override
  String get settings__clipboard_feedback__copy_and_sync => '复制与同步';

  @override
  String get settings__clipboard_feedback__toast => '吐司';

  @override
  String get settings__color_mode__tonalSpot => '色调点';

  @override
  String get settings__color_mode__content => '内容';

  @override
  String get settings__color_mode__expressive => '表现力';

  @override
  String get settings__color_mode__fidelity => '保真';

  @override
  String get settings__color_mode__fruit_salad => '水果沙拉';

  @override
  String get settings__color_mode__monochrome => '单色';

  @override
  String get settings__color_mode__neutral => '中性';

  @override
  String get settings__color_mode__rainbow => '彩虹';

  @override
  String get settings__color_mode__vibrant => '活力';

  @override
  String get settings__tile__cer_title => '自定义规则';

  @override
  String get settings__tile__cer_subtitle => '根据应用、应用窗口/网站标题、网站网址或正则表达式模式排除';

  @override
  String get settings__tile__er_title => '排除规则';

  @override
  String get settings__tile__er_subtitle => '防止信息复制到剪贴板。点击以获得高级控制。';

  @override
  String get settings__switch__enable_sync__title => '剪贴板同步';

  @override
  String get settings__switch__enable_sync__subtitle => '无缝地同步您的剪贴板到其他设备。';

  @override
  String get settings__switch__sync_file__title => '文件和媒体同步';

  @override
  String get settings__switch__sync_file__subtitle => '切换以在设备间同步文件和媒体剪辑。';

  @override
  String get settings__switch__paused__title => '暂停剪贴板监听';

  @override
  String get settings__switch__paused__subtitle => '暂时暂停剪贴板跟踪直到设置的时间。';

  @override
  String settings__switch__paused_active__subtitle({required DateTime time}) {
    final intl.DateFormat timeDateFormat = intl.DateFormat(
      'h:mm a',
      localeName,
    );
    final String timeString = timeDateFormat.format(time);

    return '暂停到 $timeString 。轻触以恢复或调整时间。';
  }

  @override
  String get settings__switch__smart_paste__title => '智能粘贴';

  @override
  String get settings__switch__smart_paste__subtitle => '直接在目标应用上粘贴内容。';

  @override
  String get settings__switch__focus_loss_behavior__title => '失去焦点时保持窗口打开';

  @override
  String get settings__switch__focus_loss_behavior__subtitle =>
      '当 CopyCat 失去焦点时，保持其在后台打开，而不是自动隐藏。';

  @override
  String get settings__switch__transform_behavior__title => '将转换结果保存为新剪辑';

  @override
  String get settings__switch__transform_behavior__subtitle =>
      '启用后，转换操作会创建新剪辑，而不是立即复制或粘贴。';

  @override
  String get settings__switch__type_search__title => '输入时搜索';

  @override
  String get settings__switch__type_search__subtitle => '在搜索栏输入时实时搜索剪辑。';

  @override
  String get settings__switch__startup__title => '启动时运行';

  @override
  String get settings__switch__startup__subtitle => '设备启动时自动启动 CopyCat。';

  @override
  String get settings__switch__tray_icon__title => '显示菜单栏图标';

  @override
  String get settings__switch__tray_icon__subtitle =>
      '在系统菜单栏 / 托盘中显示 CopyCat 图标。';

  @override
  String get settings__switch__hide_from_screen_capture__title => '在屏幕录制中隐藏';

  @override
  String get settings__switch__hide_from_screen_capture__subtitle =>
      '启用后，在支持的平台上进行截图或录屏时将隐藏 CopyCat 内容。';

  @override
  String get settings__switch__hotkey__title => '用快捷键切换';

  @override
  String get settings__switch__hotkey__subtitle => '使用键盘快捷键快速访问 CopyCat 剪贴板';

  @override
  String get settings__switch__paste_stack_hotkey__title => 'Paste Stack 快捷键';

  @override
  String get settings__switch__paste_stack_hotkey__subtitle =>
      '使用键盘快捷键打开或关闭 Paste Stack';

  @override
  String get settings__switch__quickpaste_hotkey__title => 'Quick Paste 快捷键';

  @override
  String get settings__switch__quickpaste_hotkey__subtitle =>
      '使用键盘快捷键快速访问您最常用的 10 个剪贴板项目';

  @override
  String get settings__hotkey__unassigned => '未分配';

  @override
  String get settings__hotkey__preview_start => '按 ';

  @override
  String get settings__hotkey__preview_end => ' 来显示或隐藏应用。';

  @override
  String get settings__tile__theme_color__title => '主题颜色';

  @override
  String get settings__tile__theme_color__subtitle => '此颜色将影响应用程序的整体外观。';

  @override
  String get settings__tile__desk_client__title => '下载桌面客户端';

  @override
  String get settings__tile__mobile_client__title => '下载手机客户端';

  @override
  String get settings__tile__client__subtitle => '在所有设备上访问您的剪贴板。';

  @override
  String get settings__tile__e2e_setup__title => '端到端加密设置';

  @override
  String get settings__tile__e2e_setup__subtitle => '配置您的剪贴板加密。';

  @override
  String get settings__switch__e2e__title => '启用加密';

  @override
  String get settings__switch__e2e__subtitle => '切换以激活或停用您的剪贴板的端到端加密。';

  @override
  String get settings__switch__e2e_nonce__title => '高安全模式（推荐）';

  @override
  String get settings__switch__e2e_nonce__subtitle =>
      '使用 AES-GCM 提供更强的数据保护和篡改检测。（旧版本应用无法解密这些新剪辑）';

  @override
  String get settings__dialog__conn_gdrive__title => '重新连接 Google Drive?';

  @override
  String get settings__dialog__conn_gdrive__subtitle =>
      '您的 Google Drive 已连接！您想重新连接？\n\n为避免任何数据丢失，请确保使用之前的相同帐户。';

  @override
  String get settings__drive__connected => '已连接';

  @override
  String get settings__drive__loading => '载入中...';

  @override
  String get settings__drive__authorizing => '授权中...';

  @override
  String get settings__drive__connect => '连接';

  @override
  String get settings__drive__disconnected => '已断开连接';

  @override
  String get settings__text__cloud__title => '云端驱动';

  @override
  String get settings__text__cloud__name => 'Google Drive';

  @override
  String get settings__text__gdrive__error => 'Google Drive 未连接。文件和媒体同步目前已停用。';

  @override
  String get settings__text__gdrive__info =>
      '您的文件和媒体通过受支持的云提供商安全地跨设备同步，确保您的隐私得到保护。连接多个提供商时，您可以为新上传选择默认存储。';

  @override
  String get settings__drive__default_tooltip => '默认上传存储';

  @override
  String get settings__drive__set_default => '设为默认';

  @override
  String get settings__tile__other_cloud__title => '设置其他云端驱动';

  @override
  String get settings__text__webdav__name => 'WebDAV';

  @override
  String get settings__text__webdav__info =>
      '连接您的 WebDAV 服务器（Nextcloud、ownCloud、Synology NAS 等）以存储和同步您的文件及媒体附件。';

  @override
  String get settings__dialog__webdav__title => 'WebDAV 存储';

  @override
  String get settings__dialog__webdav__preset_provider => '预设服务商';

  @override
  String get settings__dialog__webdav__server_url => '服务器 URL';

  @override
  String get settings__dialog__webdav__server_url_hint =>
      'https://cloud.example.com/remote.php/dav/files/username/';

  @override
  String get settings__dialog__webdav__username => '用户名';

  @override
  String get settings__dialog__webdav__password => '密码 / 应用密码';

  @override
  String get settings__dialog__webdav__base_path => '存储文件夹路径';

  @override
  String get settings__dialog__webdav__base_path_helper =>
      '文件夹路径在设置后无法更改。如需更改，请先断开连接。';

  @override
  String get settings__dialog__webdav__advanced => '高级';

  @override
  String get settings__dialog__webdav__self_signed => '允许自签名 / 不安全证书';

  @override
  String get settings__dialog__webdav__auto_clean => '30 天后自动清理非活动文件';

  @override
  String get settings__dialog__webdav__auto_clean_subtitle =>
      '由于 WebDAV 凭据仅保留在您的设备本地，云清理不会删除远程文件。启用后，自上次修改起超过 30 天的媒体文件将从您的 WebDAV 服务器中删除。收藏中或已锁定的剪贴片段始终受到保护。';

  @override
  String get settings__dialog__webdav__test_conn => '测试连接';

  @override
  String get settings__dialog__webdav__testing => '正在测试连接...';

  @override
  String get settings__dialog__webdav__test_success => '连接成功！';

  @override
  String get settings__dialog__webdav__disconnect => '断开连接';

  @override
  String get settings__dialog__webdav__save => '保存并连接';

  @override
  String get settings__dialog__webdav__reconnect_title => 'WebDAV 设置';

  @override
  String get settings__dialog__webdav__reconnect_subtitle =>
      'WebDAV 已连接。更新设置还是断开连接？';

  @override
  String get settings__dialog__webdav__url_required => '请输入有效的 WebDAV 服务器 URL';

  @override
  String get settings__dialog__webdav__username_required => '请输入用户名';

  @override
  String get settings__dialog__webdav__password_required => '请输入密码或应用令牌';

  @override
  String get settings__app_lock__title => '应用锁定';

  @override
  String get settings__app_lock__tile__subtitle => '需要生物识别或设备 PIN 才能访问剪贴板';

  @override
  String get settings__app_lock__no_biometrics =>
      '未找到生物识别或设备凭据。请先在设备设置中设置 PIN 或生物识别。';

  @override
  String get settings__app_lock__lock_after__title => '锁定时间';

  @override
  String get settings__app_lock__lock_after__subtitle => '当应用进入后台时自动锁定';

  @override
  String get settings__app_lock__timeout__immediately => '立即';

  @override
  String settings__app_lock__timeout__minutes({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '分钟',
      one: '分钟',
    );
    return '$count $_temp0';
  }

  @override
  String get app_lock__screen__locked => '已锁定';

  @override
  String get app_lock__screen__unlock => '解锁';

  @override
  String get settings__lan__title => '局域网';

  @override
  String get settings__lan__service_inactive => '启动后台服务以使用局域网同步';

  @override
  String get settings__lan__subtitle__disabled => '与附近设备即时同步剪贴板';

  @override
  String get settings__lan__subtitle__mobile => '后台服务正在扫描附近设备';

  @override
  String get settings__lan__searching => '正在搜索设备…';

  @override
  String settings__lan__devices_found({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '台设备',
      one: '台设备',
    );
    return '$count $_temp0在网络中找到';
  }

  @override
  String get settings__auto_write__title => '接收自动写入';

  @override
  String get settings__auto_write__subtitle => '自动将传入的剪贴板内容复制到剪贴板';

  @override
  String get settings__sync__manage_devices__title => '管理同步设备';

  @override
  String get settings__sync__manage_devices__subtitle => '查看活跃设备并从同步访问中移除设备。';

  @override
  String get settings__lan_mesh__app_bar_title => '局域网';

  @override
  String get settings__lan_mesh__unknown_device => '未知设备';

  @override
  String get settings__lan_mesh__searching => '正在搜索网络中的设备…';

  @override
  String get settings__lan_mesh__reachable => '可访问';

  @override
  String get settings__lan_mesh__unreachable => '不可访问';

  @override
  String get settings__lan_mesh__disabled_banner =>
      '局域网即时同步已禁用。请在设置中启用以发现附近设备。';

  @override
  String get settings__device_mgmt__app_bar_title => '管理同步设备';

  @override
  String get settings__device_mgmt__dialog_title => '移除同步权限';

  @override
  String get settings__device_mgmt__dialog_cancel => '取消';

  @override
  String get settings__device_mgmt__dialog_remove => '移除';

  @override
  String get settings__device_mgmt__revoke_failed => '移除同步权限失败。';

  @override
  String get settings__device_mgmt__active_now => '活跃中';

  @override
  String settings__device_mgmt__today_at({required String time}) {
    return '今天 $time';
  }

  @override
  String settings__device_mgmt__days_ago({required int count}) {
    return '$count天前';
  }

  @override
  String get settings__device_mgmt__load_failed => '加载设备失败。';

  @override
  String get settings__device_mgmt__retry => '重试';

  @override
  String get settings__device_mgmt__empty => '未找到同步设备。';

  @override
  String get settings__device_mgmt__max_limit_tooltip => '您当前套餐可同步的最大设备数量。';

  @override
  String settings__device_mgmt__max_limit_label({required int count}) {
    return '上限 • $count';
  }

  @override
  String get settings__device_mgmt__active_count_tooltip => '当前活跃设备数量。';

  @override
  String settings__device_mgmt__active_count_label({required int count}) {
    return '活跃 • $count';
  }

  @override
  String settings__device_card__last_seen({required String time}) {
    return '上次在线：$time';
  }

  @override
  String get settings__device_card__revoke => '撤销';

  @override
  String get device_mgmt_verification_failed => '无法验证同步设备的访问权限。请检查您的网络连接并重试。';

  @override
  String get device_mgmt_limit_reached =>
      '由于已达到您的计划设备限制，此设备上的同步已被禁用。请从设置 > 同步 > 管理同步设备中移除其他设备。';

  @override
  String get custom_er__nav__1 => '应用';

  @override
  String get custom_er__nav__2 => '窗口标题';

  @override
  String get custom_er__nav__3 => '网址';

  @override
  String get custom_er__nav__4 => '文本模式';

  @override
  String get custom_er__text__not_supported => '此排除尚不支持';

  @override
  String get custom_er__tile__add_app => '添加一个应用程序';

  @override
  String get custom_er__text__no_app => '尚无自定义排除的应用';

  @override
  String get custom_er__button__remove_app => '移除此应用';

  @override
  String get custom_er__tile__pattern => '当复制的内容符合这些模式时禁止复制';

  @override
  String get custom_er__text__no_pattern => '尚无自定义排除模式';

  @override
  String get custom_er__button__remove_pattern => '移除此模式';

  @override
  String get custom_er__tile__url => '禁止从符合这些网址段的网页复制。';

  @override
  String get custom_er__input__url_hint => '输入一个网址或网址的一部分。';

  @override
  String get custom_er__text__no_url => '尚无自定义排除网址';

  @override
  String get custom_er__button__remove_url => '移除此网址';

  @override
  String get custom_er__tile__title => '当窗口标题匹配时禁止从应用或网站复制。';

  @override
  String get custom_er__text__no_title => '尚无自定义排除标题';

  @override
  String get custom_er__button__remove_title => '移除此标题';

  @override
  String get about__tile__discord => 'Discord • 连接';

  @override
  String get about__tile__youtube => 'YouTube • 教程';

  @override
  String get about__tile__read_tut => '阅读 • 教程';

  @override
  String get about__tile__github => 'Github • 开源';

  @override
  String get about__tile__website => 'EntilityStudio • 网站';

  @override
  String get about__tile__support => '支持';

  @override
  String get abc_title => '后台剪贴板';

  @override
  String get abc__tile__subtitle => '在后台监听剪贴板';

  @override
  String get abc__tip__why_title => '为什么需要这些权限？';

  @override
  String get abc__tip__why_subtitle =>
      '这些权限确保CopyCat在后台正常运行，能够检测到复制的内容，为您提供无缝体验，避免中断。';

  @override
  String get abc__heading__req_perm => '所需权限';

  @override
  String get abc__tile__notification_title => '通知访问';

  @override
  String get abc__tile__notification_subtitle =>
      '显示一个持久通知，告知您CopyCat正在后台运行，确保透明度和隐私。';

  @override
  String get abc__tile__battery_opt_title => '电池优化';

  @override
  String get abc__tile__battery_opt_subtitle => '防止系统在后台运行时关闭CopyCat，确保顺畅体验。';

  @override
  String get abc__tile__overlay_title => '叠加权限';

  @override
  String get abc__tile__overlay_subtitle =>
      '允许CopyCat通过在屏幕上打开一个透明窗口并立即关闭，来读取剪贴板。';

  @override
  String get abc__tile__acc_title => '辅助功能服务';

  @override
  String get abc__tile__acc_subtitle =>
      '启动CopyCat后台监听器，检测您复制的内容，并确保在重启后自动重新启动该服务。';

  @override
  String get abc__ack__ready => '设置准备好配置。';

  @override
  String get abc__ack__preparing => '正在准备设置，请稍候...';

  @override
  String get abc__perm_alert_open_setting__button => '打开设置';

  @override
  String get abc__overlay_perm_alert__title => '悬浮窗权限';

  @override
  String get abc__overlay_perm_alert__subtitle =>
      'CopyCat Clipboard 需要“在其他应用上层显示”权限以在后台读取剪贴板内容。';

  @override
  String get abc__overlay_perm_alert__p1_prefix => '此权限 ';

  @override
  String get abc__overlay_perm_alert__p1_bold => '仅用于剪贴板检测';

  @override
  String get abc__overlay_perm_alert__p1_suffix => ' 当您在后台复制内容时。';

  @override
  String get abc__overlay_perm_alert__p2_prefix => '启用后，CopyCat ';

  @override
  String get abc__overlay_perm_alert__p2_bold => '会创建一个0像素的透明窗口';

  @override
  String get abc__overlay_perm_alert__p2_suffix => ' 以短暂将应用带到前台并读取剪贴板数据。';

  @override
  String get abc__overlay_perm_alert__p3_prefix => '在此过程中，应用 ';

  @override
  String get abc__overlay_perm_alert__p3_bold => '不会显示任何内容';

  @override
  String get abc__overlay_perm_alert__p3_suffix => ' 在您的屏幕上。';

  @override
  String get abc__overlay_perm_alert__p4_prefix => '在某些设备上，系统可能会显示一条提示消息 ';

  @override
  String get abc__overlay_perm_alert__p4_bold => '“CopyCat 从您的剪贴板粘贴”';

  @override
  String get abc__overlay_perm_alert__p4_suffix => ' 当 CopyCat 读取您的剪贴板内容时。';

  @override
  String get abc__overlay_perm_alert__agree => '授予此权限即表示您同意上述用途。';

  @override
  String get abc__accessibility_perm_alert__title => '无障碍权限';

  @override
  String get abc__accessibility_perm_alert__subtitle =>
      'CopyCat Clipboard 需要无障碍服务以在后台运行，实现实时剪贴板检测和同步。';

  @override
  String get abc__accessibility_perm_alert__p1_prefix => '此服务 ';

  @override
  String get abc__accessibility_perm_alert__p1_bold => '仅用于';

  @override
  String get abc__accessibility_perm_alert__p1_suffix => ' 检测剪贴板内容并在启用时跨设备同步。';

  @override
  String get abc__accessibility_perm_alert__p2_prefix => '您可以使用 ';

  @override
  String get abc__accessibility_perm_alert__p2_bold => '排除特定应用';

  @override
  String get abc__accessibility_perm_alert__p2_suffix => ' 通过排除规则功能。';

  @override
  String get abc__accessibility_perm_alert__p3_prefix => '该应用 ';

  @override
  String get abc__accessibility_perm_alert__p3_bold => '不会访问任何其他数据';

  @override
  String get abc__accessibility_perm_alert__p3_suffix => ' 除了剪贴板内容。';

  @override
  String get abc__accessibility_perm_alert__p4_prefix => '剪贴板数据 ';

  @override
  String get abc__accessibility_perm_alert__p4_bold => '不会外部共享';

  @override
  String get abc__accessibility_perm_alert__p4_suffix => ' 并且仅在您的设备上保持私密。';

  @override
  String get abc__accessibility_perm_alert__p5_prefix => '剪贴板数据 ';

  @override
  String get abc__accessibility_perm_alert__p5_bold => '端到端加密';

  @override
  String get abc__accessibility_perm_alert__p5_suffix =>
      '（如果启用）在传输和存储过程中，确保跨设备的隐私。';

  @override
  String get abc__accessibility_perm_alert__agree => '启用无障碍服务即表示您承认并同意上述条款。';

  @override
  String get abc__other_setting__title => '其他设置';

  @override
  String get abc__tile__two_way_sync__title => '双向同步';

  @override
  String abc__tile__two_way_sync__subtitle({required String warning}) {
    return '让您的剪贴板内容在设备间即时同步。\n$warning';
  }

  @override
  String get abc__tile__two_way_sync__realtime_required => '⚠️ 需要启用实时模式。';

  @override
  String get abc__ack__detection_mode_cleared => '检测模式已清除';

  @override
  String get abc__ack__detection_mode_updated => '检测模式已更新';

  @override
  String abc__ack__detection_mode_update_failed({required String message}) {
    return '更新检测模式失败：$message';
  }

  @override
  String get abc__detection_mode__title => '检测模式';

  @override
  String get abc__detection_mode__subtitle__enabled =>
      '选择CopyCat检测其他应用中复制操作的方式。CopyCat在您选择模式之前保持非活跃状态。';

  @override
  String get abc__detection_mode__subtitle__disabled => '请先启用无障碍服务，然后选择检测模式。';

  @override
  String get abc__detection_mode__mode_1 => '高效';

  @override
  String get abc__detection_mode__mode_2 => '最大兼容性';

  @override
  String get abc__network__header => '网络';

  @override
  String current_time__local({required String time}) {
    return '本地时间：$time';
  }

  @override
  String current_time__utc({required String time}) {
    return 'UTC：$time';
  }

  @override
  String encrypted_stat__summary({required int count}) {
    return '您当前有 $count 个无法访问的加密剪辑。';
  }

  @override
  String get encrypted_stat__all_decrypted =>
      '🥳 恭喜！您的所有剪辑都已在本地成功解密，因此无需重建数据库。';

  @override
  String get encrypted_stat__rebuild_database => '重建数据库';

  @override
  String tray__tooltip__paused_till({required String time}) {
    return 'CopyCat Clipboard - 已暂停至 $time';
  }

  @override
  String get tray__menu__resume_copycat => '恢复';

  @override
  String get tray__menu__pause_copycat => '暂停';

  @override
  String get tray__menu__paste_stack => '粘贴堆栈';

  @override
  String get tray__menu__restart_app => '重新启动';

  @override
  String get tray__dialog__quit__subtitle => '确定要退出应用吗？';

  @override
  String get splash__checking_authentication => '正在检查身份验证...';

  @override
  String paste_stack__title({required int count}) {
    return '粘贴堆栈 • $count';
  }

  @override
  String get paste_stack__reorder_hint => '你可以拖动项目来重新排序。';

  @override
  String get paste_stack__reverse_tooltip => '反转顺序';

  @override
  String paste_stack__limit_note({required int count}) {
    return '您有 $count 个项目的限制';
  }

  @override
  String get multi_paste__title => '多项粘贴设置';

  @override
  String get multi_paste__subtitle => '控制所选剪辑的合并方式和粘贴节奏。';

  @override
  String get multi_paste__stat__selected => '已选';

  @override
  String get multi_paste__stat__text => '文本';

  @override
  String get multi_paste__stat__non_text => '非文本内容';

  @override
  String get multi_paste__merge__title => '合并连续的文本剪辑';

  @override
  String get multi_paste__merge__subtitle => '文本剪辑会持续合并，直到被非文本剪辑打断。';

  @override
  String get multi_paste__separator__title => '分隔符';

  @override
  String get multi_paste__separator__new_line => '换行';

  @override
  String get multi_paste__separator__space => '空格';

  @override
  String get multi_paste__separator__custom => '自定义';

  @override
  String get multi_paste__separator__custom_label => '自定义分隔符';

  @override
  String get multi_paste__separator__custom_hint => '支持 \\n 和 \\t 等转义序列';

  @override
  String get multi_paste__pacing__title => '粘贴节奏';

  @override
  String get multi_paste__pacing__subtitle => '如果目标应用漏掉粘贴事件，请适当增加延迟。';

  @override
  String get multi_paste__wait_between_pastes => '每次粘贴之间的间隔';

  @override
  String get multi_paste__validation__wait_positive => '等待时间必须为正数。';

  @override
  String get multi_paste__validation__custom_separator_required => '请输入自定义分隔符。';

  @override
  String get settings__tile__backup_restore__title => '备份与恢复';

  @override
  String get settings__tile__backup_restore__subtitle => '创建 .ccbkup 备份并在本地恢复';

  @override
  String get settings__switch__rich_data_capture__title => '富数据捕获';

  @override
  String get settings__switch__rich_data_capture__subtitle => '在应用之间复制粘贴时保留格式。';

  @override
  String get settings__decrypt__title => '剪贴板解密';

  @override
  String settings__decrypt__count({required int count}) {
    return '您当前在本地有 $count 个加密剪辑。';
  }

  @override
  String settings__decrypt__progress({
    required int decrypted,
    required int total,
  }) {
    return '已解密：$decrypted / $total 个剪辑。';
  }

  @override
  String get settings__decrypt__warning => '⚠️ 请在此过程中保持此页面开启，以避免数据损坏或不一致。';

  @override
  String get not_found__title => '页面未找到';

  @override
  String get not_found__subtitle => '找不到您访问的页面。';

  @override
  String get not_found__go_home => '返回首页';

  @override
  String get backup_restore__dialog__save_as => '备份另存为';

  @override
  String get backup_restore__busy__creating => '正在创建备份...';

  @override
  String get backup_restore__error__encryption_unavailable =>
      '加密已启用，但当前不可用。请先解锁 E2EE 后重试。';

  @override
  String backup_restore__snackbar__saved({required String outputPath}) {
    return '备份已保存到 $outputPath';
  }

  @override
  String backup_restore__snackbar__create_failed({required String message}) {
    return '备份失败：$message';
  }

  @override
  String get backup_restore__dialog__select_file => '选择备份文件';

  @override
  String get backup_restore__dialog__restore_title => '恢复备份';

  @override
  String get backup_restore__dialog__restore_subtitle => '如果该备份受密码保护，请输入密码。';

  @override
  String get backup_restore__dialog__restore_action => '恢复';

  @override
  String get backup_restore__busy__restoring => '正在恢复备份...';

  @override
  String backup_restore__snackbar__restore_completed({
    required int clips,
    required int collections,
  }) {
    return '恢复完成：$clips 个剪辑，$collections 个收藏。';
  }

  @override
  String backup_restore__snackbar__restore_failed({required String message}) {
    return '恢复失败：$message';
  }

  @override
  String get backup_restore__error__select_clip_type => '请至少选择一种剪辑类型。';

  @override
  String get backup_restore__error__from_after_to => '开始日期必须早于结束日期。';

  @override
  String get backup_restore__dialog__options__description => '选择要包含在此备份归档中的内容。';

  @override
  String get backup_restore__section__clip_types => '剪辑类型';

  @override
  String get backup_restore__section__cached_files => '缓存文件';

  @override
  String get backup_restore__input__max_cached_file_size => '缓存文件大小上限 (MB)';

  @override
  String get backup_restore__input__max_cached_file_size__hint => '可选，例如 50';

  @override
  String get backup_restore__error__positive_number => '请输入正数。';

  @override
  String get backup_restore__text__select_file_media_for_cache_limit =>
      '请选择文件或媒体剪辑类型，以设置缓存文件大小上限。';

  @override
  String get backup_restore__section__date_range => '日期范围';

  @override
  String get backup_restore__from_date => '开始日期';

  @override
  String get backup_restore__to_date => '结束日期';

  @override
  String get backup_restore__no_minimum_date => '无最早日期';

  @override
  String get backup_restore__no_maximum_date => '无最晚日期';

  @override
  String get backup_restore__clear_date_filter => '清除日期筛选';

  @override
  String get backup_restore__section__security => '安全';

  @override
  String get backup_restore__toggle__password_protect => '使用密码保护备份';

  @override
  String get backup_restore__input__password => '密码';

  @override
  String get backup_restore__input__password__hint => '至少 6 个字符';

  @override
  String get backup_restore__error__password_min_length => '密码长度至少为 6 个字符。';

  @override
  String get backup_restore__dialog__create_manual_title => '创建手动备份';

  @override
  String get backup_restore__appbar__title => '备份与恢复';

  @override
  String get backup_restore__card__title => '手动备份与恢复';

  @override
  String get backup_restore__card__subtitle =>
      '创建带可选密码保护的本地 .ccbkup 归档，并在本地以尽力去重方式恢复。';

  @override
  String get backup_restore__actions__title => '操作';

  @override
  String get backup_restore__button__create => '创建备份';

  @override
  String get backup_restore__button__restore => '恢复备份';

  @override
  String get backup_restore__snapshot__backup_title => '最近一次备份摘要';

  @override
  String get backup_restore__snapshot__restore_title => '最近一次恢复摘要';

  @override
  String get backup_restore__snapshot__restore_subtitle => '尽力去重与完整性报告';

  @override
  String get backup_restore__empty_session => '本次会话中尚未执行过备份或恢复。';

  @override
  String get backup_restore__label__collections => '收藏';

  @override
  String get backup_restore__label__clips => '剪辑';

  @override
  String get backup_restore__label__files_included => '已包含文件';

  @override
  String get backup_restore__label__files_missing => '缺失文件';

  @override
  String get backup_restore__label__files_skipped_by_size => '因大小跳过';

  @override
  String get backup_restore__label__encrypted_clips => '加密剪辑';

  @override
  String get backup_restore__label__collections_restored => '已恢复收藏';

  @override
  String get backup_restore__label__collections_duplicates => '重复收藏';

  @override
  String get backup_restore__label__collections_failed => '恢复失败的收藏';

  @override
  String get backup_restore__label__clips_restored => '已恢复剪辑';

  @override
  String get backup_restore__label__clips_duplicates => '重复剪辑';

  @override
  String get backup_restore__label__clips_failed => '恢复失败的剪辑';

  @override
  String get backup_restore__label__attachments_restored => '已恢复附件';

  @override
  String get backup_restore__label__attachments_missing => '缺失附件';

  @override
  String get backup_restore__label__attachments_failed => '恢复失败的附件';

  @override
  String get backup_restore__label__corrupt_entries => '损坏条目';

  @override
  String get subscription__loading => '加载中...';

  @override
  String get review__dialog__title => '到目前为止，您喜欢 CopyCat 吗？';

  @override
  String get review__dialog__message =>
      '一次简短评分可以帮助更多人发现 CopyCat，也能支持我们持续推出新功能。';

  @override
  String get review__dialog__never => '不再提醒';

  @override
  String get review__dialog__remind_later => '7 天后提醒我';

  @override
  String get review__dialog__rate_now => '立即评分';

  @override
  String get settings__tile__review__title => '为 CopyCat 评分';

  @override
  String get settings__tile__review__subtitle => '前往 App Store 留下评价';

  @override
  String get collections__read_only__banner => '您当前的方案下此收藏为只读。升级后可进行编辑。';

  @override
  String get collections__read_only__toast => '您当前的方案下此收藏为只读。升级后可编辑所有收藏。';

  @override
  String get collections__read_only__upgrade_action => '升级';

  @override
  String get collections__locked_section__label => '已锁定';

  @override
  String get transform__section__text_core => '文本核心';

  @override
  String get transform__section__text_utilities => '文本工具';

  @override
  String get transform__section__struct => '结构';

  @override
  String get transform__section__urls => '网址';

  @override
  String get transform__section__colors => '颜色';

  @override
  String get transform__section__emails_phones => '邮件 / 电话';

  @override
  String get transform__section__structured_text => '结构化文本';

  @override
  String get transform__label__uppercase => '转大写';

  @override
  String get transform__label__lowercase => '转小写';

  @override
  String get transform__label__capitalize => '首字母大写';

  @override
  String get transform__label__trim_whitespace => '去除空白';

  @override
  String get transform__label__remove_line_breaks => '删除换行';

  @override
  String get transform__label__normalize_spaces => '规范化空格';

  @override
  String get transform__label__reverse_text => '反转文本';

  @override
  String get transform__label__deduplicate_lines => '去重行';

  @override
  String get transform__label__json_prettify => 'JSON → 格式化';

  @override
  String get transform__label__json_minify => 'JSON → 压缩';

  @override
  String get transform__label__url_encode => 'URL 编码';

  @override
  String get transform__label__url_decode => 'URL 解码';

  @override
  String get transform__label__base64_encode => 'Base64 编码';

  @override
  String get transform__label__base64_decode => 'Base64 解码';

  @override
  String get transform__label__remove_tracking_params => '删除追踪参数';

  @override
  String get transform__label__extract_domain => '提取域名';

  @override
  String get transform__label__hex_to_rgb => 'HEX → RGB';

  @override
  String get transform__label__rgb_to_hex => 'RGB → HEX';

  @override
  String get transform__label__hex_to_hsl => 'HEX → HSL';

  @override
  String get transform__label__copy_cleaned => '复制清理后';

  @override
  String get transform__label__extract_emails => '提取邮件';

  @override
  String get transform__label__extract_urls => '提取网址';

  @override
  String get transform__label__extract_numbers => '提取数字';

  @override
  String get transfer__scan_qr => '扫描二维码';

  @override
  String get transfer__show_qr => '显示二维码';

  @override
  String get transfer__enter_passcode => '输入密码';

  @override
  String get transfer__six_digit_passcode => '6位密码';

  @override
  String get transfer__securely_transfer_via_qr => '通过二维码安全传输到附近设备（推荐）';

  @override
  String get transfer__nearby_device => '传输到附近设备';

  @override
  String get transfer__scan_qr_and_enter_passcode => '在另一台设备上扫描此二维码，然后输入密码。';

  @override
  String get transfer__enter_passcode_on_other_device => '在另一台设备上输入此密码。';

  @override
  String get transfer__show_passcode => '显示密码';

  @override
  String get transfer__device_has_no_camera_use_file_import =>
      '此设备没有相机。请改用文件导入选项。';

  @override
  String get transfer__scan_qr_from_other_device => '扫描另一台设备上的二维码。';

  @override
  String get settings__personal_drive__title => '个人云盘';

  @override
  String get settings__personal_drive__subtitle =>
      '将您的文件剪辑同步到个人云盘，以实现安全备份和跨设备访问。';
}
