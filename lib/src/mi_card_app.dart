import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/features/localization/data/localiztion_repository.dart';
import 'package:mi_card/src/core/routing/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MiCardApp extends ConsumerWidget {
  const MiCardApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final locale = ref.watch(localizationProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // This allows mouse and other options to scroll by dragging
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown,
        },
      ),
      // ===== The builder parameter helps us to insert a widget between
      // [MaterialApp] and [Navigator] which is a good place to inject the
      // [Directionality] widget depending on the [locale] value
      builder: (context, child) {
        // Determine application directionality depending on
        // the current language or (lcoale)
        return Directionality(
          textDirection: locale.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        );
      },
    );
  }
}
