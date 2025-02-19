import 'package:flutter/material.dart';
import 'package:productmvvm/core/viewmodels/productsvm.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5,),
                                child: Icon(Icons.delete, color: Colors.grey.shade300,),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5, bottom: 10),
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 20),
                                          child: Center(
                                            child: InkWell(
                                              child: Icon(Icons.minimize_rounded, color: Colors.black, size: 19,),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(child: Text('4')),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: InkWell(
                                            child: Icon(Icons.add, color: Colors.black, size: 19,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
