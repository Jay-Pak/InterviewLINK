import 'package:flutter/material.dart';


class myinformation extends StatefulWidget {
  const myinformation({Key? key}) : super(key: key);

  @override
  State<myinformation> createState() => _myinformation();
}

class _myinformation extends State<myinformation> {
  int _current_index = 0;

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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
