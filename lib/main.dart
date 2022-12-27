import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_link/pages/3_personalInformationPage/personalInfoData.dart';
import 'package:interview_link/pages/5_matchingConditions/matchingConditionsData.dart';
import 'package:interview_link/pages/5_matchingConditions/matchingConditionsPage.dart';
import 'pages/10_startInterview/startInterviewPage.dart';
import 'pages/11_endInterview/endInterviewPage.dart';
import 'pages/12_interviewHistory/interviewHistory.dart';
import 'pages/1_splashPage/splashPage.dart';
import 'pages/2_loginPage/loginPage.dart';
import 'pages/3_personalInformationPage/personalInformationPage.dart';
import 'components/link_color.dart';
import 'pages/4_mainPage/mainPage.dart';
import 'pages/6_resume/resumePage.dart';
import 'pages/7_openResume/openResume.dart';
import 'pages/8_matchingInProgress/matchingInProgressPage.dart';
import 'pages/9_readyScreen/readyScreenPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

//  인적사항, 나의 지원 정보 페이지 DATA 적용용
  personalInfoData p_data = personalInfoData(univ: 'UCB', major: "ME", gpa: 3.9);
  matchingConditionsData m_data = matchingConditionsData(company: 'samsung', field: 'design', resume: 'resume');

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
      home: interviewHistoryPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
