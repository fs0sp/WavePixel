import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:wavepixel/data/data.dart';
import 'package:wavepixel/datasource.dart';
import 'package:wavepixel/model/wallpaper_model.dart';
import 'package:wavepixel/widget/widget.dart';


class Category extends StatefulWidget {

  final String categoryname;

  const Category({Key key, this.categoryname}) : super(key: key);


  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {


  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();



  searchWallpapers(String query) async {
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1",
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
    searchWallpapers(widget.categoryname);
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
              SizedBox(height: 16,),
              
                   
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    
    );
  }
}