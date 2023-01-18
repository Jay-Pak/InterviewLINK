import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalVariable.currentIndex == 0
          ? AppBar(title: const Text("이력서"),)
          : null,
      body: StreamBuilder(
          stream: resumelist.snapshots(),
          builder: (context, snapshot) {
            if(snapshot.data != null) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, idx) {
                    final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[idx];
                    return Card(
                      child: ListTile(
                        title: Text(documentSnapshot['title']),
                      ),
                    );
                    return Container();
                  });
            }
            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => resumeOpenPage()));
        },
      ),
    );
  }
}
