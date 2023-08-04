import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/core/shared_preferences_provider.dart';
import 'package:mi_card/src/mi_card_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  // turn off the # in the URLs on the web
  usePathUrlStrategy();

  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };

  // Before calling runApp(), we setup sharedPreferences so we can call it later
  // synchrounously
  final sharedPreferences = await SharedPreferences.getInstance();
  final providerContainer = ProviderContainer(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ]);

  runApp(UncontrolledProviderScope(
      container: providerContainer, child: const MiCardApp()));
}
