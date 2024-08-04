class UserModel {
  final String? uId;
  final String? name;
  final String? email;
  final String? gender;

  UserModel({
    this.uId,
    this.name,
    this.email,
    this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
    );
  }
}