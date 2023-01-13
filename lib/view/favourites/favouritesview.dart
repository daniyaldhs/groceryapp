import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:groceryapp/widgets/product_listtile.dart';
import 'package:stacked/stacked.dart';

import 'favouritesview_model.dart';

class FavouritesView extends StatelessWidget {
  List<Map> favouritesProducts;
  FavouritesView({super.key, required this.favouritesProducts});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => FavouritesViewModel(),
        builder: ((context, model, child) => Scaffold(
              body: ListView.builder(
                itemCount: favouritesProducts.length,
                itemBuilder: (context, index) {
                  return ProductListtile(
                      title: favouritesProducts[index]["name"],
                      subTitle: favouritesProducts[index]["price"].toString(), leading: favouritesProducts[index]["images"],);
                },
              ),
            )));
  }
}
