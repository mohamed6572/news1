// import 'package:intl/intl.dart';
// import 'package:news_app/model/news_response.dart';
//
// showPublishedAt(DateTime publishedAt) {
// News? news;
//   var dateTimeNow = DateTime.now();
//   var diffrence = dateTimeNow.difference(DateTime.parse(news?.publishedAt ?? '')).inMinutes;
//
//   if(diffrence < 0) {
//     diffrence = dateTimeNow.difference(DateTime.parse(news?.publishedAt ?? '')).inSeconds;
//     return '$diffrence seconds ago';
//   } else if(diffrence > 0 && diffrence < 60) {
//     diffrence = dateTimeNow.difference(DateTime.parse(news?.publishedAt ?? '')).inMinutes;
//     return '$diffrence minutes ago';
//   } else if(diffrence > 60 && diffrence < 1440) {
//     diffrence = dateTimeNow.difference(DateTime.parse(news?.publishedAt ?? '')).inHours;
//     return '$diffrence hours ago';
//   } else if(diffrence > 1440 && diffrence < 44640) {
//     diffrence = dateTimeNow.difference(DateTime.parse(news?.publishedAt ?? '')).inDays;
//     return '$diffrence days ago';
//   } else {
//     return DateFormat.yMMMd().format(DateTime.parse(news?.publishedAt ?? ''));
//   }
// }