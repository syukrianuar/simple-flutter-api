import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../services/api_service.dart';
import '../product/single_product_screen.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  ProductsByCategoryScreen({Key? key, required this.categoryName})
      : super(key: key);
  String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
        ),
        body: FutureBuilder(
            future: ApiService().fetchSingleCategory(categoryName),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
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
                        leading: Text(snapshot.data[index]['id'].toString()),
                        title: Text(snapshot.data[index]['title']),
                        trailing: const Icon(Icons.navigate_next),
                      );
                    }));
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }));
  }
}
