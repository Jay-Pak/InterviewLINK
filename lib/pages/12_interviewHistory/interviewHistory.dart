import 'package:flutter/material.dart';

class interviewHistoryPage extends StatefulWidget {
  const interviewHistoryPage({Key? key}) : super(key: key);

  @override
  State<interviewHistoryPage> createState() => _interviewHistoryPageState();
}

class _interviewHistoryPageState extends State<interviewHistoryPage> {
  int _current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text("면접 기록"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  '1. 면접기록 1 - 2022/12/15 13:00',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                  splashRadius: 16,
                  onPressed: () {},
                  icon: Icon(Icons.edit_note),
                ),
                IconButton(
                  splashRadius: 16,
                  onPressed: () {},
                  icon: Icon(Icons.delete_forever),
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
