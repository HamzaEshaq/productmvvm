import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:productmvvm/core/constants/api_routes.dart';
import 'package:productmvvm/core/models/category.dart' as p_cate;
import 'package:productmvvm/helpers/http_request.dart';


class CategoriesVM extends ChangeNotifier{
  HttpRequest request = HttpRequest.instance;
  List<p_cate.Category> allCategories = [];

  Future<void> getProductsFromServer()async {
    Response<dynamic> res = await request.get(url: APIRoutes.categories);
    List<dynamic> cats = res.data;
    allCategories = cats.map((item) => p_cate.Category.fromJson(item)).toList();
    notifyListeners();
  }
}