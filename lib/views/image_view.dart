import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wavepixel/datasource.dart';
import 'home.dart';
import 'dart:io';
import 'package:wavepixel/model/wallpaper_model.dart';



class ImageView extends StatefulWidget {

 
  final String imgUrl;

  const ImageView({Key key, this.imgUrl}) : super(key: key);

  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<ImageView> {
 
  var filePath;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
              tag: widget.imgUrl,
              child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imgUrl, fit: BoxFit.cover,),
              ),
          ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                      onTap: (){
                        _save();
                      },
                      child: Container(
                      
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      decoration: BoxDecoration(
                        color: searchColor,
                        border: Border.all(color: Colors.white54,width: 1),
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Color(0x36FFFFFF),
                            Color(0x0FFFFFFF)
                          ]
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text('Set Wallpaper', style: TextStyle(color: Colors.white70, fontSize: 10), ),
                          Text('Image will get saved in gallery', style: TextStyle(color: Colors.white70, fontSize: 10), ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text('Cancel', style: TextStyle(color: Colors.white), ),
                  SizedBox(height: 50,)
                ],
              ),
            )
        ],
      ),
    );
  }

  

 _save() async {
    await _askPermission();
    var response = await Dio().get(widget.imgUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */await PermissionHandler()
              .requestPermissions([PermissionGroup.photos]);
    } else {
      PermissionHandler permission = PermissionHandler();
    await permission.requestPermissions([PermissionGroup.storage,PermissionGroup.camera,PermissionGroup.location]);
    await permission.checkPermissionStatus(PermissionGroup.storage);
    }
  }


}