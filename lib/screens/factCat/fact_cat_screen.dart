import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_flutter_api/services/api_service.dart';

class FactCatScreen extends StatefulWidget {
  const FactCatScreen({Key? key}) : super(key: key);

  @override
  State<FactCatScreen> createState() => _FactCatScreenState();
}

class _FactCatScreenState extends State<FactCatScreen> {
  late Future futureFactCat;
  @override
  void initState() {
    super.initState();
    futureFactCat = ApiService().fetchCatFact();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elfira"),
      ),
      body: FutureBuilder(
        future: futureFactCat,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['fact']),
                  );
                }));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
