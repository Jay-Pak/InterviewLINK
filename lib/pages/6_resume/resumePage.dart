import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_link/main.dart';
import 'package:interview_link/pages/7_resumeOpenPage/resumeOpenPage.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  CollectionReference resumelist = FirebaseFirestore.instance
      .collection('${FirebaseAuth.instance.currentUser?.email}')
      .doc('Resume')
      .collection('Resumelist');

  List<int> numberOfResume = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int selectedResumeIndex = 0;
  var selectNumber;
  int value = 0;

  Widget _buildBottomPicker(Widget picker) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border(
              bottom: BorderSide(
                color: Color(0xff999999),
                width: 0.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CupertinoButton(
                child: Text('취소'),
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
              ),
              CupertinoButton(
                child: Text('선택완료'),
                onPressed: () async {
                  if (selectNumber != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => resumeOpenPage(
                                  getNumber: selectNumber,
                                )));
                  }
                  print(selectNumber);
                  print(selectNumber.runtimeType);
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 216.0,
          padding: const EdgeInsets.only(top: 6.0),
          color: CupertinoColors.white,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 16.0,
            ),
            child: GestureDetector(
              // Blocks taps from propagating to the modal sheet and popping.
              onTap: () {},
              child: SafeArea(
                top: false,
                child: picker,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCupertinoPicker() {
    return Container(
      child: CupertinoPicker(
        magnification: 1.8,
        backgroundColor: Colors.white,
        itemExtent: 32,
        //height of each item
        looping: true,
        children: numberOfResume
            .map((item) => Center(
                  child: Text(
                    item.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ))
            .toList(),
        onSelectedItemChanged: (index) {
          setState(() => this.value = index);
          selectNumber = numberOfResume[index];
          print("Selected Number: $selectNumber");
          print(selectNumber.runtimeType);

          //selectItem 에 입력받은 int 저장 ==> global 변수로 선언후 받아야 하는지??
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: globalVariable.currentIndex == 0
            ? AppBar(
                title: const Text("이력서"),
              )
            : null,
        body: StreamBuilder(
            stream: resumelist.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, idx) {
                      final DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[idx];
                      return Card(
                        child: ListTile(
                          title: Text(documentSnapshot['title']),
                          trailing: Wrap(
                            children: <Widget>[
                              IconButton(
                                splashRadius: 16,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_note,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                splashRadius: 16,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return Container();
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) {
                  return _buildBottomPicker(_buildCupertinoPicker());
                });
          },
        ));
  }
}
