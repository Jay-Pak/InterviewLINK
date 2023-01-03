import 'package:flutter/material.dart';

class InterviewHistoryPage extends StatefulWidget {
  const InterviewHistoryPage({Key? key}) : super(key: key);

  @override
  State<InterviewHistoryPage> createState() => _InterviewHistoryPageState();
}

class _InterviewHistoryPageState extends State<InterviewHistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text(
                '1. 면접기록 1 - 2022/12/15 13:00',
                style: TextStyle(fontSize: 16),
              ),
              const Spacer(),
              IconButton(
                splashRadius: 16,
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
              ),
              IconButton(
                splashRadius: 16,
                onPressed: () {},
                icon: const Icon(Icons.delete_forever),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
