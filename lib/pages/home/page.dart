import 'package:clipboard/pages/home/widgets/appbar.dart';
import 'package:clipboard/pages/home/widgets/home_body.dart';
import 'package:clipboard/widgets/layout/custom_scaffold.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/constants/key.dart';
import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:copycat_pro/widgets/drag_drop/drop_region.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
import 'package:upgrader/upgrader.dart';

final upgrader = Upgrader(
  storeController: UpgraderStoreController(
    onMacOS: () => UpgraderAppcastStore(appcastURL: macAppcastUrl),
    onWindows: () => UpgraderAppcastStore(appcastURL: windowsAppcastUrl),
    onLinux: () => UpgraderAppcastStore(appcastURL: linuxAppcastUrl),
  ),
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget scaffold = const CustomScaffold(
      activeIndex: 0,
      appBar: HomeAppbar(),
      body: ScaffoldBody(
        child: HomePageBody(),
      ),
    );

    // NOTE: drag and drop doesn't work in android for now
    if (!Platform.isAndroid) {
      scaffold = ClipDropRegionProvider(
        child: scaffold,
        onDragStart: () {
          // context.read<WindowActionCubit>().dropView();
        },
      );
    }

    return UpgradeAlert(
      navigatorKey: rootNavKey,
      upgrader: upgrader,
      showIgnore: false,
      shouldPopScope: () => true,
      dialogStyle: isApplePlatform
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      child: scaffold,
    );
  }
}
