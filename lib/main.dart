import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interview_link/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_link/pages/2_loginPage/mainViewModel.dart';
import 'package:interview_link/pages/2_loginPage/social_login.dart';
import 'package:interview_link/pages/3_personalInformationPage/personalInfoData.dart';
import 'package:interview_link/pages/4_mainPage/mainPage.dart';
import 'package:interview_link/pages/5_matchingConditions/matchingConditionsData.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'pages/2_loginPage/kakao_login.dart';
import 'pages/2_loginPage/loginPage.dart';
import 'components/link_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  kakao.KakaoSdk.init(nativeAppKey: '323269abd66eb75436b50ec1d82ca942');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runZonedGuarded(() async {
    runApp(const MyApp());
  }, (error, stackTrace) {
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
  personalInfoData p_data =
      personalInfoData(univ: 'UCB', major: "ME", gpa: 3.9);
  matchingConditionsData m_data = matchingConditionsData(
      company: 'samsung', field: 'design', resume: 'resume');
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
      home: Builder(builder: (context) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoginPage();
            } else {
              return MainPage();
            }
          },
        );
      }),
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
    );
  }
}

//
// void main() async {
//   kakao.KakaoSdk.init(nativeAppKey: '323269abd66eb75436b50ec1d82ca942');
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final viewModel = mainViewModel(kakaoLogin());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: StreamBuilder<User?>(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return ElevatedButton(
//                   onPressed: () async {
//                     await viewModel.login();
//                     setState(() {});
//                   },
//                   child: const Text('Login'),
//                 );
//               }
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.network(
//                       viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
//                   Text(
//                     '${viewModel.isLogined}',
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       await viewModel.logout();
//                       setState(() {});
//                     },
//                     child: const Text('Logout'),
//                   ),
//                 ],
//               );
//             }
//         ),
//       ),
//     );
//   }
// }
