import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final int id;
  
  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final String category;
  
  @HiveField(3)
  final double price;
  
  @HiveField(4)
  final String image;
  
  @HiveField(5)
  final String description;
  
  @HiveField(6)
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.image,
    this.description = '',
    this.quantity = 1,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      category: json['category'] ?? 'Uncategorized',
      price: (json['price'] ?? 0.0).toDouble(),
      image: json['image'] ?? '',
      description: json['description'] ?? '',
    );
  }

  double get totalPrice => price * quantity;
}

// Sample product list
List<Product> allProducts = [
  Product(
    id: 1,
    title: "Regular Fit Slogan",
    category: "Mens T-Shirts",
    price: 1190,
    image: "assets/images/Tshirt.png",
  ),
  Product(
    id: 2,
    title: "Regular Fit Polo",
    category: "Mens T-Shirts",
    price: 1100,
    image: "assets/images/Tshirt1.png",
  ),
  Product(
    id: 3,
    title: "Regular Fit Black",
    category: "Mens T-Shirts",
    price: 1690,
    image: "assets/images/Tshirt2.png",
  ),
  Product(
    id: 4,
    title: "Regular Fit V-Neck",
    category: "Mens T-Shirts",
    price: 1290,
    image: "assets/images/Tshirt3.png",
  ),
  Product(
    id: 5,
    title: "Converse High Top",
    category: "UniSex Shoes",
    price: 1000,
    image: "assets/images/Shoes.jpg",
  ),
  Product(
    id: 6,
    title: "Air Force 1 High",
    category: "UniSex Shoes",
    price: 800,
    image: "assets/images/Shoes1.jpg",
  ),
  Product(
    id: 7,
    title: "Air Force 1 Shadow",
    category: "UniSex Shoes",
    price: 1300,
    image: "assets/images/Shoes2.jpg",
  ),
  Product(
    id: 8,
    title: "Air Force 1 Red",
    category: "UniSex Shoes",
    price: 2000,
    image: "assets/images/Shoes3.jpg",
  ),
  Product(
    id: 9,
    title: "Hoodies",
    category: "UniSex Hoodies",
    price: 2000,
    image: "assets/images/Hoodie.png",
  ),
  Product(
    id: 10,
    title: "Hoodies",
    category: "UniSex Hoodies",
    price: 2000,
    image: "assets/images/Hoodie1.png",
  ),
  Product(
    id: 11,
    title: "Hoodies",
    category: "UniSex Hoodies",
    price: 2000,
    image: "assets/images/Hoodie2.png",
  ),
  Product(
    id: 12,
    title: "Hoodies",
    category: "UniSex Hoodies",
    price: 2000,
    image: "assets/images/Hoodie3.png",
  ),
];

/* 
class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      thumbnail: json['thumbnail'],
    );
  }
}
*/
