import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_core_constants/mc_core_constants.dart';
import 'package:mini_campus_core/mini_campus_core.dart';
import 'package:mini_campus_core_libs/mini_campus_core_libs.dart';

final fbMsgProvider = Provider((_) => FbMsgService(_.read));

class FbMsgService {
  static final _service = FbMessagingService.instance;

  final Reader read;

  FbMsgService(this.read);

  Future getToken() async {
    final sharedPref = read(sharedPreferencesServiceProvider);

    try {
      String cachedToken = sharedPref.userCachedToken();

      if (cachedToken.isEmpty) {
        var t = await _service.getUserToken();

        if (t == cachedToken) {
          return;
        }

        // add token
        await read(studentStoreProvider).addNotificationToken(t!);

        // set new
        await sharedPref.setUserFcmToken(t);

        // subscribe to topics also
        await subscribe();
      }
    } catch (e) {
      debugLogger(e, error: e, name: 'getToken');
      return null;
    }
  }

  Future<void> subscribe() async {
    final sharedPref = read(sharedPreferencesServiceProvider);

    try {
      if (!sharedPref.isUserSubToTopics()) {
        final student = read(studentProvider);

        await _service
            .subscribeTopics(NotificationTopic(student: student!).topics);
      }
    } catch (e) {
      debugLogger(e, name: 'FbMsgService-subscribe');
      return;
    }
  }
}
