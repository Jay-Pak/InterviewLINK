import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:interview_link/pages/6_resume/resumePage.dart';

class resumeOpenPage extends StatefulWidget {
  final int? selectNum;
  final String? selecttitle;
  resumeOpenPage({Key? key,required this.selectNum, this.selecttitle}) : super(key: key);
  @override
  State<resumeOpenPage> createState() => _resumeOpenPageState();

}


class _resumeOpenPageState extends State<resumeOpenPage> {

  int? getNumber;
  int _currentIndex = 0;
  String? getTitle;
  void initState() {
    super.initState();
    getNumber = widget.selectNum;
    print(widget.selecttitle);
    getTitle = widget.selecttitle;
  }

  CollectionReference resume = FirebaseFirestore.instance.collection('Resume');
  TextEditingController resumeTitleController = TextEditingController();
  List<TextEditingController> questionController = [
    for (int i = 0; i < 10; i++) TextEditingController()
  ];
  List<TextEditingController> contentController = [
    for (int i = 0; i < 10; i++) TextEditingController()
  ];
  TextEditingController getnumberController = TextEditingController();


  CollectionReference user = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser?.email}');
  CollectionReference Resumelist = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser?.email}')
      .doc('Resume')
      .collection('Resumelist');

  Future<void> _Update() {
    return user
        .doc('Resume')
        .collection('Resumelist')
        .doc('${resumeTitleController.text}')
        .set({
      'title': resumeTitleController.text,
      for (int i = 0; i < getNumber!; i++) 'question$i': questionController[i].text,
      for (int i = 0; i < getNumber!; i++) 'content$i': contentController[i].text,
      'listnum' : getNumber
    });
  }


  @override
  Widget build(BuildContext context)

  {
  final List getnumberlist = List.generate(getNumber!, (index) => index +1);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new),
        //   onPressed: () {},
        // ),
        title: const Text("이력서 쓰기"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {
              _Update();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey.shade300,
            height: 30,
            width: 320,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              // initialValue: "$getTitle",
              controller: resumeTitleController,
              decoration: const InputDecoration(
                hintText: "이력서 제목을 입력해주세요.",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  _currentIndex = index;
                  setState(() {});
                },
                height: 600.0,
                viewportFraction: 0.9,
                enableInfiniteScroll: false),
            items: getnumberlist.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Colors.grey.shade300,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 320,
                              color: Colors.grey.shade300,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: TextField(
                                controller: questionController[i - 1],
                                decoration: InputDecoration(
                                  hintText: "항목 $i : 자소서 $i 질문을 입력해주세요.",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        DotsIndicator(
                          dotsCount: getNumber!,
                          // dotsCount: int.parse(listnumController.text),
                          position: _currentIndex.toDouble(),
                          decorator: DotsDecorator(
                            spacing: const EdgeInsets.all(10.0),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 300,
                              width: 320,
                              color: Colors.grey.shade300,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: TextField(
                                maxLines: 100,
                                controller: contentController[i - 1],
                                decoration: const InputDecoration(
                                  hintText: "내용을 입력해주세요.",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
