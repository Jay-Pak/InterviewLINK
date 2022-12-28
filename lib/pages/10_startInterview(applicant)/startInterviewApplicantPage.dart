import 'package:flutter/material.dart';

class startInterviewApplicantPage extends StatefulWidget {
  const startInterviewApplicantPage({Key? key}) : super(key: key);

  @override
  State<startInterviewApplicantPage> createState() => _startInterviewApplicantPageState();
}

class _startInterviewApplicantPageState extends State<startInterviewApplicantPage> {
  @override
  Widget build(BuildContext context) {

    int _current_index = 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text("면접시작"),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Row(
              children: const [
                Icon(Icons.schedule),
                Text('10:00'),
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
            label: '캠 켜기',
            icon: Icon(
              Icons.camera_alt,
            ),
          ),
          BottomNavigationBarItem(
            label: '마이크',
            icon: Icon(
              Icons.mic,
            ),
          ),
          BottomNavigationBarItem(
            label: '화면전환',
            icon: Icon(
              Icons.flip_camera_ios_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: '부재 확인',
            icon: Icon(
              Icons.warning,
            ),
          ),
        ],
      ),
    );
  }
}
