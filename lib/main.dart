import 'package:flutter/material.dart';
import 'package:productmvvm/core/viewmodels/categoryvm.dart';
import 'package:productmvvm/core/viewmodels/productsvm.dart';
import 'package:productmvvm/core/views/screens/home_screen.dart';
import 'package:productmvvm/helpers/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsVM>(create: (context) => ProductsVM()..getProductsFromServer()),
        ChangeNotifierProvider<CategoriesVM>(create: (context) => CategoriesVM()..getProductsFromServer()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoutes,
        initialRoute: "/home_view",
      ),
    );
  }
}

