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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        gender: json['gender'] as String?,
        image: json['image'] as String?,
        token: json['token'] as String?,
        refreshToken: json['refreshToken'] as String?,
      );

  Map<String, dynamic> toJson() => {
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
}
