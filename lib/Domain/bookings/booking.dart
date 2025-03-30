class Booking {
  String? doctor;
  String? appointmentDate;
  String? time;
  String? symptoms;
  String? additionalDetails;
  int? consltNumber;
  int? opticketNumber;
  int? status;
  String? createdAt;
  int? startedsts;
  int? currentConsultNo;

  Booking({
    this.doctor,
    this.appointmentDate,
    this.time,
    this.symptoms,
    this.additionalDetails,
    this.consltNumber,
    this.opticketNumber,
    this.status,
    this.createdAt,
    this.startedsts,
    this.currentConsultNo,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        doctor: json['doctor'] as String?,
        appointmentDate: json['appointment_date'] as String?,
        time: json['time'] as String?,
        symptoms: json['symptoms'] as String?,
        additionalDetails: json['additional_details'] as String?,
        consltNumber: json['ConsltNumber'] as int?,
        opticketNumber: json['opticket_number'] as int?,
        status: json['status'] as int?,
        createdAt: json['created_at'] as String?,
        startedsts: json['started_sts'] as int?,
        currentConsultNo: json['current_ConsltNumber'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'doctor': doctor,
        'appointment_date': appointmentDate,
        'time': time,
        'symptoms': symptoms,
        'additional_details': additionalDetails,
        'ConsltNumber': consltNumber,
        'opticket_number': opticketNumber,
        'status': status,
        'created_at': createdAt,
        'started_sts': startedsts,
        'current_ConsltNumber': currentConsultNo,
      };
}
