import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:interview_link/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_link/pages/2_loginPage/mainViewModel.dart';
import 'package:interview_link/pages/2_loginPage/social_login.dart';
import 'package:interview_link/pages/2_loginPage/google_login.dart';
import 'package:interview_link/pages/3_personalInformationPage/personalInfoData.dart';
import 'package:interview_link/pages/5_matchingConditions/matchingConditionsData.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'pages/10_startInterview(interviewer)/startInterviewInterviewerPage.dart';
import 'pages/11_endInterview/endInterviewPage.dart';
import 'pages/12_interviewHistory/interviewHistory.dart';

import 'pages/13_playingRecordedInterview/playingRecordedInterviewPage.dart';
import 'pages/1_splashPage/splashPage.dart';
import 'pages/2_loginPage/loginPage.dart';
import 'components/link_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  KakaoSdk.init(nativeAppKey: '323269abd66eb75436b50ec1d82ca942');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runZonedGuarded(() async{
    runApp(const MyApp());
  }, (error, stackTrace){
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
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
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final viewModel = mainViewModel(kakaoLogin());

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

      home: LoginPage(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics)
      ],
    );
  }
}



