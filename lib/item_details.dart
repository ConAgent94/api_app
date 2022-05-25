import 'package:flutter/material.dart';


import 'http_service.dart';
import 'item_model.dart';

class ItemDetail extends StatelessWidget {
  final Item item;
  final HttpService httpService = HttpService();

  ItemDetail({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () async {
          httpService.deleteItem(item.id);
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text('ID'),
                subtitle: Text('${item.id}'),
              ),
              ListTile(
                title: Text('Title'),
                subtitle: Text(item.title),
              ),
              ListTile(
                title: Text('Description'),
                subtitle: Text(item.description),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
