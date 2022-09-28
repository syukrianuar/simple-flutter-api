import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/book.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  TextEditingController controller = TextEditingController();
  List<Book> books = allBooks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TextField(
          controller: controller,
          onChanged: searchBook,
          decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: books.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(books[index].title.toString()),
                  );
                })))
      ],
    )));
  }

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookCategory = book.category.toLowerCase();
      final input = query.toLowerCase();

      return bookCategory.contains(input);
    }).toList();

    setState(() {
      books = suggestions;
    });
  }
}
