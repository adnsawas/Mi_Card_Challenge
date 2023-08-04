import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/features/auth/data/auth_repository.dart';
import 'package:mi_card/src/utils/localization_extension.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.signIn)),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                ref.read(authRepositoryProvider).signInAnonymously();
              },
              child: Text(context.t.signIn))),
    );
  }
}
