
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_flutter_api/screens/product/single_product_screen.dart';

import '../../services/api_service.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  Future? futureFetchProducts = ApiService().fetchProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //create builder based on latest
            FutureBuilder(
                future: futureFetchProducts,
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingleProductScreen(
                                          productId: snapshot.data[index]['id']
                                              .toString())));
                            },
                            leading:
                                Text(snapshot.data[index]['id'].toString()),
                            title: Text(snapshot.data[index]['title']),
                            trailing: const Icon(Icons.navigate_next),
                          );
                        }));
                  
                  } else {
                    return Text("State: ${snapshot.connectionState}");
                  }
                })),
            ElevatedButton(
                onPressed: () {
                  ApiService().fetchProducts();
                },
                child: const Text("GET API"))
          ],
        ),
      ),
    );
  }
}
