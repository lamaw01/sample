import 'package:get/get.dart';
import 'package:sample/modules/login/api/login_api.dart';
import 'package:sample/modules/login/model/login_model.dart';

class LoginController extends GetxController {
  RxList<LoginModel> loginModel = <LoginModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _callGetLogin();
  }

  void _callGetLogin() async {
    var result = await LoginApi.getLogin();
    loginModel.assignAll(result);
  }
}
