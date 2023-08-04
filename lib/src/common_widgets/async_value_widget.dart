import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/common_widgets/error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {super.key, required this.asyncValue, required this.data, this.onError});

  /// The `AsyncValue` that is usually retreived from
  /// Future and Stream providers
  final AsyncValue<T> asyncValue;

  /// A callback that gives you the data within the `AsyncValue` passed to this
  /// widget. This callback is called when data comes in a seccssful state.
  ///
  /// It expects to return a widget that actually displays this data
  final Widget Function(T) data;

  /// The widget to show in case of error
  final Widget Function(BuildContext context, Object error, StackTrace st)?
      onError;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: data,
      error: (e, st) => onError != null
          ? onError!(context, e, st)
          : Center(
              child: ErrorMessageWidget(
              e.toString(),
            )),
      loading: () => const Center(child: CircularProgressIndicator()),
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: false,
    );
  }
}

// /// Sliver equivalent of [AsyncValueWidget]
// class AsyncValueSliverWidget<T> extends StatelessWidget {
//   const AsyncValueSliverWidget(
//       {super.key, required this.value, required this.data});
//   final AsyncValue<T> value;
//   final Widget Function(T) data;

//   @override
//   Widget build(BuildContext context) {
//     return value.when(
//       data: data,
//       loading: () => const SliverToBoxAdapter(
//           child: Center(child: CircularProgressIndicator())),
//       error: (e, st) => SliverToBoxAdapter(
//         child: Center(child: ErrorMessageWidget(e.toString())),
//       ),
//     );
//   }
// }