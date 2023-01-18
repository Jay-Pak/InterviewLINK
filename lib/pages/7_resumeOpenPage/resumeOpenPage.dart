import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResumeOpenPage extends StatefulWidget {
  ResumeOpenPage({Key? key}) : super(key: key);

  @override
  State<ResumeOpenPage> createState() => _ResumeOpenPageState();
}

class _ResumeOpenPageState extends State<ResumeOpenPage> {
  PageController pagecontroller =
      PageController(viewportFraction: 1, initialPage: 0);
  int idx = 5;
  int activeidx = 0;

  TextEditingController resumeTitleController = TextEditingController();

  // TextEditingController questionController = TextEditingController();
  // TextEditingController contentController = TextEditingController();

  List<TextEditingController> questionController = [
    for (int i = 0; i < 5; i++) TextEditingController()
  ];

  List<TextEditingController> contentController = [
    for (int i = 0; i < 5; i++) TextEditingController()
  ];

  DocumentReference<Map<String, dynamic>> _resume = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser?.email}')
      .doc('MatchingConditions');

  _updateResume(int index) {
    for (int i = 0; i < index; i++) {
      _resume
          .collection('ResumeList')
          .doc(resumeTitleController.text)
          .collection('Question#${i + 1}')
          .doc('12345')
          .set({
        "title": resumeTitleController.text,
        // "question" : questionController[i].text,
        // "content": contentController[i].text,
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
              // _updateResume(5);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 30,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 24),
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
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 142,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: PageView.builder(
                  itemCount: 5,
                  pageSnapping: true,
                  controller: pagecontroller,
                  onPageChanged: (page) {
                    setState(
                      () {
                        activeidx = page;
                      },
                    );
                  },
                  itemBuilder: (context, pagePosition) {
                    return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, idx) {
                        if (idx == 0) {
                          return TextField(
                            maxLines: 5,
                            controller: questionController[pagePosition],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              hintText:
                                  "항목 ${pagePosition + 1} : 자소서 ${pagePosition + 1} 질문을 입력해주세요.",
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          );
                        } else if (idx == 1) {
                          return DotsIndicator(
                            dotsCount: 5,
                            position: activeidx.toDouble(),
                          );
                        } else if (idx == 2) {
                          return TextField(
                            maxLines: 25,
                            controller: contentController[pagePosition],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              hintText: "내용을 입력해주세요",
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          );
                        }
                        return Text('error');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
