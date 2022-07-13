import 'dart:async';
import 'package:api/crud/usable.dart';
import 'package:api/search/book.dart';
import 'package:api/search/eggapi.dart';
import 'package:api/search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:api/search/egg.dart';

class eggPage extends StatefulWidget {
  const eggPage({Key? key}) : super(key: key);

  @override
  State<eggPage> createState() => _eggPageState();
}

class _eggPageState extends State<eggPage> {
  List<Pay> pays = [];
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
    PayApi.getPay(query);

    setState(() => this.pays = pays);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ap("Searh Trial"),
      body: Column(children: [
        buildSearch(),
        Expanded(child: ListView.builder(
            itemCount: pays.length,
            itemBuilder: (context, index) {
              final pay = pays[index];
              return UX(pay);
                //buildPay(pay);
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
    final pays = await PayApi.getPay(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.pays = pays;
    });
  });
  Widget buildPay(Pay pay) => ListTile(
    title: Text(pay.name),
    subtitle: Text(pay.cid),
  );

  Widget UX(Pay U)=>Card(
    color: Colors.blueAccent,
  elevation: 5,
  shape: RoundedRectangleBorder(
  side: BorderSide(color: Colors.white70, width: 1),
  borderRadius: BorderRadius.only(
  topLeft: Radius.circular(23),
  topRight: Radius.circular(23)),

  ),
    child: ListTile(
      leading: CircleAvatar(child: Text(U.name.toString().substring(0,1)),),
      title: Text(U.name),
      subtitle: Text(U.cid),
      trailing: Text(U.status),
    ),
  );
}
