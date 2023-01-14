import 'package:flutter/material.dart';
import 'package:interview_link/components/getPages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedResume;

  @override
  Widget build(BuildContext context) {
    return GetPages();
  }
}
