import 'dart:io';

import 'package:common/common.dart';
import 'package:fbs_flutter/l10n/generated/l10n.dart';
import 'package:fbs_flutter/main/main_layout.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FBSApp extends StatefulWidget {
  const FBSApp({Key? key}) : super(key: key);

  @override
  State<FBSApp> createState() => _FBSAppState();
}

class _FBSAppState extends State<FBSApp> {
  final List<Locale> supportedLocales = <Locale>[
    const Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    const Locale.fromSubtags(languageCode: 'id', countryCode: 'ID'),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      darkTheme: Palette.dark,
      theme: Palette.light,
      themeMode: ThemeMode.dark,
      localizationsDelegates: const [
        FBSLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      locale: const Locale.fromSubtags(languageCode: 'id', countryCode: 'ID'),
      home: const MainLayout(),
    );
  }
}
