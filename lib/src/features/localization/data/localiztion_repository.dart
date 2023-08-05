import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/core/shared_preferences_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationNotifer extends Notifier<Locale> {
  @override
  build() {
    // When initializing this class, make sure to update currentLocale
    // depending on what is available from shared preferences
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    final savedLocale = sharedPreferences.getString('locale');
    return Locale(savedLocale ?? 'en');
  }

  Future<void> toggleLanguage() async {
    // 1. Switch locale
    if (state.languageCode == 'en') {
      state = const Locale('ar');
    } else {
      state = const Locale('en');
    }

    // 2. Save the new locale into shared preferences
  }
}

final localizationProvider =
    NotifierProvider<LocalizationNotifer, Locale>(LocalizationNotifer.new);

/// This provider is used to access the [AppLocalizations] object
/// for the current [locale]
///
/// The idea here is that the [locale] variable is used to check what language
/// the user is using right now, and to change the language of the app
///
/// While the [AppLocalizations] varibale here is used to
/// get all translations of the currently selected [locale]
final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  final currentLocale = ref.watch(localizationProvider);
  return lookupAppLocalizations(currentLocale);
});
