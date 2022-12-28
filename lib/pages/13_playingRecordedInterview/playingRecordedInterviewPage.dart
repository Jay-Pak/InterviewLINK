import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class playingRecordedInterviewPage extends StatefulWidget {
  const playingRecordedInterviewPage({Key? key}) : super(key: key);

  @override
  State<playingRecordedInterviewPage> createState() =>
      _playingRecordedInterviewPageState();
}

class _playingRecordedInterviewPageState
    extends State<playingRecordedInterviewPage> {
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text("면접 기록 확인"),
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
                              height: 500,
                              width: 320,
                              color: Colors.grey.shade300,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: TextField(
                                maxLines: 50,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ProgressBar(
                progress: Duration(milliseconds: 1000),
                total: Duration(milliseconds: 5000),
                buffered: Duration(milliseconds: 2000),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  splashRadius: 16,
                  onPressed: () {},
                  icon: const Icon(Icons.replay_10_rounded),
                ),
                IconButton(
                  splashRadius: 16,
                  onPressed: () {},
                  icon: const Icon(Icons.play_circle),
                ),
                IconButton(
                  splashRadius: 16,
                  onPressed: () {},
                  icon: const Icon(Icons.forward_10_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
