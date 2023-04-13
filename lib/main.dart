import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/screens.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  Locale locale = const Locale('en');
  @override
  Widget build(BuildContext context) {
    // const Color surfaceColor = Color(0x0dffffff);
    // final Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeMode == ThemeMode.light
          ? MyAppThemeConfig.light().getTheme(locale.languageCode)
          : MyAppThemeConfig.dark().getTheme(locale.languageCode),
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomeScreen(
        toggleThemeMode: () {
          setState(() {
            themeMode == ThemeMode.light
                ? themeMode = ThemeMode.dark
                : themeMode = ThemeMode.light;
          });
        },
        selectedLanguageChanged: (Language language) {
          locale =
              language == Language.en ? const Locale('en') : const Locale('fa');
              setState(() {
                
              });
        },
      ),
    );
  }
}
