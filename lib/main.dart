import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/firebase_options.dart';
import 'package:flutter_huixin_app/ui/pages/home/home_ui.dart';
import 'package:flutter_huixin_app/ui/pages/signin/signin_ui.dart';
import 'package:flutter_huixin_app/utils/providers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'common/constants/color.dart';
import 'common/routes/routes.dart';
import 'common/themes/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HuixinApp());
}

class HuixinApp extends StatelessWidget {
  const HuixinApp({super.key});

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
          Locale('id'),
        ],
        locale: const Locale('id'),
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
