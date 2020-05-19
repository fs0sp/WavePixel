

import 'package:wavepixel/model/category_model.dart';


String apiKey = "563492ad6f91700001000001b7acb5c301fd4e2fb9783b6ec821feee";



List<CategoriesModel> getCategories() {
  
    List<CategoriesModel> categories = new List();
    CategoriesModel categoriesModel = new CategoriesModel();

    categoriesModel.imageUrl = "https://images.pexels.com/photos/247431/pexels-photo-247431.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
    categoriesModel.categoryName = "Wild Life";
    categories.add(categoriesModel);
    categoriesModel = new CategoriesModel();

    categoriesModel.imageUrl = "https://images.pexels.com/photos/1181354/pexels-photo-1181354.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
    categoriesModel.categoryName = "Technology";
    categories.add(categoriesModel);
    categoriesModel = new CategoriesModel();

    categoriesModel.imageUrl = "https://images.pexels.com/photos/4099355/pexels-photo-4099355.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
    categoriesModel.categoryName = "Love";
    categories.add(categoriesModel);
    categoriesModel = new CategoriesModel();

    categoriesModel.imageUrl = "https://images.pexels.com/photos/4253313/pexels-photo-4253313.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
    categoriesModel.categoryName = "Food";
    categories.add(categoriesModel);
    categoriesModel = new CategoriesModel();

    categoriesModel.imageUrl = "https://images.pexels.com/photos/4100130/pexels-photo-4100130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
    categoriesModel.categoryName = "Nature";
    categories.add(categoriesModel);
    categoriesModel = new CategoriesModel();

    categoriesModel.imageUrl = "https://images.pexels.com/photos/3963122/pexels-photo-3963122.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
    categoriesModel.categoryName = "Fashion";
    categories.add(categoriesModel);
    categoriesModel = new CategoriesModel();


    return categories;

}