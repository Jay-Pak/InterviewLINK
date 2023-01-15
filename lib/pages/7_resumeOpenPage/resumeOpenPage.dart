import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ResumeOpenPage extends StatefulWidget {
  ResumeOpenPage({Key? key}) : super(key: key);

  @override
  State<ResumeOpenPage> createState() => _ResumeOpenPageState();
}

class _ResumeOpenPageState extends State<ResumeOpenPage> {

  CarouselController controller = CarouselController();

  TextEditingController resumeTitleController = TextEditingController();
  List<TextEditingController> questionController = [for(int i = 0; i < 5; i++) TextEditingController()];
  List<TextEditingController> contentController = [for(int i = 0; i < 5; i++) TextEditingController()];

  DocumentReference<Map<String, dynamic>> _resume = FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser?.email}').doc('MatchingConditions');

  _updateResume(int index){
    for(int i = 0; i < index; i++){
      _resume.collection('ResumeList').doc(resumeTitleController.text).collection('Question#${i+1}').doc(questionController[i].text).set({
        // "title" : resumeTitleController.text,
        // "question" : questionController[i].text,
        "content" : contentController[i].text
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("이력서 쓰기"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {
              _updateResume(5);
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
            child: TextField(
              controller: resumeTitleController,
              decoration: const InputDecoration(
                hintText: "이력서 제목을 입력해주세요.",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),

                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(height: 600.0, viewportFraction: 0.9, enableInfiniteScroll: false),
            items: [1, 2, 3, 4, 5].map((i) {
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
                              width: 320,
                              color: Colors.grey.shade300,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4),
                              child: TextField(
                                maxLines: 5,
                                controller: questionController[i-1],
                                decoration: InputDecoration(
                                  hintText: "항목 $i : 자소서 $i 질문을 입력해주세요.",
                                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Container(
                              width: 320,
                              color: Colors.grey.shade300,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4),
                              child: TextField(
                                maxLines: 100,
                                controller: contentController[i-1],
                                decoration: const InputDecoration(
                                  hintText: "내용을 입력해주세요.",
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
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
