import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample/modules/login/model/login_object.dart';

class LoginObjectApi {
  static Future<LoginObject> getObjectLogin() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'))
          .timeout(const Duration(milliseconds: 200), onTimeout: () {
        throw TimeoutException("timeout");
      });

      return loginObjectFromJson(response.body);
    } catch (error) {
      print('getObjectLogin $error');
      return Future.error(true);
    }
  }
}
