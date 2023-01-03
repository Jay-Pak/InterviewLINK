abstract class SocialLogin{
  Future<bool> login();

  Future<bool> logout();
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