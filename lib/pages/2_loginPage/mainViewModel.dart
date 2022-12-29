import 'package:interview_link/pages/2_loginPage/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class mainViewModel {
  final socialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  mainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }

}