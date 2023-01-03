import 'package:flutter/material.dart';
import '../2_loginPage/kakao_login.dart';
import '../2_loginPage/mainViewModel.dart';


class MyInformation extends StatefulWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  State<MyInformation> createState() => _MyInformation();
}

class _MyInformation extends State<MyInformation> {
  mainViewModel viewModel = mainViewModel(kakaoLogin());

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
                    '테라이님',
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
                title: Text('공지사항'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
              ),
              ListTile(
                leading: const Icon(Icons.question_answer),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('자주 물어보는 질문'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('리뷰 남기'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('서비스 이용약관'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('개인정보처리방침'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
              ),
              ListTile(
                leading: const Icon(Icons.contact_support),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('문의하기'),
                /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                trailing: IconButton(
                  onPressed: () async {
                    await viewModel.logout();
                    setState(() {});
                  },
                  icon: const Icon(Icons.navigate_next),
                ),
                title: const Text('로그아웃'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}