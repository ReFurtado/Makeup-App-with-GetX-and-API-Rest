// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  int id;
  String name;
  double price;
  String imagelink;
  String description;
  String producttype;
  int rating;
  
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imagelink,
    required this.description,
    required this.producttype,
    required this.rating
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'imagelink': imagelink,
      'description': description,
      'producttype': producttype,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    //print("imagelink: ${map['image_link']}");
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: double.parse(map['price'] as String),
      imagelink: map['image_link'] as String,
      description: map['description'] as String,
      producttype: map['product_type'] as String,
      rating: (map['rating'] as num?)?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => 
    ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

