import 'package:flutter/material.dart';
import 'package:productmvvm/core/models/product.dart';
import 'package:productmvvm/core/viewmodels/categoryvm.dart';
import 'package:productmvvm/core/viewmodels/productsvm.dart';
import 'package:productmvvm/helpers/route_generator.dart';
import 'package:provider/provider.dart';

import '../widgets/app_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(),
      appBar: AppBar(
        actions: [
           Padding(
             padding: const EdgeInsets.all(17),
             child: InkWell(
               onTap: (){
                 Navigator.pushNamed(context, '/cart_view');
               },
               child: Badge(
                 label: Consumer<ProductsVM>(
                   builder: (context, pvm, child){
                     return Text('${pvm.totalInCart}');
                   },
                 ),
                child: Icon(Icons.shopping_cart),
                         ),
             ),
           )
        ],
      ),
      body: Column(
        children: [
          Consumer<CategoriesVM>(
            builder: (context, pCates, child){
              if(pCates.allCategories.isEmpty) {
                return Center(
                  child:CircularProgressIndicator(),
                );
              }
              return SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pCates.allCategories.length,
                  itemBuilder: (ctx, index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 6,),
                      child: Container(
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.red.shade900,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            '${pCates.allCategories[index].name}',
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                            color: Colors.white,
                          ),),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Expanded(
            child: Consumer<ProductsVM>(
              builder: (context, product, child){
                if(product.allProducts.isEmpty)
                  return Center(child: Text('Loading...'),);
                return SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                    itemCount: product.allProducts.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.all(10),
                        height: 380,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(10),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Image.network(product.allProducts[index].thumbnail),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30, left: 15),
                                child: Text(
                                    product.allProducts[index].title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4, left: 15),
                                child: Text(
                                  product.allProducts[index].category,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 17),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Text(
                                        '\$${product.allProducts[index].price}', style: TextStyle(color: Colors.red.shade900, fontSize: 15, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: (){
                                          product.toggleFavorite(product.allProducts[index]);
                                          product.checkFavorites(product.allProducts[index]);
                                        },
                                        child: Selector<ProductsVM, bool>(
                                          selector: (context, product) => product.allProducts[index].isFavorite,
                                            builder: (context, value, child){
                                              return value ? Icon(Icons.favorite, color: Colors.red.shade900,): Icon(Icons.favorite_border_sharp, color: Colors.red.shade900,);
                                            },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: (){
                                          product.addTOCart(product.allProducts[index]);
                                        },
                                        child: Icon(Icons.add_shopping_cart, color: Colors.red.shade900,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
