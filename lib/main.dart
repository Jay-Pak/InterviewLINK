import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_link/pages/15_FAQ/FAQ.dart';
import 'package:interview_link/pages/3_personalInformationPage/personalInfoData.dart';
import 'pages/1_splashPage/splashPage.dart';
import 'pages/2_loginPage/loginPage.dart';
import 'pages/3_personalInformationPage/personalInformationPage.dart';
import 'components/link_color.dart';
import 'pages/4_mainPage/mainPage.dart';

/*onPressd 기능 입력
TextFormDataController 추가, email로 연동 필요
bottomNavigationBar 추가
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: linkColors,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      home: FAQ(),
    );
  }
}

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
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
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.content = const <Entry>[]]);

  final String title;
  final List<Entry> content;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    '왜 이딴걸 하나요?',
    <Entry>[
      Entry(
          "돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요"
          "22®돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 돈 벌라고요 "),
    ],
  ),
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

// Displays one Entry. If the entry has content then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.content.isEmpty)
      return ListTile(
          title: Text(
        root.title,
        style: TextStyle(fontSize: 16),
      ));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        style: TextStyle(fontSize: 16),
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
