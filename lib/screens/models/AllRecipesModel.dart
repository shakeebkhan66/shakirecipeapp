import 'Username.dart';

class AllRecipesModel {
  AllRecipesModel({
      this.id, 
      this.productName, 
      this.ingredients, 
      this.makeRecipe, 
      this.categories, 
      this.image, 
      this.username,});

  AllRecipesModel.fromJson(dynamic json) {
    id = json['id'];
    productName = json['productName'];
    ingredients = json['ingredients'];
    makeRecipe = json['makeRecipe'];
    categories = json['categories'];
    image = json['image'];
    username = json['username'] != null ? Username.fromJson(json['username']) : null;
  }
  int? id;
  String? productName;
  String? ingredients;
  String? makeRecipe;
  String? categories;
  String? image;
  Username? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productName'] = productName;
    map['ingredients'] = ingredients;
    map['makeRecipe'] = makeRecipe;
    map['categories'] = categories;
    map['image'] = image;
    if (username != null) {
      map['username'] = username!.toJson();
    }
    return map;
  }

}