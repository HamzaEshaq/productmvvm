import 'package:flutter/material.dart';
import 'package:productmvvm/core/viewmodels/productsvm.dart';
import 'package:productmvvm/core/views/widgets/app_navigation_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(),
      appBar: AppBar(),
      body: Consumer<ProductsVM>(
          builder: (context, productInCart, child){
            return ListView.builder(
              itemCount: productInCart.cartItems.length,
              itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(productInCart.cartItems[index].thumbnail),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              Text(
                                productInCart.cartItems[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade900,
                                ),
                              ),
                              Text(
                                'Price: \$${productInCart.cartItems[index].price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 40,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  productInCart.minimizeTotalInCart(productInCart.cartItems[index]);
                                  productInCart.removeFromCart(productInCart.cartItems[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5,),
                                  child: Icon(Icons.delete, color: Colors.grey.shade400,),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5, bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          productInCart.minimizeCart(productInCart.cartItems[index]);
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey.shade200,
                                            ),
                                            height: 50,
                                            width: double.infinity,
                                            child: Icon(Icons.remove, color: Colors.black, size: 19,)
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(child: Text('${productInCart.cartItems[index].quantity}')),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          productInCart.addTOCart(productInCart.cartItems[index]);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.red.shade900,
                                          ),
                                            height: 50,
                                            width: double.infinity,
                                            child: Icon(Icons.add, color: Colors.white, size: 19,)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
