class UserDomain {
  final String email;
  final String firstName;
  final String surName;
  final String? city;
  final String? age;
  final String? photo;

  UserDomain({
    required this.email,
    required this.firstName,
    required this.surName,
    required this.city,
    required this.age,
    required this.photo,
  });
}
