import 'package:flutter/material.dart';
import 'package:groceryapp/view/cart/cartview.dart';
import 'package:groceryapp/view/favourites/favouritesview.dart';
import 'package:groceryapp/view/home/home_viewmodel.dart';
import 'package:groceryapp/widgets/product_listtile.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: ((context, model, child) => Scaffold(
                persistentFooterButtons: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavouritesView(
                                    favouritesProducts:
                                        model.favouriteProducts)));
                      },
                      child: const Text("Favorite")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartView(
                                    cartProducts: model.cartProducts,
                                    totalAmount: model.totalAmount)));
                      },
                      child: const Text("Cart")),
                ],
                body: ListView.builder(
                  itemCount: model.products.length,
                  itemBuilder: (context, index) {
                    return ProductListtile(
                        title: model.products[index]["name"],
                        subTitle: model.products[index]["price"].toString(),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (model.products[index]["isCart"]) {
                                  model.products[index]["isCart"] = false;
                                  model.cartProducts
                                      .remove(model.products[index]);
                                  model.totalAmount -=
                                      model.products[index]["price"];
                                } else {
                                  model.products[index]["isCart"] = true;
                                  model.cartProducts.add(model.products[index]);
                                  model.totalAmount +=
                                      model.products[index]["price"];
                                }
                                model.notifyListeners();
                              },
                              icon: Icon(
                                model.products[index]["isCart"]
                                    ? Icons.close
                                    : Icons.add,
                                color: model.products[index]["isCart"]
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (model.products[index]["isFavorite"]) {
                                  model.products[index]["isFavorite"] = false;
                                  model.favouriteProducts
                                      .remove(model.products[index]);
                                } else {
                                  model.products[index]["isFavorite"] = true;
                                  model.favouriteProducts
                                      .add(model.products[index]);
                                }
                                model.notifyListeners();
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: model.products[index]["isFavorite"]
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                        leading: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      model.products[index]["images"]),
                                  fit: BoxFit.fill)),
                        ));
                  },
                ))));
  }
}
