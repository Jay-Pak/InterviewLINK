import 'package:flutter/material.dart';
import 'package:interview_link/pages/2_loginPage/loginPage.dart';
import 'package:interview_link/pages/2_loginPage/google_setting.dart';

class myinformation extends StatefulWidget {
  const myinformation({Key? key}) : super(key: key);

  @override
  State<myinformation> createState() => _myinformation();
}

class _myinformation extends State<myinformation> {
  int _current_index = 0;
  bool _isSigningOut = false;


  //Logout 버튼 누를 시, 기존 카카오/구글 로그인 페이지로 이동
  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내 정보"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                ),
                ListTile(
                  title: Transform.translate(
                    offset: Offset(10, 15),
                    child: Text(
                      '테라이님',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Transform.translate(
                    offset: Offset(0, 15),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey),
            )),
            height: 200,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.notifications),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.navigate_next),
                  ),
                  title: Text('공지사항'),
                  /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
                ),
                ListTile(
                  leading: Icon(Icons.question_answer),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.navigate_next),
                  ),
                  title: Text('자주 물어보는 질문'),
                  /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.navigate_next),
                  ),
                  title: Text('리뷰 남기'),
                  /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
                ),
                ListTile(
                  leading: Icon(Icons.content_copy),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.navigate_next),
                  ),
                  title: Text('서비스 이용약관'),
                  /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
                ),
                ListTile(
                  leading: Icon(Icons.content_copy),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.navigate_next),
                  ),
                  title: Text('개인정보처리방침'),
                  /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
                ),
                ListTile(
                  leading: Icon(Icons.contact_support),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.navigate_next),
                  ),
                  title: Text('문의하기'),
                  /*Transform.translate(
                      offset: Offset(-20, -2), child: Text('문의하기')),*/
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.navigate_next),
                  ),
                  title: Text('로그아웃'),
                  onTap: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await google_setting.signOut(context: context);
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context)
                        .pushReplacement(_routeToSignInScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: _current_index,
        onTap: (idx) {
          setState(() {
            _current_index = idx;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '매칭',
            icon: Icon(
              Icons.find_replace,
            ),
          ),
          BottomNavigationBarItem(
            label: '이력서',
            icon: Icon(
              Icons.description,
            ),
          ),
          BottomNavigationBarItem(
            label: '면접 기록',
            icon: Icon(
              Icons.video_file,
            ),
          ),
          BottomNavigationBarItem(
            label: '내 정보',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
