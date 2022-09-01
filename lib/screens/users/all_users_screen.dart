import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/api_service.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: ApiService().fetchUsers(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: Text(
                      snapshot.data[index]['id'].toString(),
                    ),
                    title: Text(snapshot.data[index]['name']),
                    subtitle: Text(snapshot.data[index]['email']),
                    
                  );
                }));
          } else {
            return Text("State: ${snapshot.connectionState}");
          }
        },
      )),
    );
  }
}
