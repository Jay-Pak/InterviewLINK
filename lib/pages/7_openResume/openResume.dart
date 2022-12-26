import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class resumeOpenPage extends StatefulWidget {
  resumeOpenPage({Key? key}) : super(key: key);

  @override
  State<resumeOpenPage> createState() => _resumeOpenPageState();
}

class _resumeOpenPageState extends State<resumeOpenPage> {
  int _current_index = 0;

  TextEditingController resumeTitleController = TextEditingController();
  List<TextEditingController> questionController = [for(int i = 0; i < 5; i++) TextEditingController()];
  List<TextEditingController> contentController = [for(int i = 0; i < 5; i++) TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text("이력서 쓰기"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {},
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
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4),
                              child: TextField(
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
                              height: 600,
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
