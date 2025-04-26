import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product-model.dart';
class ProductRepo{

  Future<List<Product>> fetchProducts() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200){
      List jsonData = jsonDecode(response.body);
      return jsonData.map((product) => Product.fromJson(product)).toList();
    } else{
      throw ('${response.reasonPhrase}');
    }
  }
}