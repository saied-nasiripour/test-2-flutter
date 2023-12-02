import 'package:test_second_flutter/features/home_feature/domain/entities/post_entity.dart';

/// id : 4
/// title : "Small Concrete Car"
/// price : 455
/// description : "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit"
/// images : ["https://i.imgur.com/R2PN9Wq.jpeg","https://i.imgur.com/IvxMPFr.jpeg","https://i.imgur.com/7eW9nXP.jpeg"]
/// creationAt : "2023-12-01T10:58:18.000Z"
/// updatedAt : "2023-12-01T10:58:18.000Z"
/// category : {"id":1,"name":"Clothes","image":"https://i.imgur.com/QkIa5tT.jpeg","creationAt":"2023-12-01T10:58:18.000Z","updatedAt":"2023-12-01T10:58:18.000Z"}

class PostModel extends PostEntity {
  PostModel({
      this.id, 
      this.title, 
      this.price, 
      this.description, 
      this.images, 
      this.creationAt, 
      this.updatedAt, 
      this.category,}): super (
    id: id,
    title: title,
    price: price,
    description: description,
    images: images,
    creationAt: creationAt,
    updatedAt: updatedAt,
    category: category
  );

  factory PostModel.fromJson(dynamic json) {

    return PostModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: json['images'] != null ? json['images'].cast<String>() : [],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
    );
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

/// id : 1
/// name : "Clothes"
/// image : "https://i.imgur.com/QkIa5tT.jpeg"
/// creationAt : "2023-12-01T10:58:18.000Z"
/// updatedAt : "2023-12-01T10:58:18.000Z"

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