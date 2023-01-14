import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interview_link/pages/2_loginPage/google_login.dart';
import 'package:interview_link/pages/2_loginPage/google_setting.dart';
import 'package:interview_link/pages/2_loginPage/kakao_login.dart' as kakao;
import 'package:interview_link/pages/2_loginPage/kakaoServerToken.dart';
import 'package:interview_link/pages/3_personalInformationPage/personalInformationPage.dart';

import '../14_myInformation/myInformation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  KakaoServerToken viewModel = KakaoServerToken(kakao.KakaoLogin());
  final GoogleLogin _googleSignIn = GoogleLogin();
  var list = [];

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
          onTap: () async {
            await viewModel.login();
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
          onTap: () {
            _googleSignIn.signInWithGoogle();
            setState(() {});
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
        ),
      ]),
    );
  }

  bool isExist(docID) {
    bool check = false;

    FirebaseFirestore.instance
        .collection('${FirebaseAuth.instance.currentUser!.email}')
        .doc(docID)
        .get()
        .then(
      (value) {
        if (value.exists == null) {
          check = false;
          print('check : ${check}');
        } else {
          check = true;
          print('check : ${check}');
        }
      },
    );
    return check;
  }
}
