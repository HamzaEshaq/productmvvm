import 'package:dio/dio.dart';
import 'package:productmvvm/core/constants/api_routes.dart';
import 'package:productmvvm/core/models/product.dart';
import '../../helpers/http_request.dart';
import 'package:flutter/foundation.dart';

class ProductsVM extends ChangeNotifier{
  HttpRequest request = HttpRequest.instance;
  List<Product> allProducts = [];
  int totalProducts = 0;
  Future<void> getProductsFromServer()async{
    Response<dynamic> res = await request.get(url: APIRoutes.products);
    List<dynamic> products = res.data['products'];
    allProducts = products.map((item) => Product.fromJson(item)).toList();
    notifyListeners();
  }
  addOne(){
    totalProducts++;
    notifyListeners();
  }
}