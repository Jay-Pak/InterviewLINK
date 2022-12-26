import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 7),
                  height: 24,
                  width: 24,
                  child: const Image(
                    image: AssetImage("assets/images/kakaologo.png"),
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
          onTap: () {},
        ),
        const SizedBox(height: 10,),
        InkWell(
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
          onTap: () {},
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
