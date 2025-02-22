import 'package:dio/dio.dart';
import 'package:productmvvm/core/constants/api_routes.dart';
import 'package:productmvvm/core/models/product.dart';
import '../../helpers/http_request.dart';
import 'package:flutter/foundation.dart';

class ProductsVM extends ChangeNotifier {
  HttpRequest request = HttpRequest.instance;
  List<Product> allProducts = [];
  List<Product> cartItems = [];
  List<Product> favorites = [];
  int totalProducts = 0;
  int itemQuantity = 0;
  int totalInCart = 0;
  Future<void> getProductsFromServer() async {
    Response<dynamic> res = await request.get(url: APIRoutes.products);
    List<dynamic> products = res.data['products'];
    allProducts = products.map((item) => Product.fromJson(item)).toList();
    notifyListeners();
  }

  addTOCart(Product p) {
    if (cartItems.contains(p)) {
      p.quantity++;
      totalInCart++;
      notifyListeners();
    } else {
      cartItems.add(p);
      p.quantity++;
      totalInCart++;
      notifyListeners();
    }
  }

  removeFromCart(Product p) {
    p.quantity = 0;
    cartItems.remove(p);
    notifyListeners();
  }

  minimizeCart(Product p) {
    if (p.quantity > 1) {
      p.quantity--;
      totalInCart--;
    }
    notifyListeners();
  }

  minimizeTotalInCart(Product p) {
    totalInCart = totalInCart - p.quantity;
    notifyListeners();
  }

  toggleFavorite(Product p) {
    if (p.isFavorite) {
      p.isFavorite = false;
    } else {
      p.isFavorite = true;
    }
    notifyListeners();
  }

  setIsFavoriteToFalse(Product p){
    p.isFavorite = false;
  }

  checkFavorites(Product p) {
    if (favorites.contains(p)) {
      _removeFromFavorites(p);
      notifyListeners();
    } else {
      _addToFavorites(p);
      notifyListeners();
    }
  }

  _addToFavorites(Product p){
    favorites.add(p);
  }

  _removeFromFavorites(Product p){
    favorites.remove(p);
  }
  // addQuantity(int q){
  //   q++;
  //   notifyListeners();
  //   return q;
  // }
  // minimizeQuantity(int q){
  //   q--;
  //   return q;
  // }
}
