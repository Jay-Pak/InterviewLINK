import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

// enum LoginPlatform {
//   kakao,
//   google,
//   none,
// }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // LoginPlatform _loginPlatform = LoginPlatform.none;

  // void signInWithKakao() async {
  //   try {
  //     bool isInstalled = await isKakaoTalkInstalled();
  //
  //     OAuthToken token = isInstalled
  //         ? await UserApi.instance.loginWithKakaoTalk()
  //         : await UserApi.instance.loginWithKakaoAccount();
  //
  //     final url = Uri.https('kapi.kakao.com', '/v2/user/me');
  //
  //     final response = await http.get(
  //       url,
  //       headers: {
  //         HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
  //       },
  //     );
  //
  //     final profileInfo = json.decode(response.body);
  //     print(profileInfo.toString());
  //
  //     setState(() {
  //       _loginPlatform = LoginPlatform.kakao;
  //     });
  //   } catch (error) {
  //     print('카카오톡으로 로그인 실패 $error');
  //   }
  // }
  //
  // void signOut() async {
  //   switch (_loginPlatform) {
  //     case LoginPlatform.google:
  //       break;
  //     case LoginPlatform.kakao:
  //       // 추가
  //       await UserApi.instance.logout();
  //       break;
  //   }
  //
  //   setState(() {
  //     _loginPlatform = LoginPlatform.none;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 246,
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(18),
            child: const Image(
              image: AssetImage("assets/images/LINK_logo.png"),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 36,
            width: 140,
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            child: const Text(
              "면접LINK",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.Roboto,//font assets 등록 필요
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 188,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 320,
            height: 57,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(253, 220, 63, 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 5),
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 7),
                  height: 24,
                  width: 24,
                  child: const Image(
                    image: AssetImage(
                      "assets/images/kakaologo.png",
                    ),
                  ),
                ),
                const Text(
                  "Kakao로 로그인",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 320,
            height: 57,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                border: Border.all(width: 0.5, color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 5),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 7),
                  height: 12,
                  width: 12,
                  child: const Image(
                    image: AssetImage("assets/images/googlelogo.png"),
                  ),
                ),
                const Text(
                  "Google로 로그인",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 14),
          child: const Text(
            "문의 : pakjaeho4187@gmail.com",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]),
    );
  }
}
