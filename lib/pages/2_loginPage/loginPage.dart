import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interview_link/pages/2_loginPage/mainViewModel.dart';
import 'package:interview_link/pages/2_loginPage/social_login.dart';
import 'google_setting.dart';
import '../14_myInformation/myInformation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  mainViewModel kakaoModel = mainViewModel(kakaoLogin());
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isSigningIn = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        /* Autnetication 파이어베이스 초기화 :
        예제에서는 FutureBuilder내에서, snapshot.connectionState == done 일때
        구글로그인 버튼을 만들었음

        FutureBuilder(
          future: Authentication.initializeFirebase(context: context),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error initializing Firebase');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('ready');
            }
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black,
              ),
            );
          },
        ),
         */

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
          onTap: () async {
            await kakaoModel.login();
            setState(() {});
          },
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
          onTap: () async {
            setState(() {
              _isSigningIn = true;
            });

            User? user =
            await google_setting.signInWithGoogle(context: context);

            setState(() {
              _isSigningIn = false;
            });

            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => myinformation(),
                  //로그인 완료후 넘어갈 페이지
                ),
              );
            }
          },

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
