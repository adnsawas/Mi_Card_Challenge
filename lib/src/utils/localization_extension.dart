import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// This extension on [BuildContext] is used to make the use of
/// localization easier to write
extension LocalizationExtenstion on BuildContext {
  AppLocalizations get t => AppLocalizations.of(this)!;
}
