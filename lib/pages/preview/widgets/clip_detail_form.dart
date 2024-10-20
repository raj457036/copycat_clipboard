import 'package:clipboard/widgets/collection_selector_tile.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';

class ClipDetailForm extends StatefulWidget {
  final bool isMobile;
  final ClipboardItem item;
  const ClipDetailForm({
    super.key,
    required this.item,
    required this.isMobile,
  });

  @override
  State<ClipDetailForm> createState() => _ClipDetailFormState();
}

class _ClipDetailFormState extends State<ClipDetailForm> {
  late final OfflinePersistanceCubit cubit;
  late final GlobalKey<FormState> formKey;
  (int?, int?)? collectionId;

  late final TextEditingController titleController, descriptionController;

  @override
  void initState() {
    super.initState();
    cubit = context.read<OfflinePersistanceCubit>();
    formKey = GlobalKey<FormState>();
    collectionId = (widget.item.collectionId, widget.item.serverCollectionId);
    titleController = TextEditingController(
      text: widget.item.title,
    );
    descriptionController = TextEditingController(
      text: widget.item.description,
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void setCollection(ClipCollection? collection, {bool removed = false}) {
    if (removed) {
      setState(() {
        collectionId = (null, null);
      });
      return;
    }

    if (collection != null) {
      setState(() {
        collectionId = (collection.id, collection.serverId);
      });
    }
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState?.save();

    final title = titleController.text.trim().isEmpty
        ? null
        : titleController.text.trim();
    final description = descriptionController.text.trim().isEmpty
        ? null
        : descriptionController.text.trim();

    final updatedItem = widget.item.copyWith(
      title: cleanUpString(title),
      description: cleanUpString(description),
      collectionId: collectionId?.$1,
      serverCollectionId: collectionId?.$2,
    )..applyId(widget.item);
    cubit.persist([updatedItem]);
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final options = [
      TextButton(
        onPressed: context.pop,
        child: Text(context.locale.cancel),
      ),
      ElevatedButton(
        onPressed: submit,
        child: Text(context.locale.save),
      ),
    ];
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(padding16),
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.editDetails,
                style: textTheme.titleMedium,
              ),
              height16,
              TextFormField(
                decoration: InputDecoration(
                  labelText: context.locale.title,
                ),
                controller: titleController,
                validator:
                    ValidationBuilder(optional: true).maxLength(100).build(),
              ),
              height12,
              TextFormField(
                decoration: InputDecoration(
                  labelText: context.locale.description,
                ),
                minLines: 2,
                maxLines: 6,
                controller: descriptionController,
                validator:
                    ValidationBuilder(optional: true).maxLength(255).build(),
              ),
              height12,
              ClipCollectionSelectorTile(
                onChange: setCollection,
                collectionId: collectionId?.$1,
              ),
              if (!widget.isMobile) const Spacer() else height16,
              ButtonBar(
                children:
                    Platform.isWindows ? options.reversed.toList() : options,
              )
            ],
          ),
        ),
      ),
    );
  }
}
