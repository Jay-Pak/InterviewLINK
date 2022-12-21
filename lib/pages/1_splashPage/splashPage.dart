import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
            width: 260,
            height: 4,
            child: LinearProgressIndicator(
              color: Color.fromARGB(1000, 0, 0, 128),
            ),
          ),
        ],
      ),);
  }
}
