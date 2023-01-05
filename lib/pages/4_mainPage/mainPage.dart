import 'package:flutter/material.dart';
import 'package:interview_link/pages/12_interviewHistory/interviewHistory.dart';
import 'package:interview_link/pages/14_myInformation/myInformation.dart';
import 'package:interview_link/pages/6_resume/resumePage.dart';

import '../3_personalInformationPage/personalInformationPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
          title: const Text("User 님"),
        ),
        body: getBodyPage(),
        // getBodyPage(),
        bottomNavigationBar: buildBottomNavigationBar());
  }

  BottomNavigationBar buildBottomNavigationBar() {
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
      currentIndex: _currentIndex,
      onTap: (idx){
        setState(() {
          _currentIndex = idx;
        });
      },
    );
  }

  Widget getBodyPage(){
    if(_currentIndex == 0){
      return buildMainPage();
    }
    else if(_currentIndex == 1){
      return ResumePage();
    }
    else if(_currentIndex == 2){
      return InterviewHistoryPage();
    }else{
      return MyInformation();
    }
  }

  Widget buildMainPage() {
    int turnState = 0;
    return Builder(builder: (context) {
      return Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/student-g164a3e122_1920.jpg"),
                      fit: BoxFit.fill,
                      opacity: 0.4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        '면접 매칭을 시작합니다.',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      turnState == 0
                          ? const Text(
                              'User님은 현재 면접자 차례입니다.',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              'User님은 현재 면접관 차례입니다.',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                      const SizedBox(
                        height: 34,
                      ),
                      const Text(
                        '지원회사 : ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Text(
                        '지원직무 : ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Text(
                        '이력서 : ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      //  나의 지원 정보 class 필요함
                      const SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 26,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            //지원정보 미입력상태인 변수로 확인 후 버튼 활성화 or 비활성화
                            child: const Center(
                              child: Text(
                                '매칭하기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("assets/images/resume-g6d5e8b3a4_1920.jpg"),
                    fit: BoxFit.fill,
                    opacity: 0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      '나의 지원 정보',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      '매칭을 위해 인적사항,',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      '지원회사, 지원직무, 이력서 등을 입력해주세요.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 26,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Center(
                            child: Text(
                              '입력하기',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
