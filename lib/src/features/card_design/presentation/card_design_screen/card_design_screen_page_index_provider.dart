import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardScreenPageIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
