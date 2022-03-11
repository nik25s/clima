import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.Url);
  final String Url;

  Future getData() async {
    var url = Uri.parse(Url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    } // if we use static code it tells wheather your server exist or not if it show under 200 then all is fine bt aboe 400 is not fine at all just like error 404  fuck yourself then
  }
}
