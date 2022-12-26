import 'package:flutter/material.dart';

class matchingInProgressPage extends StatefulWidget {
  matchingInProgressPage({Key? key}) : super(key: key);

  @override
  State<matchingInProgressPage> createState() => _matchingInProgressPageState();
}

class _matchingInProgressPageState extends State<matchingInProgressPage> {
  int _current_index = 0;

  int turn_state = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text("매칭 중"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 44,
          ),
          Container(
            alignment: Alignment.center,
            child: turn_state == 0
                ? const Text(
                    'User님은 현재 면접자 차례입니다.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF000080),
                    ),
                  )
                : const Text(
                    'User님은 현재 면접관 차례입니다.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF000080),
                    ),
                  ),
          ),
          const SizedBox(
            height: 56,
          ),
          const CircleAvatar(
            radius: 160,
            child: Text('EX'),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: const Color(0xFF000080),
            child: Text('적절한 상대를 찾고 있습니다.', style: TextStyle(color: Colors.white),),
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
