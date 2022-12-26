//임시용 함수입니다.

import 'package:flutter/material.dart';

class functions extends StatefulWidget {
  const functions({Key? key}) : super(key: key);

  @override
  State<functions> createState() => _functionsState();
}

class _functionsState extends State<functions> {

  Widget makeBottomNavi(){
    int _current_index = 0;

    return BottomNavigationBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();


  }
}

