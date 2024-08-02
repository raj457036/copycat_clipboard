import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum MenuItemType { option, divider }

class MenuItem {
  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final MenuItemType type;

  const MenuItem({
    this.text,
    this.icon,
    this.onPressed,
    this.type = MenuItemType.option,
  })  : assert(
          (type == MenuItemType.divider &&
                  text == null &&
                  icon == null &&
                  onPressed == null) ||
              type == MenuItemType.option,
          "Divider type menu item cannot have a text and icon or onPressed property.",
        ),
        assert(
          (type == MenuItemType.option &&
                  text != null &&
                  icon != null &&
                  onPressed != null) ||
              type == MenuItemType.divider,
          "Option type menu item must have a text and icon and onPressed property.",
        );
}

class Menu extends StatelessWidget {
  final List<MenuItem> items;
  final Widget child;

  const Menu({
    super.key,
    required this.items,
    required this.child,
  });

  Future<void> openOptionDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                context.locale.selectAnOption,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              for (var menuItem in items)
                menuItem.type == MenuItemType.divider
                    ? const Divider()
                    : ListTile(
                        leading: Icon(menuItem.icon),
                        title: Text(menuItem.text!),
                        onTap: () {
                          Navigator.pop(context);
                          menuItem.onPressed?.call();
                        },
                      ),
            ],
          ),
        );
      },
    );
  }

  Future<void> openPopupMenu(BuildContext context, Offset offset) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = overlay.globalToLocal(offset);
    final RelativeRect positionPopup = RelativeRect.fromSize(
      Rect.fromPoints(position, position),
      overlay.size,
    );
    final options = <PopupMenuEntry<MenuItem>>[
      for (var menuItem in items)
        if (menuItem.type == MenuItemType.divider)
          const PopupMenuDivider()
        else
          PopupMenuItem(
            value: menuItem,
            child: ListTile(
              leading: Icon(menuItem.icon),
              title: Text(menuItem.text!),
              mouseCursor: SystemMouseCursors.click,
            ),
          ),
    ];
    final item = await showMenu(
      context: context,
      constraints: const BoxConstraints(minWidth: 150),
      position: positionPopup,
      items: options,
    );

    item?.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: child,
      // onLongPress: () => openOptionDialog(context),
      onSecondaryTapDown: (detail) {
        if (width <= 600) {
          openOptionDialog(context);
          return;
        }
        final position = detail.globalPosition;
        openPopupMenu(context, position);
      },
    );
  }
}
