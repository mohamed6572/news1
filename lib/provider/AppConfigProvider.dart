import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{

  String appLanguage = 'en';

  void changeLanguage (String langcode)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(langcode == appLanguage)return ;
    prefs.setString('language', langcode);
    appLanguage = langcode;
    notifyListeners();
  }


}