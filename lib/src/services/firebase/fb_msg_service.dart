import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_campus_core/mini_campus_core.dart';

final fbMsgProvider = Provider((_) => FbMsgService(_.read));

class FbMsgService {
  static final _service = FbMessagingService.instance;

  final Reader read;

  FbMsgService(this.read);

  /// get & set token if not present & sub to topics
  Future getToken() async {
    final sharedPref = read(sharedPreferencesServiceProvider);

    try {
      String cachedToken = sharedPref.userCachedToken();

      if (cachedToken.isEmpty) {
        final String t = await _service.getUserToken() ?? '';

        if (t == cachedToken) {
          return;
        }

        // add token
        await read(studentStoreProvider).addNotificationToken(t);

        // set new
        await sharedPref.setUserFcmToken(t);

        // subscribe to topics also
        await _service.subscribeTopics(NotificationTopic(
          student: read(studentProvider)!,
          university: read(studentUniProvider),
        ).topics);
      }
    } catch (e) {
      debugLogger(e, error: e, name: 'getToken');
    }
  }
}
