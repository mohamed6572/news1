import 'package:flutter/material.dart';
import 'package:news_app/HomeScrean.dart';
import 'package:news_app/data/apimanager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sourses_response.dart';

import '../news_item_Widget.dart';

class SearchItemWidget extends StatelessWidget{
  static const String routeName='search';
  Source? source;
  SearchItemWidget([this.source]);
  @override
  Widget build(BuildContext context) {
    var search = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body:Expanded(
        child: Container(
          child: FutureBuilder<NewsResponse>(
            future: ApiManager.loadNews(sources: source?.id,query: search),
            builder: (buildContext,AsyncSnapshot<NewsResponse> snapshot) {
              if(snapshot.hasError){
                return Center(child:
                Text(snapshot.error.toString()));
              }else if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(itemBuilder: (buildContext, index){

                return NewsItemWidget(snapshot.data!.articles!.elementAt(index)
                );
              },
                itemCount: snapshot.data?.articles?.length?? 0 ,
              );

            },
          ),

        ),
      ),
    );
  }
}
