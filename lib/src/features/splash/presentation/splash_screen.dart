import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/features/splash/presentation/splash_screen_controller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(splashScreenControllerProvider);
    return const Scaffold(
      body: Center(child: FlutterLogo(size: 70)),
    );
  }
}
