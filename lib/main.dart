import 'package:flutter/material.dart';
import 'package:news_app/MyThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/full%20view/category_description.dart';
import 'package:news_app/provider/AppConfigProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScrean.dart';
import 'package:provider/provider.dart';

import 'Search/search_widget.dart';
import 'Settings/Settings.dart';

void main ()=>runApp(
  ChangeNotifierProvider(create:
  (BuildContext){
    return AppConfigProvider();
  },
    child: MyApp(),));

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;
  late SharedPreferences prefs;


  @override
  Widget build(BuildContext context) {
     provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme : MyThemeData.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      routes: {
        HomeScrean.routeName:(context) => HomeScrean(),
        Settings.routeName :(context) => Settings(),
        category_Description.routeName : (context)=> category_Description(),
        SearchItemWidget.routeName : (context) => SearchItemWidget(),
      },
      initialRoute: HomeScrean.routeName,
    );
  }
  void initSharedPreference()async{
    prefs = await SharedPreferences.getInstance();
    provider.changeLanguage(prefs.getString('language')??"en");
  }
}
