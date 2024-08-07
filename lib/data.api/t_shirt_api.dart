import 'package:http/http.dart' as http;

class TshirtsApi {
  static Future getproduct() {
    final Uri url = Uri.parse("http://10.0.2.2:3000/products");
    return http.get(url);
  }
}
