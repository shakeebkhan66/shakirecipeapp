class Recipes {
  Recipes({
      this.id, 
      this.productName, 
      this.ingredients, 
      this.makeRecipe, 
      this.categories, 
      this.image,});

  Recipes.fromJson(dynamic json) {
    id = json['id'];
    productName = json['productName'];
    ingredients = json['ingredients'];
    makeRecipe = json['makeRecipe'];
    categories = json['categories'];
    image = json['image'];
  }
  int? id;
  String? productName;
  String? ingredients;
  String? makeRecipe;
  String? categories;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productName'] = productName;
    map['ingredients'] = ingredients;
    map['makeRecipe'] = makeRecipe;
    map['categories'] = categories;
    map['image'] = image;
    return map;
  }

}