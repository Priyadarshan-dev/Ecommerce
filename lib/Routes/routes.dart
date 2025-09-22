import 'package:ecommerce/Screens/cart_screen.dart';
import 'package:ecommerce/Screens/login_screen.dart';
import 'package:ecommerce/Screens/orders_screen.dart';
import 'package:ecommerce/Screens/splash_screen.dart';
import 'package:ecommerce/Widgets/bottom_bar.dart';
import 'package:go_router/go_router.dart';

final GoRouter approuter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(
      path: '/catalogscreen',
      builder: (context, state) => BottomNavBar(),
    ),
    // GoRoute(
    //   path: '/product/:id', // dynamic route for product details
    //   builder: (context, state) {
    //     final id = state.pathParameters['id']!;
    //     return ProductDetailScreen(productId: id);
    //   },
    // ),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    GoRoute(path: '/orders', builder: (context, state) => const OrdersScreen()),
  ],
);
