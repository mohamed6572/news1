import 'package:flutter/material.dart';
import 'package:news_app/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class CategoryGridWidget extends StatelessWidget{
  Category category;
  int index;
  Function onCategoryClick;
  CategoryGridWidget(this.category,this.index,this.onCategoryClick);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        onCategoryClick(category);

      },
      child: Container(
        decoration: BoxDecoration(
          color: category.Background,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
            bottomRight: Radius.circular(provider.appLanguage=='en'
                ? index%2==0?0:24
                : index%2==0?24:0
            ),
            bottomLeft: Radius.circular(provider.appLanguage=='en'
                ? index%2==0?24:0
                : index%2==0?0:24
            ),

          )
        ),
        child: Column(
          children: [
            Image.asset(category.imagePath,
            height: 120,
            ),
            Text(category.title,style: Theme.of(context).textTheme.headline4
              ,),
          ],
        ),
      ),
    );
  }
}

class Category{
  String CategoryId;
  String title;
  String imagePath;
  Color Background;
  Category({
    required this.CategoryId,
    required this.title,
    required this.imagePath,
    required this.Background
  });
}
