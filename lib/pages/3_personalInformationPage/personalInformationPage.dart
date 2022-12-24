import 'package:flutter/material.dart';
import 'package:interview_link/pages/3_personalInformationPage/personalInfoData.dart';

class PersonalInformationPage extends StatefulWidget {
  final personalInfoData personalinfodata;

  const PersonalInformationPage({Key? key, required this.personalinfodata})
      : super(key: key);

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

  personalInfoData get personalinfodata => widget.personalinfodata;

  @override
  void initState() {
    univController.text = personalinfodata.univ;
    majorController.text = personalinfodata.major;
    gpaController.text = personalinfodata.gpa.toString();
    ageController.text = personalinfodata.age.toString();
    genderController.text = personalinfodata.gender.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text("인적사항"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {},
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
                      hintText: "* 대학교를 입력해주세요.",
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
                    "필수 입력 사항입니다.",
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
                    controller: univController,
                    decoration: const InputDecoration(
                      hintText: "* 대학교를 입력해주세요.",
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
                    "필수 입력 사항입니다.",
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
                    controller: univController,
                    decoration: const InputDecoration(
                      hintText: "* 대학교를 입력해주세요.",
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
                    "필수 입력 사항입니다.",
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
                    controller: univController,
                    decoration: const InputDecoration(
                      hintText: "* 대학교를 입력해주세요.",
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
                    "필수 입력 사항입니다.",
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
                    controller: univController,
                    decoration: const InputDecoration(
                      hintText: "* 대학교를 입력해주세요.",
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
                    "필수 입력 사항입니다.",
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
                  "면접 매칭 시 인적사항 비공유를 원하시면 체크해주세요.",
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
