import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String title;
  final String description;
  final int price;

  Item({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
    );
  }
}
