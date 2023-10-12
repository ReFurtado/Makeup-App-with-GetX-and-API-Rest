// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:makeup_app/data/model/product_model.dart';
import 'package:makeup_app/data/repository/product_repository.dart';
import 'package:http/http.dart' as http;

class HttpRepository implements IProductRepository {
  @override
  Future<List<ProductModel>> getProduct() async {
    final Uri url = Uri.parse(
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    final response = await http.get(url); //Soliciração HTTP realizada
    final List<dynamic> responseMap = jsonDecode(response.body); //Decodificação do JSON em um Map    
    return responseMap.map<ProductModel>((resp) => 
      ProductModel.fromMap(resp)).toList(); //Dados da resposta são mapeados e retornados como uma lista
  }
}