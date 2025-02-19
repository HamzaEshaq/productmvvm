import 'package:flutter/material.dart';
import 'package:productmvvm/core/views/screens/cart_screen.dart';
import 'package:productmvvm/core/views/screens/home_screen.dart';

class RouteGenerator{
  static Route<dynamic>? generateRoutes(RouteSettings settings){
    switch(settings.name){
      case '/home_view' :
        {
          return MaterialPageRoute(builder: (context) {
            return HomeScreen();
          });
        }
      case '/cart_view' :
        {
          return MaterialPageRoute(builder: (context) {
            return CartScreen();
          });
        }
      default : return null;
    }
  }
}