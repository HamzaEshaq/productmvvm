import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:productmvvm/core/constants/api_routes.dart';
import 'package:productmvvm/core/models/category.dart' as pCats;
import 'package:productmvvm/helpers/http_request.dart';


class CategoriesVM extends ChangeNotifier{
  HttpRequest request = HttpRequest.instance;
  List<pCats.Category> allCategories = [];
  Future<void> getProductsFromServer()async {
    Response<dynamic> res = await request.get(url: APIRoutes.categories);
    List<dynamic> cats = res.data;
    allCategories = cats.map((item) => pCats.Category.fromJson(item)).toList();
    notifyListeners();
  }
}