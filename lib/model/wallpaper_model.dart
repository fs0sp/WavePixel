
class WallpaperModel {
  String photographer;
  String photographer_url;
  int photographer_id;

  SrcModel src;


  WallpaperModel({this.photographer, this.src, this.photographer_id, this.photographer_url});

  // accepts json and return model
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
      return WallpaperModel(
          src: SrcModel.fromMap(jsonData["src"]),
          photographer_url: jsonData["phorographer_url"],
          photographer_id: jsonData["photographer_id"],
          photographer: jsonData["photographer"]
      );
  }

}

/*

    SRCMODEL CLASS : Because we are getting a map inside the list 
                     we are fetching, so we have to make a new class
                     to get the values of that map.

*/

class SrcModel {

    String original;
    String small;
    String potrait;

    SrcModel({this.original, this.small, this.potrait});


    factory SrcModel.fromMap(Map<String,dynamic> jsonData) {
      return SrcModel(
        potrait: jsonData["portrait"],
        original: jsonData["original"],
        small: jsonData["small"],
      );
    }

}