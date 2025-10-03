import 'package:ecommerce/Screens/cart_screen.dart';
import 'package:ecommerce/Screens/intro_screen.dart';
import 'package:ecommerce/Screens/login_screen.dart';
import 'package:ecommerce/Screens/orders_screen.dart';
import 'package:ecommerce/Screens/profile_screen.dart';
import 'package:ecommerce/Screens/splash_screen.dart';
import 'package:ecommerce/Widgets/bottom_bar.dart';
import 'package:go_router/go_router.dart';

final GoRouter approuter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/introscreen',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/catalogscreen',
      builder: (context, state) => const BottomNavBar(),
    ),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    GoRoute(path: '/orders', builder: (context, state) => const OrdersScreen()),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
