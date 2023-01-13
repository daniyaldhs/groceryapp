import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:groceryapp/widgets/product_listtile.dart';
import 'package:stacked/stacked.dart';

import 'CartView_model.dart';

class CartView extends StatelessWidget {
  List<Map> cartProducts;
  num totalAmount;
  CartView({super.key, required this.cartProducts, this.totalAmount = 0});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => CartViewModel(),
        builder: ((context, model, child) => Scaffold(
              persistentFooterButtons: [
                Text("Total Amount $totalAmount",
                    style: const TextStyle(fontSize: 35))
              ],
              body: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  return ProductListtile(
                    leading: cartProducts[index]["images"],
                    title: cartProducts[index]["name"],
                    subTitle: cartProducts[index]["price"].toString(),
                  );
                },
              ),
            )));
  }
}
