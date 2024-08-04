class UserProviderModel {
  int? id;
  String name;
  String email;
  String address;
  String gender;

  UserProviderModel({
     this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.gender,
  });

  factory UserProviderModel.fromJson(Map<String, dynamic> json) {
    return UserProviderModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'gender': gender,
    };
  }
}


