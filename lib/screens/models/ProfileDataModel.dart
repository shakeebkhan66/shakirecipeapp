
class ProfileDataModel {
  User? user;
  List<Recipes>? recipes;

  ProfileDataModel({this.user, this.recipes});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (recipes != null) {
      data['recipes'] = recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? fullname;

  User({this.id, this.username, this.email, this.fullname});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['fullname'] = fullname;
    return data;
  }
}

class Recipes {
  int? id;
  String? productName;
  String? ingredients;
  String? makeRecipe;
  String? categories;
  String? image;

  Recipes(
      {this.id,
        this.productName,
        this.ingredients,
        this.makeRecipe,
        this.categories,
        this.image});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    ingredients = json['ingredients'];
    makeRecipe = json['makeRecipe'];
    categories = json['categories'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['ingredients'] = ingredients;
    data['makeRecipe'] = makeRecipe;
    data['categories'] = categories;
    data['image'] = image;
    return data;
  }
}
