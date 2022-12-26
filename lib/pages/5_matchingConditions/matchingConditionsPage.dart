import 'package:flutter/material.dart';
import 'package:interview_link/pages/5_matchingConditions/matchingConditionsData.dart';

class matchingConditionsPage extends StatefulWidget {
  final matchingConditionsData matchingConditionData;

  const matchingConditionsPage({Key? key, required this.matchingConditionData})
      : super(key: key);

  @override
  State<matchingConditionsPage> createState() =>
      _matchingConditionsPageState();
}

class _matchingConditionsPageState extends State<matchingConditionsPage> {
  TextEditingController companyController = TextEditingController();
  TextEditingController fieldController = TextEditingController();
  TextEditingController resumeController = TextEditingController();

  int _current_index = 0;

  matchingConditionsData get matchingConditionsdata => widget.matchingConditionData;

  @override
  void initState() {
    companyController.text = matchingConditionsdata.company;
    fieldController.text = matchingConditionsdata.field;
    resumeController.text = matchingConditionsdata.resume;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text("나의 지원 정보"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    controller: companyController,
                    decoration: const InputDecoration(
                      hintText: "* 지원회사를 입력해주세요.",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: const Text(
                    "필수 입력 사항입니다.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    controller: fieldController,
                    decoration: const InputDecoration(
                      hintText: "* 지원직무를 입력해주세요.",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: const Text(
                    "필수 입력 사항입니다.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    controller: resumeController,
                    decoration: const InputDecoration(
                      hintText: "* 이력서를 선택/입력해주세요.",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: const Text(
                    "필수 입력 사항입니다.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
