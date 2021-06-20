import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample/modules/login/model/login_model.dart';

class LoginApi {
  static Future<List<LoginModel>> getLogin() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'))
          .timeout(const Duration(milliseconds: 2000), onTimeout: () {
        throw TimeoutException("timeout");
      });

      return loginModelFromJson(response.body);
    } catch (error) {
      print('getLogin $error');
      return Future.error(true);
    }
  }
}
