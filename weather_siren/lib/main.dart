import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:weather_siren/ui/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      lightTheme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      statusBarColorBuilder: (theme) => theme?.colorScheme.background,
      navigationBarColorBuilder: (theme) => theme?.colorScheme.background,
      builder: (context, theme, darkTheme, themeMode) {
        return MaterialApp.router(
          // routes:locator. navigationService.,
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: theme,
          darkTheme: darkTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
