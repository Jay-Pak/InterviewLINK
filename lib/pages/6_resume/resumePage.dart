import 'package:flutter/material.dart';
import 'package:interview_link/main.dart';
import 'package:interview_link/pages/7_resumeOpenPage/resumeOpenPage.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalVariable.currentIndex == 0
          ? AppBar(title: const Text("이력서"))
          : null,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Text(
                  '1. 삼성전자 반도체연구소 공정설계',
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_note),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => ResumeOpenPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
