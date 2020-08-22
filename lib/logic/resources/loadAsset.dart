import 'package:Sports_DB/logic/resources/store_url.dart';
import 'package:http/http.dart' as http;

class LoadAsset{
  Future<String> loadAsset(String url) async {
    var response = await http.get(Uri.encodeFull(StoreURL().baseURL+url),
        headers: {"Accept": "application/json"});
    return response.body;
  }
}