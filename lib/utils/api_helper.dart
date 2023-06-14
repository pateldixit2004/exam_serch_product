import 'dart:convert';

import 'package:exam_serch_product/screen/model/pro_model.dart';
import 'package:exam_serch_product/screen/model/serchModel.dart';
import 'package:http/http.dart' as http;

class Api_Helper
{
  static Api_Helper api_helper =Api_Helper();

  Future<SerchModel> getApi()
  async {
    String link='https://real-time-product-search.p.rapidapi.com/search?q=Nike%20shoes&country=us&language=en';
    var responce=await http.get(Uri.parse(link),headers:{"X-RapidAPI-Key":"4e646f0728msh450e281692cd256p126822jsn348e75400e6c","X-RapidAPI-Host":"real-time-product-search.p.rapidapi.com"} );
    var json=jsonDecode(responce.body);
    SerchModel serchModel =SerchModel.fromJson(json);
    return serchModel;

  }
  Future<ProModel> api()
  async {
    String link='https://real-time-product-search.p.rapidapi.com/product-offers?product_id=11577822456427762145&country=us&language=en';
    var responce=await http.get(Uri.parse(link),headers:{"X-RapidAPI-Key":"4e646f0728msh450e281692cd256p126822jsn348e75400e6c","X-RapidAPI-Host":"real-time-product-search.p.rapidapi.com"} );
    var json=jsonDecode(responce.body);
    ProModel proModel =ProModel.fromJson(json);
    return proModel;

  }
}