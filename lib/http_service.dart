import 'dart:convert';
import 'package:http/http.dart';

import 'item_model.dart';

class HttpService {
  final String url =
      "https://anbo-restresale.azurewebsites.net/api/ResaleItems";

  Future<void> deleteItem(int id) async {
    Response res = await delete(Uri.parse(
        "https://anbo-restresale.azurewebsites.net/api/ResaleItems/$id"));

    if (res.statusCode == 200) {
      print('Deleted');
    }
  }

  Future<List<Item>> getItems() async {
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Item> items =
          body.map((dynamic item) => Item.fromJson(item)).toList();
      return items;
    } else {
      throw "Cant get items";
    }
    
  }
}
