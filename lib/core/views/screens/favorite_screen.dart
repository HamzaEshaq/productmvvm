import 'package:flutter/material.dart';
import 'package:productmvvm/core/viewmodels/productsvm.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    return Text('${pvm.totalInCart}');
                  },
                ),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: Consumer<ProductsVM>(
        builder: (context, product, child){
          return ListView.builder(
            itemCount: product.favorites.length,
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
                        child: Image.network(product.favorites[index].thumbnail),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, left: 15),
                        child: Text(
                          product.favorites[index].title,
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
                          product.favorites[index].category,
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
                                '\$${product.favorites[index].price}', style: TextStyle(color: Colors.red.shade900, fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: (){
                                  product.setIsFavoriteToFalse(product.favorites[index]);
                                  product.checkFavorites(product.favorites[index]);
                                },
                                child: Selector<ProductsVM, bool>(
                                  selector: (context, product) => product.favorites[index].isFavorite,
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
                                  product.addTOCart(product.favorites[index]);
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
          );
        },
      ),
    );
  }
}
