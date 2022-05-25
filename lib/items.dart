import 'package:flutter/material.dart';
import './http_service.dart';
import './item_details.dart';
import 'item_model.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key}) : super(key: key);

  @override
  _ItemsPageState createState() => new _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final HttpService httpService = HttpService();

  @override
  void initState() {
    //getItems();
    setState(() {
      httpService.getItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: RefreshIndicator(
        onRefresh: httpService.getItems,
        child: FutureBuilder(
          future: httpService.getItems(),
          builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
            if (snapshot.hasData) {
              List<Item> items = snapshot.data;

              return ListView(
                children: items
                    .map((Item item) => ListTile(
                          title: Text(item.title),
                          subtitle: Text(
                            item.id.toString(),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ItemDetail(
                                item: item,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
