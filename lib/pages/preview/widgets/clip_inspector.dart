import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/app_lock_cubit/app_lock_cubit.dart';
import 'package:clipboard/base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/base/bloc/user_devices_cubit/user_devices_cubit.dart';
import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/data/services/notification_service.dart'
    show InAppNotificationService;
import 'package:clipboard/base/domain/model/clip_collection/clipcollection.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/model/cloud_file_id/cloud_file_id.dart';
import 'package:clipboard/base/domain/model/notification_message.dart'
    show NotificationMessage;
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/enums/platform_os.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/widgets/yarn_ball_loading.dart';
import 'package:open_dir/open_dir.dart' show OpenDir;
import 'package:path/path.dart' as p;
import 'package:clipboard/pages/preview/page.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/collection_selector_tile.dart';
import 'package:clipboard/widgets/source_app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:universal_io/universal_io.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:synchronized/extension.dart';

class ClipInspector extends StatefulWidget {
  final ClipboardItem item;
  final bool includePagePadding;
  final bool showHeader;
  final String currentDeviceId;

  const ClipInspector({
    super.key,
    required this.item,
    this.includePagePadding = true,
    this.showHeader = true,
    required this.currentDeviceId,
  });

  @override
  State<ClipInspector> createState() => _ClipInspectorState();
}

class _ClipInspectorState extends State<ClipInspector> {
  late final OfflinePersistenceCubit offlineCubit;
  late final AppLockCubit appLockCubit;
  late final AppConfigCubit appConfigCubit;
  late final UserDevicesCubit userDevicesCubit;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  bool isLocked = false;

  (int?, int?)? collectionId;

  ClipboardItem get item => widget.item;

  bool get e2eeSetup => appConfigCubit.isE2EESetupDone;

  @override
  void initState() {
    super.initState();
    appConfigCubit = context.read<AppConfigCubit>();
    offlineCubit = context.read<OfflinePersistenceCubit>();
    appLockCubit = context.read<AppLockCubit>();
    userDevicesCubit = context.read<UserDevicesCubit>();
    formKey = GlobalKey<FormState>();
    collectionId = (item.collectionId, item.serverCollectionId);
    titleController = TextEditingController(text: item.title);
    descriptionController = TextEditingController(text: item.description);
    titleController.addListener(_onFormChanged);
    descriptionController.addListener(_onFormChanged);
    isLocked = item.locked;
  }

  void _onFormChanged() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ClipInspector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item == widget.item) return;
    titleController.removeListener(_onFormChanged);
    descriptionController.removeListener(_onFormChanged);
    titleController.text = widget.item.title ?? '';
    descriptionController.text = widget.item.description ?? '';
    collectionId = (widget.item.collectionId, widget.item.serverCollectionId);
    titleController.addListener(_onFormChanged);
    descriptionController.addListener(_onFormChanged);
    isLocked = widget.item.locked;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  String get _normalizedTitle => titleController.text.trim();
  String get _normalizedDescription => descriptionController.text.trim();

  bool get _hasChanges {
    return _normalizedTitle != (item.title ?? '') ||
        _normalizedDescription != (item.description ?? '') ||
        collectionId?.$1 != item.collectionId ||
        collectionId?.$2 != item.serverCollectionId;
  }

  String get _typeLabel {
    switch (item.type) {
      case ClipItemType.text:
        return context.locale.preview__inspector__type__text;
      case ClipItemType.media:
        return context.locale.preview__inspector__type__media;
      case ClipItemType.file:
        return context.locale.preview__inspector__type__file;
      case ClipItemType.url:
        return context.locale.preview__inspector__type__link;
    }
  }

  String? get _categoryLabel {
    final category = item.textCategory;
    if (item.type != ClipItemType.text || category == null) return null;

    switch (category) {
      case TextCategory.color:
        return context.locale.search_filter__text_cat__color;
      case TextCategory.email:
        return context.locale.search_filter__text_cat__email;
      case TextCategory.phone:
        return context.locale.search_filter__text_cat__phone;
      case TextCategory.struct:
        return 'Struct';
    }
  }

  String get _titleText {
    final displayTitle = item.displayTitle?.trim();
    if (displayTitle != null && displayTitle.isNotEmpty) {
      return displayTitle;
    }

    switch (item.type) {
      case ClipItemType.text:
        final text = item.text?.trim();
        if (text != null && text.isNotEmpty) {
          return text.split('\n').first.sub(end: 80);
        }
        return context.locale.preview__inspector__untitled;
      case ClipItemType.url:
        return item.url?.trim().isNotEmpty == true
            ? item.url!.trim()
            : context.locale.preview__inspector__untitled;
      case ClipItemType.media:
      case ClipItemType.file:
        return item.fileName?.trim().isNotEmpty == true
            ? item.fileName!.trim()
            : context.locale.preview__inspector__untitled;
    }
  }

  String? get _summaryText {
    final summary = <String>[_typeLabel];

    if (item.sourceApp?.trim().isNotEmpty == true) {
      summary.add(item.sourceApp!.trim());
    }

    if (item.modified != item.created) {
      summary.add(item.modified.ago(context.locale.localeName));
    } else {
      summary.add(item.created.ago(context.locale.localeName));
    }

    return summary.join(' • ');
  }

  Future<void> _saveMetadata() async {
    if (!_hasChanges) return;
    if (!formKey.currentState!.validate()) return;

    final updatedItem = item.copyWith(
      title: cleanUpString(_normalizedTitle.isEmpty ? null : _normalizedTitle),
      description: cleanUpString(
        _normalizedDescription.isEmpty ? null : _normalizedDescription,
      ),
      collectionId: collectionId?.$1,
      serverCollectionId: collectionId?.$2,
      modified: systemTime(),
    );

    await offlineCubit.persist([updatedItem]);
    if (!mounted) return;

    ClipboardItemPreviewPage.of(context).updateItem(updatedItem);
    FocusScope.of(context).unfocus();
    InAppNotificationService.i.notify(
      NotificationMessage(
        id: "clip_inspector_saved",
        body: context.locale.preview__inspector__saved,
      ),
    );
  }

  Future<void> _editTextContent() async {
    final state = ClipboardItemPreviewPage.of(context);
    final updatedItem = await editTextContent(context, item);
    if (!mounted || updatedItem == null) return;
    state.updateItem(updatedItem);
  }

  Future<void> _decrypt() async {
    final updatedItem = await decryptItem(context, item);
    if (updatedItem == null) return;
    if (!mounted) return;
    ClipboardItemPreviewPage.of(context).updateItem(updatedItem);
  }

  void _setCollection(ClipCollection? collection, {bool removed = false}) {
    setState(() {
      collectionId = removed || collection == null
          ? (null, null)
          : (collection.id, collection.serverId);
    });
  }

  String _formatDateTime(DateTime value) {
    return dateTimeFormatter(context.locale.localeName).format(value.toLocal());
  }

  String _formatCount(int value) {
    return MaterialLocalizations.of(context).formatDecimal(value);
  }

  Future<void> _openFileSource() async {
    if (item.sourceUrl == null) return;
    final uri = Uri.tryParse(
      item.sourceUrl!,
    )?.toFilePath(windows: Platform.isWindows);
    final directory = p.dirname(uri!);
    final highlightedFileName = p.basename(uri);
    final openDirPlugin = OpenDir();
    final success = await openDirPlugin.openNativeDir(
      path: directory,
      highlightedFileName: highlightedFileName,
    );

    if (success == true) return;

    if (!mounted) return;

    await launchUrlString(p.dirname(item.sourceUrl!));
  }

  int? get _contentLength {
    final content = switch (item.type) {
      ClipItemType.text => item.text,
      ClipItemType.url => item.url,
      ClipItemType.media || ClipItemType.file => item.text,
    };

    return content?.length;
  }

  int? get _lineCount {
    final content = switch (item.type) {
      ClipItemType.text => item.text,
      ClipItemType.url => item.url,
      ClipItemType.media || ClipItemType.file => item.text,
    };

    if (content == null || content.isEmpty) return null;
    return '\n'.allMatches(content).length + 1;
  }

  List<Widget> _buildStatusChips() {
    final colors = context.colors;
    final chips = <Widget>[
      Chip(
        avatar: const Icon(Icons.category_outlined, size: 18),
        label: Text(_typeLabel),
      ),
    ];

    if (_categoryLabel != null) {
      chips.add(
        Chip(
          avatar: const Icon(Icons.label_outline, size: 18),
          label: Text(_categoryLabel!),
        ),
      );
    }

    if (item.encrypted) {
      chips.add(
        Chip(
          avatar: Icon(Icons.lock_outline, size: 18, color: colors.primary),
          label: Text(context.locale.preview__inspector__status__encrypted),
        ),
      );
    }

    if (item.localOnly) {
      chips.add(
        Chip(
          avatar: const Icon(Icons.offline_bolt_outlined, size: 18),
          label: Text(context.locale.preview__inspector__status__local_only),
        ),
      );
    } else if (item.isSyncing) {
      chips.add(
        Chip(
          avatar: const Icon(Icons.sync, size: 18),
          label: Text(context.locale.app__syncing),
        ),
      );
    } else if (item.isSynced) {
      chips.add(
        Chip(
          avatar: const Icon(Icons.cloud_done_outlined, size: 18),
          label: Text(context.locale.preview__inspector__status__synced),
        ),
      );
    } else {
      chips.add(
        Chip(
          avatar: const Icon(Icons.cloud_off_outlined, size: 18),
          label: Text(context.locale.preview__inspector__status__not_synced),
        ),
      );
    }

    if (item.needDownload) {
      chips.add(
        Chip(
          avatar: const Icon(Icons.download_for_offline_outlined, size: 18),
          label: Text(
            context.locale.preview__inspector__status__download_required,
          ),
        ),
      );
    } else if (item.type == ClipItemType.file ||
        item.type == ClipItemType.media) {
      chips.add(
        Chip(
          avatar: const Icon(Icons.inventory_2_outlined, size: 18),
          label: Text(context.locale.preview__inspector__status__available),
        ),
      );
    }

    return chips;
  }

  List<Widget> _buildActionButtons() {
    final canOpen =
        (item.type == ClipItemType.file || item.type == ClipItemType.media) &&
        item.inCache;

    final buttons = <Widget>[];

    if (item.encrypted) {
      buttons.add(
        FilledButton.icon(
          onPressed: _decrypt,
          icon: const Icon(Icons.lock_open_outlined),
          label: Text(context.locale.preview__inspector__decrypt),
        ),
      );
    } else if (item.needDownload) {
      buttons.add(
        FilledButton.icon(
          onPressed: item.downloading
              ? null
              : () => downloadFile(context, item),
          icon: item.downloading
              ? SizedBox.square(
                  dimension: 18,
                  child: YarnBallLoading(color: context.colors.onPrimary),
                )
              : const Icon(Icons.download_for_offline_outlined),
          label: Text(
            item.downloading
                ? context.locale.app__downloading
                : context.locale.app__download,
          ),
        ),
      );
    } else if (item.inCache) {
      buttons.add(
        FilledButton.icon(
          onPressed: () => copyToClipboard(context, item),
          icon: const Icon(Icons.copy_outlined),
          label: Text(context.mlocale.copyButtonLabel),
        ),
      );
    }

    if (canOpen) {
      buttons.add(
        OutlinedButton.icon(
          onPressed: () => openFile(item),
          icon: const Icon(Icons.open_in_new),
          label: Text(context.locale.preview__card__file__open),
        ),
      );
    }

    if (item.type == ClipItemType.url && !item.encrypted) {
      buttons.add(
        OutlinedButton.icon(
          onPressed: () => launchUrl(item),
          icon: const Icon(Icons.open_in_new),
          label: Text(context.locale.app__follow_link),
        ),
      );
    }

    if (item.type == ClipItemType.text && !item.encrypted) {
      buttons.add(
        OutlinedButton.icon(
          onPressed: _editTextContent,
          icon: const Icon(Icons.edit_outlined),
          label: Text(context.locale.app__edit),
        ),
      );
    }

    if (item.inCache && !item.encrypted) {
      buttons.add(
        OutlinedButton.icon(
          onPressed: () => shareClipboardItem(context, item),
          icon: const Icon(Icons.ios_share_outlined),
          label: Text(context.locale.app__share),
        ),
      );
    }

    if (canOpen) {
      buttons.add(
        OutlinedButton.icon(
          onPressed: () => copyToClipboard(context, item, saveFile: true),
          icon: const Icon(Icons.save_alt_outlined),
          label: Text(context.locale.app__export),
        ),
      );
    }

    if (item.sourceUrl?.trim().isNotEmpty == true) {
      if (item.sourceUrl!.startsWith("file")) {
        if (isDesktopPlatform && item.deviceId == widget.currentDeviceId) {
          buttons.add(
            OutlinedButton.icon(
              onPressed: _openFileSource,
              icon: const Icon(Icons.public_outlined),
              label: Text(context.locale.preview__inspector__open_source),
            ),
          );
        }
      } else {
        buttons.add(
          OutlinedButton.icon(
            onPressed: () => launchUrlString(item.sourceUrl!),
            icon: const Icon(Icons.public_outlined),
            label: Text(context.locale.preview__inspector__open_source),
          ),
        );
      }
    }

    if (!item.encrypted) {
      buttons.add(
        OutlinedButton.icon(
          onPressed: () async {
            final done = await deleteClipboardItem(context, [item]);
            if (!mounted || !done) return;
            Navigator.pop(context);
          },
          icon: const Icon(Icons.delete_outline),
          label: Text(context.locale.app__delete),
        ),
      );
    }

    return buttons;
  }

  List<Widget> _buildDetailRows() {
    final rows = <Widget>[
      _InspectorInfoRow(label: 'Type', value: _typeLabel),
      _InspectorInfoRow(
        label: context.locale.preview__inspector__label__created,
        value: _formatDateTime(item.created),
      ),
      _InspectorInfoRow(
        label: context.locale.preview__inspector__label__modified,
        value: _formatDateTime(item.modified),
      ),
    ];

    if (item.lastCopied != null) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__last_copied,
          value: _formatDateTime(item.lastCopied!),
        ),
      );
    }

    rows.add(
      _InspectorInfoRow(
        label: context.locale.preview__inspector__label__copied_count,
        value: _formatCount(item.copiedCount),
      ),
    );

    if (_categoryLabel != null) {
      rows.insert(
        1,
        _InspectorInfoRow(label: 'Category', value: _categoryLabel!),
      );
    }

    if (item.sourceApp?.trim().isNotEmpty == true) {
      rows.add(
        _InspectorSourceAppRow(
          label: context.locale.preview__inspector__label__source_app,
          sourceApp: item.sourceApp!.trim(),
          sourceId: item.sourceId,
          sourceOs: item.os,
        ),
      );
    }

    if (item.sourceUrl?.trim().isNotEmpty == true) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__source_url,
          value: item.sourceUrl!.trim(),
        ),
      );
    }

    if (item.fileSize != null) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__file_size,
          value: formatBytes(item.fileSize!),
        ),
      );
    }

    if (item.fileMimeType?.trim().isNotEmpty == true) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__mime_type,
          value: item.fileMimeType!.trim(),
        ),
      );
    }

    if (item.fileExtension?.trim().isNotEmpty == true) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__extension,
          value: item.fileExtension!.trim(),
        ),
      );
    }

    if (item.isImage && item.localPath != null) {
      final resolution = getImageResolution(item.localPath!);
      if (resolution != null) {
        rows.add(
          _InspectorInfoRow(
            label: context.locale.preview__inspector__label__image_dimension,
            value: "${resolution.width} x ${resolution.height}",
          ),
        );
      }
    }

    if (item.deviceId != null) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__device,
          value:
              userDevicesCubit.getDeviceName(item.deviceId!) ?? item.deviceId!,
        ),
      );
    }

    if (item.driveFileId != null && item.driveFileId!.isNotEmpty) {
      final driveId = item.driveFileId!;
      final storageLocation = driveId.startsWith(CloudStorageType.webdavPrefix)
          ? driveId
          : context.locale.settings__text__cloud__name;
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__storage,
          value: storageLocation,
        ),
      );
    }

    return rows;
  }

  List<Widget> _buildContentRows() {
    final rows = <Widget>[];
    final contentLength = _contentLength;
    final lineCount = _lineCount;

    if (contentLength != null) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__characters,
          value: _formatCount(contentLength),
        ),
      );
    }

    if (lineCount != null &&
        item.type != ClipItemType.file &&
        item.type != ClipItemType.media) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__lines,
          value: _formatCount(lineCount),
        ),
      );
    }

    if (item.url?.trim().isNotEmpty == true && !item.encrypted) {
      rows.add(
        _InspectorInfoRow(
          label: context.locale.preview__inspector__label__link,
          value: item.url!.trim(),
        ),
      );
    }

    return rows;
  }

  Future<void> onLockedStateChanged(bool value) async {
    if (!value) {
      final authorized = await appLockCubit.authorizeForSensitiveAction();
      if (!authorized) {
        setState(() {});
        return;
      }
    }
    await synchronized(() async {
      final updatedItem = item.locked ? await item.unlock() : await item.lock();

      await offlineCubit.persist([updatedItem]);

      if (!mounted) return;

      ClipboardItemPreviewPage.of(context).updateItem(updatedItem);
      setState(() {
        isLocked = updatedItem.locked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final contentRows = _buildContentRows();

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.showHeader) ...[
            _InspectorHeader(title: _titleText, subtitle: _summaryText),
            height12,
          ],
          Wrap(spacing: 8, runSpacing: 8, children: _buildStatusChips()),
          height16,
          _InspectorSection(
            title: context.locale.preview__inspector__section__actions,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              children: _buildActionButtons(),
            ),
          ),
          height16,
          _InspectorSection(
            title: context.locale.preview__inspector__section__details,
            child: Column(children: _buildDetailRows()),
          ),
          if (contentRows.isNotEmpty) ...[
            height16,
            _InspectorSection(
              title: context.locale.preview__inspector__section__content,
              child: Column(children: contentRows),
            ),
          ],
          height16,
          // Lock section
          _InspectorSection(
            title: context.locale.preview__inspector__section__security,
            child: SwitchListTile(
              title: Text(context.locale.preview__inspector__lock_clip),
              subtitle: Text(
                context.locale.preview__inspector_lock_clip_description +
                    (!e2eeSetup
                        ? "\n⚠️ ${context.locale.app__ack__missing_e2e_setup}"
                        : ""),
              ),
              value: isLocked,
              contentPadding: EdgeInsets.zero,
              thumbIcon: isLocked
                  ? const Icon(Icons.lock_rounded).wsp
                  : const Icon(Icons.lock_open_rounded).wsp,
              onChanged: e2eeSetup
                  ? (value) async => await onLockedStateChanged(value)
                  : null,
            ),
          ),
          height16,
          _InspectorSection(
            title: context.locale.preview__inspector__section__organize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: context.locale.preview__form__input__title,
                  ),
                  controller: titleController,
                  validator: ValidationBuilder(
                    optional: true,
                  ).maxLength(100).build(),
                ),
                height12,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: context.locale.preview__form__input__description,
                  ),
                  minLines: 2,
                  maxLines: 5,
                  controller: descriptionController,
                  validator: ValidationBuilder(
                    optional: true,
                  ).maxLength(255).build(),
                ),
                height12,
                ClipCollectionSelectorTile(
                  onChange: _setCollection,
                  collectionId: collectionId?.$1,
                  serverCollectionId: collectionId?.$2,
                ),
                height12,
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton.icon(
                    onPressed: _hasChanges ? _saveMetadata : null,
                    icon: const Icon(Icons.save_outlined),
                    label: Text(
                      context.locale.preview__inspector__save_changes,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InspectorHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _InspectorHeader({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.headlineSmall),
        if (subtitle != null) ...[
          height4,
          Text(
            subtitle!,
            style: textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

class _InspectorSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _InspectorSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textTheme.titleMedium),
            height8,
            child,
          ],
        ),
      ),
    );
  }
}

class _InspectorInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InspectorInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
          width12,
          Expanded(
            flex: 6,
            child: SelectableText(
              value,
              style: textTheme.bodyMedium,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _InspectorSourceAppRow extends StatelessWidget {
  final String label;
  final String sourceApp;
  final String? sourceId;
  final PlatformOS sourceOs;

  const _InspectorSourceAppRow({
    required this.label,
    required this.sourceApp,
    required this.sourceId,
    required this.sourceOs,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
          width12,
          Expanded(
            flex: 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: padding8,
              children: [
                SourceAppIcon(
                  sourceId: sourceId,
                  sourceOs: sourceOs,
                  height: 30,
                  width: 30,
                ),
                Expanded(
                  child: SelectableText(sourceApp, style: textTheme.bodyMedium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
