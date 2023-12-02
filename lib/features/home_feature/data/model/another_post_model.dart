/// id : 74
/// title : "Hello World by alejopua"
/// price : 6996
/// description : "reloj prueba"
/// images : ["https://upload.wikimedia.org/wikipedia/commons/f/fc/EAM_Nuvolari_S1_640x480.jpg"]
/// creationAt : "2023-12-01T12:09:41.000Z"
/// updatedAt : "2023-12-01T15:23:22.000Z"
/// category : {"id":2,"name":"Clothes","image":"https://i.imgur.com/ZANVnHE.jpeg","creationAt":"2023-12-01T10:58:18.000Z","updatedAt":"2023-12-01T12:08:50.000Z"}

class AnotherPostModel {
  AnotherPostModel({
      this.id, 
      this.title, 
      this.price, 
      this.description, 
      this.images, 
      this.creationAt, 
      this.updatedAt, 
      this.category,});

  AnotherPostModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  num? id;
  String? title;
  num? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['images'] = images;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

/// id : 2
/// name : "Clothes"
/// image : "https://i.imgur.com/ZANVnHE.jpeg"
/// creationAt : "2023-12-01T10:58:18.000Z"
/// updatedAt : "2023-12-01T12:08:50.000Z"

class Category {
  Category({
      this.id, 
      this.name, 
      this.image, 
      this.creationAt, 
      this.updatedAt,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}