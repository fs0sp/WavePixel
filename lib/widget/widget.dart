import 'package:flutter/material.dart';
import 'package:wavepixel/model/wallpaper_model.dart';
import 'package:wavepixel/views/image_view.dart';

Widget brandName() {
  return Row(
    
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text('WavePixels', 
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Circular',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    ],
  );
}



Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpapers.map((wallpaper){
          return GridTile(
            child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ImageView(
                          imgUrl: wallpaper.src.potrait,
                        ),
                    ));
                  },
                  child: Hero(
                    tag: wallpaper.src.potrait,
                  child: Container(
                  
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(wallpaper.src.potrait, fit: BoxFit.cover,)
                    ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
  );
}