import 'package:test_second_flutter/features/home_feature/data/model/post_model.dart';

class PostEntity {
  final num? id;
  final String? title;
  final num? price;
  final String? description;
  final List<String>? images;
  final String? creationAt;
  final String? updatedAt;
  final Category? category;

  const PostEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });
}
