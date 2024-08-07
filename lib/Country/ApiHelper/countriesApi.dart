import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CountryApi{
  static CountryApi countryApi = CountryApi._();

  CountryApi._();

  Future fetchData() async {
    Uri url = Uri.parse('https://restcountries.com/v3.1/all');

    Response response = await http.get(url);

    if(response.statusCode == 200){
      final jsonData = response.body;
      final data = jsonDecode(jsonData);
      return data;
    }
    else{
      return {};
    }
  }
}