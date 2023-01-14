import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_link/data/globalVariables.dart';
import 'package:interview_link/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_link/pages/2_loginPage/kakaoServerToken.dart';
import 'package:interview_link/pages/3_personalInformationPage/personalInformationPage.dart';
import 'package:interview_link/pages/4_mainPage/mainPage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'pages/2_loginPage/kakao_login.dart';
import 'pages/2_loginPage/loginPage.dart';
import 'components/link_color.dart';

void main() async {
  kakao.KakaoSdk.init(nativeAppKey: '323269abd66eb75436b50ec1d82ca942');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final viewModel = KakaoServerToken(KakaoLogin());
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<bool> getFBdata() async {
    var result = await FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}').doc('PersonalInfo').get();
    // print(result.data()!.values);
    return result.exists;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFBdata();
  }

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
      home: Builder(builder: (context) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoginPage();
            } else {
              FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}').doc('PersonalInfo').set({'gloVar' : 0});
              print(getFBdata().runtimeType);
              print(Future.value(false).runtimeType);
              if(getFBdata() == Future.value(false)){
                return PersonalInformationPage();
              }else{
                return MainPage();
              }
              // getFBdata();

            }
          },
        );
      }),
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
    );
  }
}

// var jaeho = await FirebaseFirestore.instance.collection('${FirebaseAuth.instance.currentUser!.email}').doc('PersonalInfo').get();
// print(snapshot.data() == null);
// if(snapshot.data() == null){
// Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalInformationPage()));

// bool isExist(docID) {
//   bool check = false;
//
//   FirebaseFirestore.instance
//       .collection('${FirebaseAuth.instance.currentUser!.email}')
//       .doc(docID)
//       .get()
//       .then(
//     (value) {
//       if (value.exists == false) {
//         check = false;
//         print('check : ${check}');
//       } else {
//         check = true;
//         print('check : ${check}');
//       }
//     },
//   );
//   return check;
// }
