import 'package:flutter/material.dart';
import 'package:interview_link/pages/3_personalInformationPage/personalInfoData.dart';

class PersonalInformationPage extends StatefulWidget {
  final personalInfoData personalinfodata;

  const PersonalInformationPage({Key? key, required this.personalinfodata}) : super(key: key);

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
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  child: TextField(
                    controller: univController,
                    decoration: InputDecoration(
                      hintText: "*대학교를 입력해주세요.",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    "필수 입력 사항입니다.",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
