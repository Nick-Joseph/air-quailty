

// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../model/firestore_users_data.dart';

// db = FirebaseFirestore.instance;

// final ref = db.collection("users").doc("Nick").withConverter(
//       fromFirestore: User.fromFirestore,
//       toFirestore: (User user, _) => user.toFirestore(),
//     );
// final docSnap = await ref.get();
// final user = docSnap.data(); // Convert to City object
// if (user != null) {
//   print(user);
// } else {
//   print("No such document.");
// }