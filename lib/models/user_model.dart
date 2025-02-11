class UserModel {
  final String firstName;
  final String lastName;
  final String registrationNumber;
  final String branch;
  final String phoneNumber;
  final String email;
  final String batch;
  final String? token; // Optional token for storing authentication token

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.registrationNumber,
    required this.branch,
    required this.phoneNumber,
    required this.email,
    required this.batch,
    this.token,
  });

  // Factory method to create a UserModel instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      registrationNumber: json['registration_number'] ?? '',
      branch: json['branch'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      email: json['email'] ?? '',
      batch: json['batch'] ?? '',
      token: json['token'],
    );
  }

  // Convert UserModel to JSON (useful for requests)
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'registration_number': registrationNumber,
      'branch': branch,
      'phone_number': phoneNumber,
      'email': email,
      'batch': batch,
      'token': token,
    };
  }
}
