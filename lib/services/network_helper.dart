import 'dart:convert';
import 'dart:convert' as converter;
import 'dart:core';

import 'package:http/http.dart' as http;

class NetworkHelper {
//  String limit = '5';
//  String page = '0';

  final String apiUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<dynamic> getLibraryData(String requestType, String query, String limit,
      String page, String sortType) async {
    // requestType can be title , author or publisher
    String encodedQuery = Uri.encodeComponent(
        query); //Encode the query acc to https://www.w3schools.com/tags/ref_urlencode.asp
//    print('EncodedQuery : $encodedQuery');
    String url =
        '$apiUrl?q=$requestType&maxResults=$limit&startIndex=$page&sort=$sortType';
    // '$apiUrl$requestType=$encodedQuery&limit=$limit&page=$page&sort=$sortType';
    print(url);
    http.Response response = await http.get(url);
//    print(response);
    if (response.statusCode == 200) {
      var res = response.body.toString();
      print(res);
      var json = converter.jsonDecode(res);
      print(json);
//      var data = BooksApiModel.fromJson(json);
//      print("----------------Data-------------------");
//      print(data);
//
//      var books = data.items;
      print("-----------------Books------------------");
      print(json);
      return json;
    } else {
//      print(response.statusCode);
    }
  }

  Future<dynamic> getGBooksData(String query) async {
    String encodedQuery = Uri.encodeComponent(query);
    String url = 'https://www.googleapis.com/books/v1/volumes?q=$encodedQuery';
    // String url = 'https://www.googleapis.com/books/v1/volumes?q=title';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body.toString();
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
//      print(response.statusCode);
    }
  }
}
