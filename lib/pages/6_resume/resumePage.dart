import 'package:flutter/material.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
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
          // color: Colors.green,
          height: 70,
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
    );
  }
}
