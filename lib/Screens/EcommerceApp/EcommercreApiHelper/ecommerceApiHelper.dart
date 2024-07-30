import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
class EcommerceApiHelper{
  String api="https://dummyjson.com/recipes";
  Future<Map>fetchEcommerceData()
  async{
    Uri url = Uri.parse(api);
    Response response = await  http.get(url);
    if(response.statusCode==200){
      final json=response.body;
      final data= jsonDecode(json);
      return data;
    }
    else
      {
        return{};
      }
  }
}