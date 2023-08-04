import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This provider reads and controls the application offline and online mode
///
/// If the offline mode is changed, it will affect the [AuthRepository] provider
/// which in turn navigates the user to login screen
final offlineModeProvider = StateProvider<bool>((ref) {
  // Initially we read the offline mode from [.env] file
  final isOffline = dotenv.get('OFFLINE', fallback: 'true') == 'true';
  return isOffline;
});
