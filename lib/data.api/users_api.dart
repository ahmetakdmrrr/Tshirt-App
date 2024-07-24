import 'package:http/http.dart' as http;

class UsersApi {
  static Future getUsers() {
    return http.get("http://10.0.2.2:3000/products" as Uri);
  }
}
