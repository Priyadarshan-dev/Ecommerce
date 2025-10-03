import 'package:ecommerce/models/order_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];
  List<Order> _orders = [];

  List<Product> get cartItems => _cartItems;
  List<Order> get orders => _orders;

  // Initialize Hive
  Future<void> initHive() async {
    await Hive.openBox('cartBox');
    await Hive.openBox('ordersBox');
    _loadData();
  }

  // Load data from Hive
  void _loadData() {
    final cartBox = Hive.box('cartBox');
    final ordersBox = Hive.box('ordersBox');

    final cartData = cartBox.get('cart');
    final ordersData = ordersBox.get('orders');

    if (cartData != null) {
      _cartItems = List<Product>.from(cartData);
    }

    if (ordersData != null) {
      _orders = List<Order>.from(ordersData);
    }

    notifyListeners();
  }

  // Save data to Hive
  void _saveData() {
    final cartBox = Hive.box('cartBox');
    final ordersBox = Hive.box('ordersBox');

    cartBox.put('cart', _cartItems);
    ordersBox.put('orders', _orders);
  }


  void addToCart(Product product) {
    final newProduct = Product(
      id: product.id,
      title: product.title,
      category: product.category,
      price: product.price,
      image: product.image,
      description: product.description,
      quantity: product.quantity,
    );

    _cartItems.add(newProduct);
    notifyListeners();
    _saveData();
  }

  //Remove From Cart
  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
    _saveData();
  }

  //Increase Quantity
  void increaseQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
    _saveData();
  }

  //Decrease Quantity
  void decreaseQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
    _saveData();
  }

  //Total Price
  double getTotalPrice() {
    double total = 0;
    for (var product in _cartItems) {
      total += product.price * product.quantity;
    }
    return total;
  }

  //Shipping Fee
  double getShippingFee() {
    double total = getTotalPrice();
    if (total == 0) return 0;
    if (total > 2000) return 0;
    return 80;
  }

  //Shippingg+Order fee
  double getGrandTotal() {
    return getTotalPrice() + getShippingFee();
  }

  // Clear Cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
    _saveData();
  }

  //Place Order for Order screen
  void placeOrder() {
    if (_cartItems.isNotEmpty) {
      _orders.add(
        Order(
          items: List.from(_cartItems),
          total: getTotalPrice(),
          date: DateTime.now(),
          id: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      );
      clearCart();
      _saveData();
    }
  }
}
