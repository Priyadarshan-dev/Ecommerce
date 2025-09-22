import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();

  // Fetch all products
  Future<List<dynamic>> getAllProducts() async {
    final response = await _dio.get('https://fakestoreapi.com/products');
    return response.data;
  }
}
