import 'package:flutter/material.dart';
import 'package:news_app/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');
            },
            child: provider.appLanguage=='en'?
            getSelectedItem('English', context)
            :UnSelectedItem('English', context),
          ),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage =='ar'?
            getSelectedItem('العربية', context)
            :UnSelectedItem('العربية', context),
          )
        ],
        
      ),
    );
  }
  
  Widget getSelectedItem(String text , BuildContext context){
    return Padding(
        padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor
            ),
          ),
          Icon(Icons.check,color: Theme.of(context).primaryColor)
        ],
      ),
    
    );
    
  }
  
  Widget UnSelectedItem(String text , BuildContext context){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Text(text,
          style: TextStyle(
            fontSize: 18
          ),),
          
        ],
      ),
    );
  }
}
