import 'package:flutter/material.dart';
import 'package:news_app/Item_Category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScrean extends StatelessWidget{
  Function onCategoryClickCallBack;
  CategoriesScrean(this.onCategoryClickCallBack);
  List<Category> categories=[
    Category(CategoryId: 'sports', title: 'Sports', imagePath: 'assets/image/sports.png',Background:  Color.fromRGBO(
        201, 28, 34, 1.0)),
    Category(CategoryId:'technology', title: 'technology', imagePath: 'assets/image/techn.png',Background:  Color.fromRGBO(
        0, 62, 144, 1.0)),
    Category(CategoryId:'health', title: 'Health', imagePath: 'assets/image/health.png',Background:  Color.fromRGBO(
        237, 30, 121, 1.0)),
    Category(CategoryId:'business', title: 'Business ',imagePath: 'assets/image/bussines.png',Background:  Color.fromRGBO(
        207, 126, 72, 1.0)),
    Category(CategoryId:'entertainment',  title:'entertainment',imagePath: 'assets/image/television.png', Background: Color.fromRGBO(
        72, 130, 207, 1.0)),
    Category(CategoryId:'science', title: 'Science',imagePath: 'assets/image/science.png',Background:  Color.fromRGBO(
        242, 211, 82, 1.0)),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.pickCategory,

          style: Theme.of(context).textTheme.headline4!.copyWith(
            color: Colors.black
          ),),
          Expanded(
              child:GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8
                  ),
                  itemBuilder: (buildContext , index){
                    return CategoryGridWidget(categories[index], index,
                        (category){
                          onCategoryClickCallBack(category);
                        }
                    );
                  },
                itemCount: categories.length,
              )
          ),
        ],
        
      ),
    );
  }
}
