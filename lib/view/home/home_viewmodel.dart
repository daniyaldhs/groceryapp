import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  num totalAmount = 0;

  List<Map> products = [
    {
      "name": "burger",
      "price": 200,
      "qty": 0,
      "isFavorite": false,
      "isCart": false,
      "images": "assets/images/bbq.jpg",
    },
    {
      "name": "biryani",
      "price": 922,
      "qty": 0,
      "isFavorite": false,
      "isCart": false,
      "images": "assets/images/biryani.jpg",
    },
    {
      "name": "karhai",
      "price": 500,
      "qty": 0,
      "isFavorite": false,
      "isCart": false,
      "images": "assets/images/bbq.jpg",
    },
    {
      "name": "delivery charges",
      "price": 500,
      "isFavorite": false,
      "isCart": false,
      "images": "assets/images/karhai.webp",
    }
  ];
  List<Map> favouriteProducts = [];
  List<Map> cartProducts = [];
  List<Map> imageProducts = [];
}
