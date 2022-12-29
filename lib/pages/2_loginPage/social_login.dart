import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

abstract class socialLogin{
  Future<bool> login();

  Future<bool> logout();
}

class kakaoLogin implements socialLogin{
  @override
  Future<bool> login() async {
    try{
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (error) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (error) {
          return false;
        }
      }
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
//
// class googleLogin implements socialLogin{
//   @override
//   Future<bool> login() {
//     // TODO: implement login
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<bool> logout() {
//     // TODO: implement logout
//     throw UnimplementedError();
//   }
// }