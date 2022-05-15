import 'package:flutter/material.dart';
import 'package:news_app/Item_Category.dart';
import 'package:news_app/Settings/Settings.dart';
import 'package:news_app/categoris.dart';
import 'package:news_app/categoryDetailsScrean.dart';
import 'package:news_app/data/apimanager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/news_item_Widget.dart';
import 'package:news_app/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Search/search_widget.dart';

class HomeScrean extends StatefulWidget{
  static const String routeName = 'home';


  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {

  int index =0;


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
     children: [
       Container(
         color: Colors.white,
         child:  Image.asset('assets/image/pattern.png',
           width: double.infinity,
           height: double.infinity,
           fit: BoxFit.fill,
         ),
       ),
       Scaffold(
         appBar: AppBar(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.vertical(
               bottom: Radius.circular(45)
             )
           ),

           actions: [
             IconButton(
                 onPressed: (){
                   showSearch(context: context, delegate: SearchDel());
                 },
                 icon: Icon(Icons.search)),


           ],
           title: Text('News Application'),
         ),
         drawer: Drawer(
           child: Column(
             children: [
               Container(
                 width: double.infinity,
                 padding: EdgeInsets.symmetric(vertical: 48),
                 color: Theme.of(context).primaryColor,
                 child: Text(
                  AppLocalizations.of(context)!.newsapp,
                   style: Theme.of(context).textTheme.headline4,
                   textAlign: TextAlign.center,
                 ),
               ),
               InkWell(
                 onTap: (){
                   Navigator.pop(context);
                   index=0;
                   selectedCategory=null;
                   setState(() {
                   });
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Icon(Icons.list,size: 36,),
                       Text(
                       AppLocalizations.of(context)!.categories
                       ,style: Theme.of(context).textTheme.headline5,)
                     ],
                   ),
                 ),
               ),
               InkWell(
                 onTap: (){
                   Navigator.pop(context);
                   index =1;

                   setState(() {
                   });

                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Icon(Icons.settings,size: 36,),
                       Text(
                       AppLocalizations.of(context)!.settings
                       ,style: Theme.of(context).textTheme.headline5,)
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
         body:
         ViewsIndex(index)
        ,

       )
     ],
    );
  }

  Widget ViewsIndex(int index){
    if(index==0){
   return   selectedCategory==null?
      CategoriesScrean(onCategoryClickCallBack):
      CategoryDetailsScrean(selectedCategory!);
    }
   return Settings();

  }

   Category? selectedCategory = null;

  void onCategoryClickCallBack(Category category){
    print(category.title);
    selectedCategory=category;
    setState(() {
      selectedCategory=category;
    });
  }
}

class SearchDel extends SearchDelegate{
  late Future<NewsResponse> newsResponse;
  SearchDel(){
    newsResponse =ApiManager.loadNews(query: query);
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        newsResponse= ApiManager.loadNews(query: query);
        showResults(context);

      },
          icon: Icon(Icons.search))

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
   return  Container(
     color: Colors.white,
     child: FutureBuilder<NewsResponse>(
       future: ApiManager.loadNews(query: query),
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

   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Text('ss'));

  }

}



/*
// Search Tap
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar =  Text('News Application');

String? newtext;

 IconButton(
                 onPressed: () {
                   setState(() {
                     if (customIcon.icon == Icons.search) {
                       customIcon = const Icon(Icons.cancel);
                       customSearchBar =  Container(
                         margin:EdgeInsets.only(bottom: 7.0) ,
                         child:  TextField(
                           onChanged: (text){
                             newtext=text;
                           },
                           decoration: InputDecoration(
                             prefixIcon: InkWell(
                               onTap: (){
                                 Navigator.pushNamed(context, SearchItemWidget.routeName
                                 ,arguments: newtext
                                 );

                               },
                               child: Icon(Icons.search,
                               color: Theme.of(context).primaryColor,
                               ),
                             ),
                               fillColor: Colors.white,
                               filled: true,
                               hintStyle: TextStyle(
                                   color: Theme.of(context).primaryColor
                               ),
                               hintText: 'search...',
                               enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(24),
                                 borderSide: BorderSide(
                                   color: Theme.of(context).primaryColor
                                 )
                               )
                           ),
                         ),
                       );
                     } else {
                       customIcon = const Icon(Icons.search);
                       customSearchBar =  Text("News Application");
                     }
                   });
                 },
                 icon: customIcon
             )
 */