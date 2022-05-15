import 'package:flutter/material.dart';
import 'package:news_app/Tab_Item.dart';

import 'newsList_Widget.dart';
import 'model/sourses_response.dart';

class CategoryTabs_Widget extends StatefulWidget{

   List<Source> sources;
   CategoryTabs_Widget(this.sources);

  @override
  State<CategoryTabs_Widget> createState() => _CategoryTabs_WidgetState();
}

class _CategoryTabs_WidgetState extends State<CategoryTabs_Widget> {
   int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(

      child:  DefaultTabController(
        initialIndex: 0,
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              padding: EdgeInsets.all(10),
              indicatorColor: Colors.transparent,
              onTap: (index){
                SelectedIndex=index;
                setState(() {
                  
                });
              },
              isScrollable: true,
              tabs: widget.sources.map((element) => TabItem(
                  SelectedIndex == widget.sources.indexOf(element),
                  element
              )).toList(),

            ),
            NewsList_Widget(

                source: widget.sources[SelectedIndex],
            ),

          ],
        ),
      ),


    );
  }
}
