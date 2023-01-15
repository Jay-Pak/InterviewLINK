import 'package:flutter/material.dart';
import 'package:interview_link/main.dart';

class GetBottomNavi extends StatefulWidget {
  const GetBottomNavi({Key? key}) : super(key: key);

  @override
  State<GetBottomNavi> createState() => _GetBottomNaviState();
}

class _GetBottomNaviState extends State<GetBottomNavi> {
  @override
  Widget build(BuildContext context) {
    return buildBottomNavigationBar();
  }

  BottomNavigationBar buildBottomNavigationBar() {
    MyAppState? myApp = context.findAncestorStateOfType();
    return BottomNavigationBar(
      selectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
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
      currentIndex: globalVariable.currentIndex,
      onTap: (idx) {
        myApp!.setState(() {
          globalVariable.currentIndex = idx;
        });
      },
    );
  }
}