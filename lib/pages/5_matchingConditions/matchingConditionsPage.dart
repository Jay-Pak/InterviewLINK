import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interview_link/pages/4_mainPage/mainPage.dart';

class MatchingConditionsPage extends StatefulWidget {
  const MatchingConditionsPage({Key? key}) : super(key: key);

  @override
  State<MatchingConditionsPage> createState() => _MatchingConditionsPageState();
}

class _MatchingConditionsPageState extends State<MatchingConditionsPage> {
  TextEditingController companyController = TextEditingController();
  TextEditingController fieldController = TextEditingController();
  TextEditingController resumeController = TextEditingController();

  @override
  void initState() {
    companyController = TextEditingController();
    fieldController = TextEditingController();
    resumeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    companyController.dispose();
    fieldController.dispose();
    resumeController.dispose();
    super.dispose();
  }



  Future<void> _UpdateUser() async {
    return FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser?.email}').doc('MatchingConditions').set({
      'company': companyController.text,
      'field': fieldController.text,
      'resumeController': resumeController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text("나의 지원 정보"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {
              _UpdateUser();
              Navigator.pop(context);
            },
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
    );
  }
}
