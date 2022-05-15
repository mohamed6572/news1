import 'package:flutter/material.dart';
import 'package:news_app/full%20view/show_published_at.dart';
import 'package:news_app/model/news_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class category_Description extends StatefulWidget {
  static const String routeName = 'descrip';

  @override
  State<category_Description> createState() => _category_DescriptionState();
}

class _category_DescriptionState extends State<category_Description> {
  late News news;

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    DateTime date = DateTime.parse(news.publishedAt ?? "");
    // var time = showPublishedAt(date , news);

    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/image/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('News Title'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          news.urlToImage ?? "",
                          height: 170,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Text(
                    news.source?.name ?? "",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      news.title ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),
                  Text(
                    'from ${date.hour}h',
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    'description',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Text(
                        news.description ?? "",
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchUrl(news.url ?? "");
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'View Full Article',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  showPublishedAt(DateTime publishedAt, News news) {
    News? news;
    var dateTimeNow = DateTime.now();
    var diffrence = dateTimeNow
        .difference(DateTime.parse(news?.publishedAt ?? ''))
        .inMinutes;

    if (diffrence < 0) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news?.publishedAt ?? ''))
          .inSeconds;
      return '$diffrence seconds ago';
    } else if (diffrence > 0 && diffrence < 60) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news?.publishedAt ?? ''))
          .inMinutes;
      return '$diffrence minutes ago';
    } else if (diffrence > 60 && diffrence < 1440) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news?.publishedAt ?? ''))
          .inHours;
      return '$diffrence hours ago';
    } else if (diffrence > 1440 && diffrence < 44640) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news?.publishedAt ?? ''))
          .inDays;
      return '$diffrence days ago';
    } else {
      return DateFormat.yMMMd().format(DateTime.parse(news?.publishedAt ?? ''));
    }
  }

  Future<void> _launchUrl(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(
        urlString,
        // forceWebView: true
      );
    } else {
      print('Can\'t launch Url');
    }
  }
}
