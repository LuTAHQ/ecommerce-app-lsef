import 'dart:io';

import 'package:fakestore_app/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/products_category.dart';

class ProductsProvider extends ChangeNotifier {
  final String baseUrl = "https://fakestoreapi.com";

  Future<void> login(LoginModel loginModel) async {
    final url = "$baseUrl/auth/login";

    final response = await http.post(Uri.parse(url), body: {
      "username": loginModel.username,
      "password": loginModel.password,
    });
    try {
      if (response.statusCode == 200) {
      } else {
        throw Exception("ERROR${response.statusCode}");
      }
    } on SocketException {
      throw const SocketException("Please check your internet");
    }
  }

  Future<List<ProductsCategory>> getProducts() async {
    final url = "$baseUrl/products";

    final response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final responseData = response.body;
        List<ProductsCategory> productsCategory =
            productsCategoryFromJson(responseData);
        print("Products response $responseData");
        notifyListeners();
        return productsCategory;
      } else {
        print("Error ${response.statusCode}");
        return [];
      }
    } on SocketException {
      throw const SocketException("Please check your internet");
    }
  }
}
