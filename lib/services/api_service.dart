import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // final baseUrl = 'https://jsonplaceholder.typicode.com';
  final baseUrl = 'https://dummyjson.com';

  Future fetchProducts() async {
    final endpointProducts = Uri.parse('$baseUrl/products');

    final response = await http.get(endpointProducts);

    // print(response.statusCode);
    // print(response.body);

    final bodyResponse = json.decode(response.body)['products'];
    print(bodyResponse);
    return bodyResponse;
  }

  Future fetchSingleProduct(String id) async {
    final endpointSingleProduct = Uri.parse('$baseUrl/products/$id');

    final response = await http.get(endpointSingleProduct);

    // print(response.statusCode);
    // print(response.body);

    final bodyResponse = json.decode(response.body);
    print(bodyResponse);
    return bodyResponse;
  }

  Future fetchCategories() async {
    final endpointCategories = Uri.parse('$baseUrl/products/categories');

    final response = await http.get(endpointCategories);

    // print(response.statusCode);
    // print(response.body);

    final bodyResponse = json.decode(response.body);
    print(response.statusCode);
    print(bodyResponse);
    return bodyResponse;
  }

  Future fetchSingleCategory(String categoryName) async {
    final endpointSingleCategory =
        Uri.parse('$baseUrl/products/category/$categoryName');

    final response = await http.get(endpointSingleCategory);

    // print(response.statusCode);
    // print(response.body);

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
