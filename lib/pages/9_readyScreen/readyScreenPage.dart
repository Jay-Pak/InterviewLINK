import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:interview_link/components/link_color.dart';

class readyScreenPage extends StatelessWidget {
  readyScreenPage({Key? key}) : super(key: key);

  TextEditingController resumeTitleController = TextEditingController();
  List<TextEditingController> questionController = [
    for (int i = 0; i < 5; i++) TextEditingController()
  ];
  List<TextEditingController> contentController = [
    for (int i = 0; i < 5; i++) TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text("면접준비"),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              children: const [
                Icon(Icons.schedule),
                Text('10:00'),
              ],
            ),
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
            options: CarouselOptions(height: 600.0, viewportFraction: 0.9),
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
                              height: 30,
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
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Container(
                              height: 600,
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
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 56,
                width: 270,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('준비완료'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 56,
                width: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.warning),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
