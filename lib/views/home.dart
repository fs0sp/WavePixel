import 'package:flutter/material.dart';
import 'package:wavepixel/data/data.dart';
import 'package:wavepixel/model/category_model.dart';
import 'package:wavepixel/model/wallpaper_model.dart';
import 'package:wavepixel/views/category.dart';
import 'package:wavepixel/views/image_view.dart';
import 'package:wavepixel/views/search.dart';
import 'package:wavepixel/widget/widget.dart';
import '../datasource.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoriesModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();

  TextEditingController searchController = new TextEditingController();


  getTrendingWallpapers() async {
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=25&page=1",
    headers: {
      "Authorization" : apiKey
    }
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaperModel);
    }); 

    setState(() {
      
    });

  }


  @override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: primaryBlack,
         appBar: AppBar(
           title: brandName(),
           elevation: 0.0,
         ),
         body: SingleChildScrollView(
            child: Container(
             child: Column(
               children: <Widget>[
                 Container(
                   decoration: BoxDecoration(
                     color: searchColor,
                     borderRadius: BorderRadius.circular(30),
                   ),
                   padding: EdgeInsets.symmetric(horizontal: 24),
                   margin: EdgeInsets.symmetric(horizontal: 24),
                   child: Row(
                     children: <Widget>[
                       Expanded(
                           child: TextField(
                             controller: searchController,
                             style: TextStyle(color: Colors.white),
                             decoration: InputDecoration(
                             hintText: "search",
                             border: InputBorder.none,
                             hintStyle: TextStyle(color: Colors.white),
                             focusColor: Colors.white,
                  
                           ),
                         ),
                       ),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context) => Search(
                               searchQuery: searchController.text,
                             )
                           ));
                         },
                          child: Container(
                           child: Icon(Icons.search, color: Colors.white, )
                           ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 15,),
                 Container(
                   height: 80,
                   child: ListView.builder(
                     padding: EdgeInsets.symmetric(horizontal: 24),
                     scrollDirection: Axis.horizontal,
                     itemCount: categories.length,
                     shrinkWrap: true,
                     itemBuilder: (context, index) {
                       return CategoriesTile(
                         title: categories[index].categoryName,
                         imageUrl: categories[index].imageUrl,
                       );
                     },
                   ),
                 ),
                 Text('TRENDING', style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Circular'), ),
                 SizedBox(height: 15,),
                 wallpapersList(wallpapers: wallpapers, context: context),
               ],
             ),
           ),
         ),
    );
  }
}

class CategoriesTile extends StatelessWidget {

  final String imageUrl;
  final String title;

  const CategoriesTile({Key key, this.imageUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Category(
            categoryname: title.toLowerCase(),
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(imageUrl, height: 50, width: 100, fit: BoxFit.cover,)
                    ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Center(child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15), )),
            )
          ],
        ),
      ),
    );
  }


}