import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        title: const Text("User 님"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/student-g164a3e122_1920.jpg"),
                      fit: BoxFit.fill,
                      opacity: 0.4),
                ),
                child: Text(''),
              )),
          Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/resume-g6d5e8b3a4_1920.jpg"),
                      fit: BoxFit.fill,
                      opacity: 0.4),
                ),
                child: Text('data'),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _onCurrentPage(0);
              },
              icon: _current_index == 0
                  ? const Icon(
                      Icons.find_replace,
                      color: Color(0xFF000080),
                    )
                  : const Icon(Icons.find_replace),
            ),
            IconButton(
              onPressed: () {
                _onCurrentPage(1);
              },
              icon: _current_index == 1
                  ? const Icon(
                      Icons.description,
                      color: Color(0xFF000080),
                    )
                  : const Icon(Icons.description),
            ),
            IconButton(
              onPressed: () {
                _onCurrentPage(2);
              },
              icon: _current_index == 2
                  ? const Icon(
                      Icons.video_file,
                      color: Color(0xFF000080),
                    )
                  : const Icon(Icons.video_file),
            ),
            IconButton(
              onPressed: () {
                _onCurrentPage(3);
              },
              icon: _current_index == 3
                  ? const Icon(
                      Icons.person,
                      color: Color(0xFF000080),
                    )
                  : const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }

  void _onCurrentPage(int pageIndex) {
    setState(() {
      _current_index = pageIndex;
    });
  }
}
