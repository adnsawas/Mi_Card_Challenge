import 'package:flutter/material.dart';
import 'package:mi_card/src/constants/gaps.dart';
import 'package:mi_card/src/utils/localization_extension.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {this.refresh, super.key});
  final String errorMessage;
  final VoidCallback? refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.red),
          ),
          gapH24,
          if (refresh != null)
            ElevatedButton(onPressed: refresh, child: Text(context.t.refresh)),
        ],
      ),
    );
  }
}
