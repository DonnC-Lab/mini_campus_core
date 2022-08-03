import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_campus_core/mini_campus_core.dart';

class SplashView extends ConsumerWidget {
  const SplashView({
    Key? key,
    required this.drawerModulePages,
    this.flavorConfigs = const {},
  }) : super(key: key);

  final List<DrawerPage> drawerModulePages;
  final Map<String, dynamic> flavorConfigs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(fbAuthProvider);
    final themeMode = ref.watch(themeNotifierProvider).value;

    ref.listen<int?>(
      clockProvider,
      (int? oldValue, int? elapsed) {
        if (elapsed == 2) {
          var isCurrentlyLogged = auth.checkCurrentUser;

          if (isCurrentlyLogged == null) {
            routeToWithClear(
                context,
                LogInView(
                  drawerModulePages: drawerModulePages,
                  flavorConfigs: flavorConfigs,
                ));
          } else {
            ref.watch(fbAppUserProvider.notifier).state = AppFbUser(
              uid: isCurrentlyLogged.uid,
              email: isCurrentlyLogged.email!,
              photoURL: isCurrentlyLogged.photoURL,
              displayName: isCurrentlyLogged.displayName,
            );

            routeToWithClear(
                context,
                ProfileCheckView(
                  drawerModulePages: drawerModulePages,
                  flavorConfigs: flavorConfigs,
                ));
          }
        }
      },
    );

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(child: LogoBox(themeMode: themeMode)),
            const Padding(
                padding: EdgeInsets.all(12.0),
                child: CircularProgressIndicator.adaptive()),
          ],
        ),
      )),
    );
  }
}
