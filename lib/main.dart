import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/firebase_options.dart';
import 'package:flutter_huixin_app/ui/pages/home/home_ui.dart';
import 'package:flutter_huixin_app/ui/pages/signin/signin_ui.dart';
import 'package:flutter_huixin_app/utils/providers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'common/constants/color.dart';
import 'common/routes/routes.dart';
import 'common/themes/theme_data.dart';
import 'common/utils/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initNotification();
  runApp(const HuixinApp());
}

class HuixinApp extends StatefulWidget {
  const HuixinApp({super.key});

  @override
  State<HuixinApp> createState() => _HuixinAppState();
}

class _HuixinAppState extends State<HuixinApp> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      checkForUpdate();
    }
    setupFcm();
  }

  Future<void> subscribeNotification() async {
    NotificationService().firebaseMessaging.subscribeToTopic('for-all-users');
    debugPrint('Subscribed to topic');
  }

  Future<void> onMessage(RemoteMessage event) async {
    NotificationService().showNotification(
      title: event.notification!.title,
      body: event.notification!.body,
    );
  }

  void _handleMessage(RemoteMessage message) {
    NotificationService().showNotification(
      title: message.notification!.title,
      body: message.notification!.body,
    );
  }

  Future<void> setupFcm() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    // FirebaseMessaging.onBackgroundMessage(
    //     NotificationService().firebaseBackgroundHandler);
    FirebaseMessaging.onMessage.listen(onMessage);

    subscribeNotification();
  }

  Future<void> checkForUpdate() async {
    await InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        performImmediateUpdate();
      }
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<void> performImmediateUpdate() async {
    await InAppUpdate.performImmediateUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 480,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(
            color: AppColors.backgroundcolor,
          ),
        ),
        title: 'Hui Xin: MANDARIN LEARNING CENTER',
        theme: myLightTheme,
        darkTheme: myDarkTheme,
        themeMode: ThemeMode.light,

        /// For accessing lesson selector page
        /// without logging in
        // home: const LessonSelectorPage(),
        home: const Init(),
        routes: routes,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
        ],
        locale: const Locale('en'),
      ),
    );
  }
}

class Init extends StatelessWidget {
  /// This widget determines whether to show the login page or the home page
  /// based on whether the user is logged in or not.
  /// If the user is logged in, the home page will be shown.
  /// If the user is not logged in, the login page will be shown.
  const Init({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataUser?>(
      future: AppSecureStorage.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading screen if data is still being fetched
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          // If data is available, show home page
          return const HomePage();
        } else {
          // If data is not available, show login page
          return const LoginPage();
        }
      },
    );
  }
}
