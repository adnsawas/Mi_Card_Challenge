import 'package:flutter/material.dart';
import 'package:mi_card/src/constants/gaps.dart';
import 'package:mi_card/src/utils/localization_extension.dart';

/// Placeholder widget showing a message and button to go back to the home screen.
class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({super.key, this.message, this.refresh});
  final String? message;
  final Function()? refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message ?? context.t.noData),
          gapH24,
          if (refresh != null)
            ElevatedButton(onPressed: refresh, child: Text(context.t.refresh)),
        ],
      ),
    );
  }
}
