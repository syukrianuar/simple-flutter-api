import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/api_service.dart';

class SingleProductScreen extends StatelessWidget {
  SingleProductScreen({Key? key, required this.productId}) : super(key: key);
  String productId;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: ApiService().fetchSingleProduct(productId),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data['title']),
                  Text(snapshot.data['description']),
                  Text(snapshot.data['price'].toString()),
                ],
              ));
            } else {
              return Center(
                child: Text('State: ${snapshot.connectionState}'),
              );
            }
          },
        ),
      ),
    );
  }
}
