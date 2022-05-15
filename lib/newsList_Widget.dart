import 'package:flutter/material.dart';
import 'package:news_app/data/apimanager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sourses_response.dart';
import 'package:news_app/news_item_Widget.dart';


class NewsList_Widget extends StatelessWidget{
  Source? source;
  String? query;
  NewsList_Widget({this.source, this.query});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FutureBuilder<NewsResponse>(
          future: ApiManager.loadNews(sources: source?.id,query: query),
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
    );
  }
}
