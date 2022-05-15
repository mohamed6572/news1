import 'package:flutter/material.dart';
import 'package:news_app/full%20view/category_description.dart';
import 'package:news_app/model/news_response.dart';


class NewsItemWidget extends StatelessWidget{
  News news;
  NewsItemWidget(this.news);
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(news.publishedAt??"");
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(news.urlToImage ?? "",
                height: 170,
                  fit: BoxFit.cover,
                )),
          ),
          Text(news.source?.name ?? "",
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, category_Description.routeName,arguments: news,);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(news.title ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18
              ),
              ),
            ),
          ),
          Text("from ${time.hour} h",
            textAlign: TextAlign.end,
          )

        ],
      ),


    );
  }
}
