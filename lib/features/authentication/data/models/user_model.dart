import 'dart:convert';

import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  String? refreshToken;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
    this.refreshToken,
  }) : super(
          name: '$firstName $lastName',
          userName: username!,
          userEmail: email!,
          userToken: token!,
          userImage: image!,
          userGender: gender!,
        );

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        id: data['id'] as int?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        gender: data['gender'] as String?,
        image: data['image'] as String?,
        token: data['token'] as String?,
        refreshToken: data['refreshToken'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'username': username,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'image': image,
        'token': token,
        'refreshToken': refreshToken,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
