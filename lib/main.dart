import 'package:flutter/material.dart';
import 'package:flutter_assesment/repository/product_repo.dart';
import 'package:flutter_assesment/screens/cart.dart';
import 'package:flutter_assesment/screens/home.dart';
import 'package:flutter_assesment/screens/login.dart';
import 'package:flutter_assesment/screens/product_list.dart';
import 'package:flutter_assesment/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white),
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => const LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/register': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
        '/pl': (context) {
          ProductRepository repo = ProductRepository();
          return ProductListScreen(
            repository: repo,
          );
        },
        '/cart': (context) => const CartScreen()
      },
    );
  }
}
