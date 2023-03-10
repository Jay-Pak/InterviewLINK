import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interview_link/main.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);



  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  TextEditingController univController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController gpaController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool p_isChecked = false;

  @override
  void initState() {
    univController = TextEditingController();
    majorController = TextEditingController();
    gpaController = TextEditingController();
    ageController = TextEditingController();
    genderController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    univController.dispose();
    majorController.dispose();
    gpaController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.dispose();
  }

  final CollectionReference _user = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser?.email}');

  Future<void> _updateUser() {
    return _user.doc('PersonalInfo').set({
      'univ': univController.text,
      'major': majorController.text,
      'gpa': gpaController.text,
      'age': ageController.text,
      'gender': genderController.text,
      'p_isChecked': p_isChecked,
      'email': FirebaseAuth.instance.currentUser!.email,
    });
  }

  @override
  Widget build(BuildContext context) {
    MyAppState? myApp = context.findAncestorStateOfType();
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new),
        //   onPressed: () {},
        // ),
        title: const Text("????????????"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {
              _updateUser();
              myApp!.setState(() {});
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    controller: univController,
                    decoration: const InputDecoration(
                      hintText: "* ???????????? ??????????????????.",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: const Text(
                    "?????? ?????? ???????????????.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    controller: majorController,
                    decoration: const InputDecoration(
                      hintText: "* ????????? ??????????????????.",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: const Text(
                    "?????? ?????? ???????????????.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    controller: gpaController,
                    decoration: const InputDecoration(
                      hintText: "* ????????? ??????????????????.",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: const Text(
                    "?????? ?????? ???????????????.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      hintText: "* ????????? ??????????????????.",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: const Text(
                    "?????? ?????? ???????????????.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: TextField(
                    controller: genderController,
                    decoration: const InputDecoration(
                      hintText: "* ????????? ??????????????????.",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: const Text(
                    "?????? ?????? ???????????????.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: p_isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        p_isChecked = value!;
                      });
                    }),
                const Text(
                  "?????? ?????? ??? ???????????? ???????????? ???????????? ??????????????????.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
