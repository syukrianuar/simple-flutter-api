import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // final baseUrl = 'https://jsonplaceholder.typicode.com';
  
  //API endpoint/url 
  final baseUrl = 'https://dummyjson.com';

  //GET API of all products using Future class
  Future fetchProducts() async {
    //declare and initialize endpoint + route
    final endpointProducts = Uri.parse('$baseUrl/products');

    //declare and initialize get response with the declared endpoint
    final response = await http.get(endpointProducts);

    //convert JSON encoded string body into appropriate data type
    final bodyResponse = json.decode(response.body)['products'];

    print(bodyResponse);

    //ends the current function and return value with the decoded response data 
    return bodyResponse;
  }

  //GET API using Future class
  Future fetchSingleProduct(String id) async {
    final endpointSingleProduct = Uri.parse('$baseUrl/products/$id');

    final response = await http.get(endpointSingleProduct);

    final bodyResponse = json.decode(response.body);
    print(bodyResponse);
    return bodyResponse;
  }

  Future fetchCategories() async {
    final endpointCategories = Uri.parse('$baseUrl/products/categories');

    final response = await http.get(endpointCategories);


    final bodyResponse = json.decode(response.body);
    print(response.statusCode);
    print(bodyResponse);
    return bodyResponse;
  }

  Future fetchSingleCategory(String categoryName) async {
    final endpointSingleCategory =
        Uri.parse('$baseUrl/products/category/$categoryName');

    final response = await http.get(endpointSingleCategory);


    final bodyResponse = json.decode(response.body)['products'];
    print(response.statusCode);

    print(bodyResponse);
    return bodyResponse;
  }

  Future fetchUsers() async {
    final endpointUsers =
        Uri.parse('https://jsonplaceholder.typicode.com/users');

    final response = await http.get(endpointUsers);

    final bodyResponse = json.decode(response.body);
    print(response.statusCode);
    print(bodyResponse);
    return bodyResponse;
  }
}
