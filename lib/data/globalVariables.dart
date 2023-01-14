// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class GlobalVariable {
//   var gloVar = FirebaseFirestore.instance.collection(
//       '${FirebaseAuth.instance.currentUser!.email}').doc('PersonalInfo')
//       .get()
//       .then((value) {
//     value.data()
//   });
//
//
//   get gloVar {
//     return this._gloVar;
//   }
//
//   set glovar(var glovar) {
//     this._gloVar = glovar;
//   }
// }