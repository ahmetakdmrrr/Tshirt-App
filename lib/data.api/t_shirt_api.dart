import 'package:http/http.dart' as http;

class TshirtsApi {
  static Future getproduct() {
    return http.get("http://10.0.2.2:3000/products" as Uri);
  }
}
