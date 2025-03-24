class DoctorModel {
  String? name;
  String? specialization;
  String? phone;
  String? email;
  int? experience;
  DateTime? dateJoined;

  DoctorModel({
    this.name,
    this.specialization,
    this.phone,
    this.email,
    this.experience,
    this.dateJoined,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        name: json['name'] as String?,
        specialization: json['specialization'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        experience: json['experience'] as int?,
        dateJoined: json['date_joined'] == null
            ? null
            : DateTime.parse(json['date_joined'] as String),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'specialization': specialization,
        'phone': phone,
        'email': email,
        'experience': experience,
        'date_joined': dateJoined?.toIso8601String(),
      };
}
