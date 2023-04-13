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
  @override
  Widget build(BuildContext context) {
    // const Color surfaceColor = Color(0x0dffffff);
    // final Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeMode == ThemeMode.light
          ? MyAppThemeConfig.light().getTheme('fa')
          : MyAppThemeConfig.dark().getTheme('fa'),
          locale: const Locale('fa'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:AppLocalizations.supportedLocales ,
      home: HomeScreen(
        toggleThemeMode: () {
          setState(() {
            themeMode == ThemeMode.light
                ? themeMode = ThemeMode.dark
                : themeMode = ThemeMode.light;
          });
        },
      ),
    );
  }
}
