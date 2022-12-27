import 'package:flutter/material.dart';

class endInterviewPage extends StatefulWidget {
  endInterviewPage({Key? key}) : super(key: key);

  @override
  State<endInterviewPage> createState() => _endInterviewPageState();
}

class _endInterviewPageState extends State<endInterviewPage> {
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            SizedBox(
              width: 30,
            ),
            Text("피드백 작성"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: TextField(
          maxLines: 40,
          controller: feedbackController,
          decoration: const InputDecoration(
            hintText: "면접관 F/B을 입력해주세요.",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF000080))),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star_border, size: 50,),
              Icon(Icons.star_border, size: 50,),
              Icon(Icons.star_border, size: 50,),
              Icon(Icons.star_border, size: 50,),
              Icon(Icons.star_border, size: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
