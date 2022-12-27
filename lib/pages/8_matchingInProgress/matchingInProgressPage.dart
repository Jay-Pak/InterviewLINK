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
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'User',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000080),
                          ),
                        ),
                        Text('님은 현재 '),
                        Text(
                          '면접자',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000080),
                          ),
                        ),
                        Text('차례입니다.')
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'User',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000080),
                          ),
                        ),
                        Text('님은 현재 '),
                        Text(
                          '면접관',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000080),
                          ),
                        ),
                        Text('차례입니다.')
                      ],
                    )),
          const SizedBox(
            height: 56,
          ),
          const CircleAvatar(
            radius: 160,
            child: Text('EX'),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: 320,
            height: 60,
            color: const Color(0xFF000080),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '적절한 상대를 찾고 있습니다.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '예상 대기 시간 03:00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
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
