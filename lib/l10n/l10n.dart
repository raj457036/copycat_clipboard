import 'package:clipboard/l10n/generated/app_localizations.dart';
import 'package:flutter/widgets.dart';

AppLocalizations locale(BuildContext context) => AppLocalizations.of(context);

extension LocaleExtension on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this);
}
