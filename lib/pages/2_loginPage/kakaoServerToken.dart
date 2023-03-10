import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_link/data/firebase_auth_remote_data_source.dart';
import 'package:interview_link/pages/2_loginPage/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;


class KakaoServerToken {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final SocialLogin _socialLogin;
  bool isLogined = false;
  kakao.User? user;

  KakaoServerToken(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await kakao.UserApi.instance.me();

      final token = await _firebaseAuthDataSource.createCustomToken({
        'uid': user!.id.toString(),
        'displayName': user!.kakaoAccount!.profile!.nickname,
        'email': user!.kakaoAccount!.email!,
        'photoURL': user!.kakaoAccount!.profile!.profileImageUrl!,
      });

      await FirebaseAuth.instance.signInWithCustomToken(token);
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    await FirebaseAuth.instance.signOut();
    isLogined = false;
    user = null;
  }
}