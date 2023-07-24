import 'dart:convert';

import 'package:desafio_bemol/app/models/rating_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? category;
  String? description;
  String? image;
  final RatingModel? rating;
  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image,
      this.rating});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
      'rating': rating!.toJson()
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? (map['price'] as num).toDouble() : null,
      category: map['category'] != null ? map['category'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      rating:
          map['rating'] != null ? RatingModel.fromJson(map['rating']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductModel copyWith(
      {int? id,
      String? title,
      double? price,
      String? category,
      String? description,
      String? image,
      RatingModel? rating}) {
    return ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        category: category ?? this.category,
        description: description ?? this.description,
        image: image ?? this.image,
        rating: rating ?? this.rating);
  }
}
