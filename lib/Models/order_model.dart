import 'package:ecommerce/models/product_model.dart';
import 'package:hive/hive.dart';

part 'order_model.g.dart'; // Add this line

@HiveType(typeId: 1) // Add this (use different typeId than Product)
class Order {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final List<Product> items;
  
  @HiveField(2)
  final double total;
  
  @HiveField(3)
  final DateTime date;

  Order({
    required this.items,
    required this.total,
    required this.date,
    required this.id,
  });
}