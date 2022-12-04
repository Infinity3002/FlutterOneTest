import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('uk')],
        //fallbackLocale: Locale('uk'),
        path: 'assets/translations', // <-- change the path of the translation files
        child:  MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


   // String _selectedLang = context.locale.languageCode;
    return MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: Builder(
        builder: (context) { return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Text("welcome_title".tr()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  InkWell(child: Text('Engl'), onTap: () {context.setLocale(Locale('en'));},),
                  InkWell(child: Text('Engl2222222'), onTap: () {context.setLocale(Locale('uk'));},)
                ],)
              ],
            )
        ),
    );}));
  }
}

