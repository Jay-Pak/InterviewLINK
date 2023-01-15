import 'package:flutter/material.dart';
import 'package:interview_link/components/getBody.dart';
import 'package:interview_link/components/getBottomNavi.dart';
import 'package:interview_link/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GetBody(),
      bottomNavigationBar: GetBottomNavi(),
    );
  }

  AppBar? buildAppBar() {
    if (globalVariable.currentIndex == 0) {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        title: const Text("User 님"),
      );
    } else if (globalVariable.currentIndex == 1) {
      return AppBar(
        title: const Text("이력서"),
      );
    } else if (globalVariable.currentIndex == 2) {
      return AppBar(
        title: const Text("면접 기록"),
      );
    } else if (globalVariable.currentIndex == 3) {
      return AppBar(
        title: const Text("내 정보"),
      );
    }
  }
}