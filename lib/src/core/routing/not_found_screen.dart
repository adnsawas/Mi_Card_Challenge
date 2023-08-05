import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mi_card/src/constants/gaps.dart';
import 'package:mi_card/src/core/routing/go_router.dart';
import 'package:mi_card/src/utils/localization_extension.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.t.pageNotFound,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              gapH32,
              ElevatedButton(
                onPressed: () => context.goNamed(AppRoute.cards.name),
                child: Text(context.t.helloWorld),
              )
            ],
          ),
        ),
      ),
    );
  }
}
