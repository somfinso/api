import 'dart:async';
import 'package:api/crud/usable.dart';
import 'package:api/search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:api/search/books_api.dart';

import 'book.dart';

class FilterNetworkListPage extends StatefulWidget {
  const FilterNetworkListPage({Key? key}) : super(key: key);

  @override
  State<FilterNetworkListPage> createState() => _FilterNetworkListPageState();
}

class _FilterNetworkListPageState extends State<FilterNetworkListPage> {
  List<Book> books = [];
  String query = '';
  Timer? debouncer;

  @override
  void initSate() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await
    BookApi.getBook(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ap("Searh Trial"),
      body: Column(children: [
        buildSearch(),
        Expanded(child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return buildBook(book);
            }))
      ],),
    );

  }
  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Title or Author Name',
    onChanged: searchBook,
  );
  Future searchBook(String query) async => debounce(() async {
    final books = await BookApi.getBook(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.books = books;
    });
  });
  Widget buildBook(Book book) => ListTile(
    leading: Image.network(
      book.urlImage,
      fit: BoxFit.cover,
      width: 50,
      height: 50,
    ),
    title: Text(book.title),
    subtitle: Text(book.author),
  );
}
