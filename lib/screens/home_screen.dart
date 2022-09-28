import 'package:flutter/material.dart';
import 'package:simple_flutter_api/screens/factCat/fact_cat_screen.dart';
import 'package:simple_flutter_api/screens/filter/filter_page.dart';
import 'package:simple_flutter_api/screens/login/login_screen.dart';
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  Future futureFetchProducts = ApiService().fetchProducts();
  void initState() {
    _tabController;
    super.initState();
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                    labelColor: Colors.pink,
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'GET'),
                      Tab(
                        text: 'POST',
                      )
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AllCategoriesScreen()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllProductsScreen()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => AllUsersScreen()));
                          },
                          child: Container(
                              decoration: BoxDecoration(color: Colors.orange),
                              child: Center(
                                child: Text("Users"),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilterPage()));
                          },
                          child: Container(
                              decoration: BoxDecoration(color: Colors.pink),
                              child: Center(
                                child: Text("Filter"),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            ApiService().fetchUsers();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => FactCatScreen()));
                          },
                          child: Container(
                              decoration: BoxDecoration(color: Colors.pink),
                              child: Center(
                                child: Text("Fact Cat"),
                              )),
                        ),
                      ]),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text("Login"),
                  ))
                ]),
              ),
            ],
          ),
        ));
  }
}
