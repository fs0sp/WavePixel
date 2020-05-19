import 'package:flutter/material.dart';
import 'package:wavepixel/data/data.dart';
import 'package:wavepixel/model/wallpaper_model.dart';
import 'package:wavepixel/widget/widget.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../datasource.dart';


class Search extends StatefulWidget {

  final String searchQuery;
  Search({this.searchQuery});


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

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
    searchWallpapers(widget.searchQuery);
    searchController.text = widget.searchQuery;
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
                            searchWallpapers(searchController.text);
                           },
                            child: Container(
                             child: Icon(Icons.search, color: Colors.white, )
                             ),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 15,),
                   wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}