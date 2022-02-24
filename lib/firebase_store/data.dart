// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class dataRepo {
//   final CollectionReference collection =
//       FirebaseFirestore.instance.collection('chart');

//   Stream<List<Chart>> getChartData() {
//     print('hhhhh');
//     // print(collection.snapshots())
//     return collection
//         .snapshots() //snapshot returns stream
//         .map((querySnapshot) => fromFirestore(querySnapshot));
//   }

//   // fromFirestore(QuerySnapshot querySnapshot) {
//   //   print(querySnapshot.docs.asMap());

//   //   print('jjjjj');

//   //   var hgh = querySnapshot.docs
//   //       .map((e) => Chart(x: e.get('x'), y: e.get('y'), z: e.get('z')))
//   //       .toList();

//   //   print(hgh);
//   //   return hgh;
//   // }
// }

// class Chart {
//   final num x;
//   final num y;
//   final num z;

//   Chart({required this.x, required this.y, required this.z});
// }
