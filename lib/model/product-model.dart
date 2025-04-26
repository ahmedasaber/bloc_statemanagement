import 'package:bloc_statemanagement/model/rate-model.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> jsonDate) {
    return Product(
      id: jsonDate['id'],
      title: jsonDate['title'],
      price: jsonDate['price'].toDouble(),
      description: jsonDate['description'],
      category: jsonDate['category'],
      image: jsonDate['image'],
      rating: Rating.fromJson(jsonDate['rating']),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toJson(),
    };
  }

  @override
  List<Object?> get props => [id, title, price, description, category, image];
}
