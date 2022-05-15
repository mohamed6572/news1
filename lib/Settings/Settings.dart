import 'package:flutter/material.dart';
import 'package:news_app/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'LanguageBottomSheet.dart';

class Settings extends StatefulWidget{
  static const String routeName='sett';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
          style: TextStyle(
            fontSize: 18),),
          InkWell(
            onTap: (){
              ShowLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Theme.of(context).primaryColor)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage =='en' ? "English" : "العربية",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor
                  ),
                  ),
                  Icon(Icons.arrow_drop_down_sharp,color: Theme.of(context).primaryColor,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void ShowLanguageBottomSheet(){
    showModalBottomSheet(
      context: context,
      builder: (buildContext){
        return LanguageBottomSheet();

      }
    );

  }
}
