import 'package:get/get.dart';
import 'package:sample/modules/login/api/login_api.dart';
import 'package:sample/modules/login/model/login_model.dart';

class LoginController extends GetxController {
  RxList<LoginModel> loginModel = <LoginModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    callGetLogin();
  }

  void callGetLogin() async {
    var result = await LoginApi.getLogin();
    loginModel.assignAll(result);
  }
}
