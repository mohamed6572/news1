import 'package:flutter/material.dart';
import 'package:news_app/Category_Taps_Widget.dart';
import 'package:news_app/Item_Category.dart';
import 'package:news_app/data/apimanager.dart';
import 'package:news_app/model/sourses_response.dart';

class CategoryDetailsScrean extends StatelessWidget{
Category category;
CategoryDetailsScrean(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(

      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.loadNewsSources(category.CategoryId),
        builder: (BuildContext, AsyncSnapshot<SourcesResponse> snapshot) {
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return CategoryTabs_Widget(snapshot.data?.sources ?? []);


        },
      ),



    );
  }
}
