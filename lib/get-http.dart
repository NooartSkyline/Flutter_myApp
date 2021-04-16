import 'package:http/http.dart' as http;
import 'model/model.dart';

class GetHttp {
  Model item;

  Future<Model> getHTTPData() async {
    var url = Uri.parse(
        "https://api.fastforex.io/fetch-all?api_key=869153d961-77e4671f94-qqz9wm");
    var response = await http.get(url);
    item = modelFromJson(response.body);
    // print(item);
    // print(item.base);
    // print(item.results);
    // print(response.statusCode);
    // print(response.body);
    return item;
  }
}
