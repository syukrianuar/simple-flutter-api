import 'package:flutter/material.dart';
import 'package:simple_flutter_api/screens/product/all_products_screen.dart';
import 'package:simple_flutter_api/screens/users/all_users_screen.dart';

import '../services/api_service.dart';
import 'category/all_categories_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future futureFetchProducts = ApiService().fetchProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get API"),
      ),
      body: GridView.count(crossAxisCount: 2, crossAxisSpacing: 20, children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AllCategoriesScreen()));
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.pink),
            child: Center(
              child: Text("Categories"),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AllProductsScreen()));
          },
          child: Container(
              decoration: BoxDecoration(color: Colors.orange),
              child: Center(
                child: Text("Products"),
              )),
        ),
        GestureDetector(
          onTap: () {
            ApiService().fetchUsers();
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => AllUsersScreen()));
          },
          child: Container(
              decoration: BoxDecoration(color: Colors.orange),
              child: Center(
                child: Text("Users"),
              )),
        ),
        
      ]),
    );
  }
}
