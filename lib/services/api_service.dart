import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

  //POST API of create a post using Future class
  Future createPost(
    // String id,
    String body,
    String userId,
  ) async {
    //decraled and initialize sharedpreferences localstorage with named "prefs"
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //initialized string token from sharedpreferences named "prefs"
    final headerToken = prefs.getString('token');

    //declare and initialize endpoint + route
    final endpointPost =
        Uri.parse('https://jsonplaceholder.typicode.com/posts');

    //declare and initialize the data body that will be send or post
    final objectBody = {
      // "title": id,
      "body": body, 'userId': userId
    };

    //Declare and initialize post response with :
    //1. Declared endpoint,
    //2. Headers (with the saved token),
    //3. Declared body
    final response = await http.post(
      endpointPost,
      headers: {
        'Authorization': 'Bearer $headerToken',
        'Accept': 'application/json',
      },
      body: objectBody,
    );

    //convert data type to JSON format
    final bodyResponse = json.encode(response.body);

    //ends the current function and return value with the encoded response data
    return bodyResponse;
  }

  //POST API of create a post using Future class
  Future userLogin(
    String email,
    String password,
  ) async {
    //decraled and initialize sharedpreferences localstorage with named "prefs"
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //initialized string token from sharedpreferences named "prefs"
    final headerToken = prefs.getString('_apiToken');

    //declare and initialize endpoint + route
    final endpointPost = Uri.parse('http://staging.medpal.my/api/v1/login');

    //declare and initialize the data body that will be send or post
    final objectBody = {
      "email": email,
      "password": password,
    };

    //Declare and initialize post response with :
    //1. Declared endpoint,
    //2. Headers (with the saved token),
    //3. Declared body
    final response = await http.post(
      endpointPost,
      headers: {
        'Authorization': 'Bearer $headerToken',
        'Accept': 'application/json',
      },
      body: objectBody,
    );

    //convert data type to JSON format
    final bodyResponse = json.decode(response.body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      prefs.setString('_apiToken', bodyResponse['token']['token']);
      print(headerToken);
    }

    //ends the current function and return value with the encoded response data
    return bodyResponse;
  }

  Future fetchCatFact() async {
    final url = Uri.parse('https://catfact.ninja/facts');

    final response = await http.get(url);

    final responseBody = json.decode(response.body)['data'];
    return responseBody;
  }
}
