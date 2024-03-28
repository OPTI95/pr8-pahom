import 'package:pr8/features/product/domain/entities/product_entity.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.count,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      price: json['price'] ?? 0,
      count: json['count'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'count': count,
    };
  }
}
