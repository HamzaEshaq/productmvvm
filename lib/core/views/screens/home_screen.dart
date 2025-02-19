import 'package:flutter/material.dart';
import 'package:productmvvm/core/models/product.dart';
import 'package:productmvvm/core/viewmodels/categoryvm.dart';
import 'package:productmvvm/core/viewmodels/productsvm.dart';
import 'package:productmvvm/helpers/route_generator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                     return Text('${pvm.cartItems.length}');
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
                          children: [
                            Image.network(product.allProducts[index].thumbnail),
                            ListTile(
                              leading: InkWell(
                                onTap: (){
                                  product.addTOCart(product.allProducts[index]);
                                  print('${product.cartItems.length}');
                                },
                                child: Icon(Icons.add_shopping_cart, color: Colors.red.shade900,),
                              ),
                              trailing: Text('${product.allProducts[index].price}', style: TextStyle(color: Colors.red.shade900),),
                              subtitle: Text(product.allProducts[index].category),
                              title: Text(product.allProducts[index].title),
                            ),
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
