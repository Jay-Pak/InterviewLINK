import 'package:flutter/material.dart';


/*FAQ 내용은 따로 작성해서 입력하기
  Update시에 자주 물어보는 질문 개선하면서, 내용 변경하기
 11*/
 
class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  int _current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("자주 물어보는 질문"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
        ),
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



class Entry {
  Entry(this.title, [this.content = const <Entry>[]]);

  final String title;
  final List<Entry> content;
}

final List<Entry> data = <Entry>[
  // 1번 FAQ
  Entry(
    '왜 이딴걸 하나요?',
    <Entry>[
      Entry(
          "돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요"
          "22®돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 "),
    ],
  ),

  //2번 FAQ
  Entry(
    '괴롭나요',
    <Entry>[
      Entry(
          '정신나갈것같애정신나갈것같애 정신나갈것같애정신나갈것같애정신나갈것같애 정신나갈것같애정신나갈것같애정신나갈것같애 정신나갈것같애정신나갈것같애정신나갈것같애 정신나갈것같애'
          '정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애'
          '정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애정신나갈것같애'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.content.isEmpty)
      return ListTile(
          title: Text(
        root.title,
        style: TextStyle(fontSize: 16), //내용 꾸미기
      ));

    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        style: TextStyle(fontSize: 16), //제목 꾸미기
      ),
      leading: Icon(Icons.question_answer),
      children: root.content.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
