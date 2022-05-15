import 'package:flutter/material.dart';
import 'package:news_app/model/sourses_response.dart';

class TabItem extends StatelessWidget{

  Source source;
  bool isSelected;
  TabItem(this.isSelected,this.source);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isSelected?
            Theme.of(context).primaryColor:
            Colors.transparent,
        border: Border.all(
            color: Theme.of(context).primaryColor,
        width: 2
        )
      ),
      child: Text(source.name ??"",
      style: TextStyle(
        color: isSelected?
        Colors.white:
        Theme.of(context).primaryColor
      ),
      ),
    );
  }
}
