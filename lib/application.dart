import 'package:afisha_web/app_scroll_behavior.dart';
import 'package:afisha_web/const/const_variables.dart';
import 'package:afisha_web/generated/l10n.dart';
import 'package:afisha_web/main_screen.dart';
import 'package:afisha_web/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: GlobalVar.nameLib,
      theme: CustomTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}
