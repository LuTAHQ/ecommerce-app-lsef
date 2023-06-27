import 'package:fakestore_app/controller/api_service.dart';
import 'package:fakestore_app/views/cart_screen.dart';
import 'package:fakestore_app/views/favorites_screen.dart';
import 'package:fakestore_app/views/login_screen.dart';
import 'package:fakestore_app/views/main_screen.dart';
import 'package:fakestore_app/views/profile_screen.dart';
import 'package:fakestore_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsProvider>(
      create: (BuildContext context) {
        return ProductsProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MainPage(title: 'Fakestore App'),
        initialRoute: '/',
        routes: {
          "/": (context) => const SplashScreen(),
          "/login": (context) => const LoginScreen(),
          "/main": (context) => const MainScreen(),
          "/favorites": (context) => const FavoritesScreen(),
          "/carts": (context) => const CartScreen(),
          "/profile": (context) => const ProfileScreen(),
          "/appLayout": (context) => const AppLayout(),
        },
      ),
    );
  }
}
