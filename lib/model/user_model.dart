import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;
  final List details;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.details,
  });

  toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "details": details,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    List<Map<String, dynamic>> sortedDetails = List.from(data["details"]);
    sortedDetails.sort((a, b) => a["fName"].compareTo(b["fName"]));
    return UserModel(userId: document.id, name: data["name"], email: data["email"], details: sortedDetails);
  }

}