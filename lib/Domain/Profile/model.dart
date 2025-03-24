class Model {
  String? username;
  String? email;
  String? phoneNumber;
  String? address;
  String? password;
  String? firstName;
  String? lastName;
  String? dateOfBirth;

  Model({
    this.username,
    this.email,
    this.phoneNumber,
    this.address,
    this.password,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        username: json['username'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phone_number'] as String?,
        address: json['address'] as String?,
        password: json['password'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phone_number': phoneNumber,
        'address': address,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'date_of_birth': dateOfBirth,
      };
}
