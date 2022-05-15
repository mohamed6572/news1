import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sourses_response.dart';

class ApiManager{
 static const String apikey = '1beaef5108684a84ad7e3b73dbd2860c';
 static const String baseUrl = 'newsapi.org';


 static Future<SourcesResponse> loadNewsSources(String category)
 async{

  var params = {
   'apikey' : apikey,
   'category': category
  };

  var uri =  Uri.https(baseUrl, '/v2/top-headlines/sources', params);
  var respnse = await http.get(uri);

  var sourcesResponse =
  SourcesResponse.fromJson( jsonDecode(respnse.body));

  if(respnse.statusCode == 200){
     return sourcesResponse;
  }
   if(sourcesResponse.message!=null)
   throw Exception(sourcesResponse.message);
    throw Exception('error loading news sources');

 }

 static Future<NewsResponse>loadNews({String? sources,String? query})
 async{
  var params = {
   'apiKey' : apikey,
   'sources': sources,
   'q' : query,
  };
  var uri = Uri.https(baseUrl ,"/v2/everything",params );
  var response = await http.get(uri);
  var newsResponse = NewsResponse.fromJson(jsonDecode(response.body));

  if(response.statusCode == 200){
   return newsResponse;
  }
  if(newsResponse.message!=null)
   throw Exception(newsResponse.message);
  throw Exception('error loading news sources');


 }


}
