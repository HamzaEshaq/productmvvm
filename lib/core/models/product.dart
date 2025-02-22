class Product{
  late int id;
  int quantity = 0;
  late double price;
  late String title, description, category, thumbnail;
  bool isFavorite = false;

  Product.fromJson(Map<String, dynamic> item){
    id = item['id'];
    price = item['price'];
    title = item['title'];
    description = item['description'];
    category = item['category'];
    thumbnail = item['thumbnail'];
  }
}