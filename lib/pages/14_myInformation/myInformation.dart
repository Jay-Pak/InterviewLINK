import 'package:flutter/material.dart';
import '../2_loginPage/google_login.dart';
import '../2_loginPage/kakao_login.dart';
import '../2_loginPage/kakaoServerToken.dart';


class MyInformation extends StatefulWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  State<MyInformation> createState() => _MyInformation();
}

class _MyInformation extends State<MyInformation> {
  KakaoServerToken viewModel = KakaoServerToken(KakaoLogin());
  final GoogleLogin _googleSignIn = GoogleLogin();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              )),
          height: 200,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CircleAvatar(
                    radius: 50,
                  ),
                ),
              ),
              ListTile(
                title: Transform.translate(
                  offset: const Offset(10, 15),
                  child: const Text(
                    'νλΌμ΄λ',
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: Transform.translate(
                  offset: const Offset(0, 15),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.navigate_next),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.notifications),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: Text('κ³΅μ§μ¬ν­'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('λ¬ΈμνκΈ°')),*/
              ),
              ListTile(
                leading: const Icon(Icons.question_answer),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('μμ£Ό λ¬Όμ΄λ³΄λ μ§λ¬Έ'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('λ¬ΈμνκΈ°')),*/
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('λ¦¬λ·° λ¨κΈ°'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('λ¬ΈμνκΈ°')),*/
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('μλΉμ€ μ΄μ©μ½κ΄'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('λ¬ΈμνκΈ°')),*/
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('κ°μΈμ λ³΄μ²λ¦¬λ°©μΉ¨'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('λ¬ΈμνκΈ°')),*/
              ),
              ListTile(
                leading: const Icon(Icons.contact_support),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('λ¬ΈμνκΈ°'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('λ¬ΈμνκΈ°')),*/
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                trailing: IconButton(
                  onPressed: () async {
                    await viewModel.logout();
                    await _googleSignIn.signOut();
                    setState(() {});
                  },
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('λ‘κ·Έμμ'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}