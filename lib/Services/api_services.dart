import 'package:flutter/services.dart'; 
import 'dart:convert'; 
import 'package:ecommerce/models/product_model.dart';

class ApiServices {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 1)); 

    final data = await rootBundle.loadString('assets/Products/products.json');
    final jsonList = json.decode(data) as List;

    return jsonList.map((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    final allProducts = await fetchProducts();
    if (category == 'all') return allProducts;
    return allProducts.where((p) => p.category == category).toList();
  }
}
/*
import 'package:dio/dio.dart';
import 'package:ecommerce/models/product_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('https://dummyjson.com/products');
      
      List<dynamic> productsList = response.data['products'];
      
      List<Product> products = productsList
          .map((json) => Product.fromJson(json))
          .toList();
          
      return products;
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
 */