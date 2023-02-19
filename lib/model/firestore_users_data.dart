// import 'package:cloud_firestore/cloud_firestore.dart';
// db = FirebaseFirestore.instance;

// class User {
//   final String? firstName;
//   final String? lastName;
//   final String? city;
//   final String? email;

//   User({this.firstName, this.lastName, this.city, this.email});

//   factory User.fromFirestore(
//     DocumentSnapshot<Map<String, dynamic>> snapshot,
//     SnapshotOptions? options,
//   ) {
//     final data = snapshot.data();
//     return User(
//       firstName: data?['first name'],
//       lastName: data?['last name'],
//       city: data?['city'],
//       email: data?['email'],
//     );
//   }

//   Map<String, dynamic> toFirestore() {
//     return {
//       if (firstName != null) "first name": firstName,
//       if (lastName != null) "last name": lastName,
//       if (city != null) "city": city,
//       if (email != null) "email": email,
//     };
//   }
// }
