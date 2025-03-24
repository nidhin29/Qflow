class PresciptionModel {
  String? symptoms;
  String? diseaseIdentified;
  String? remarks;
  String? medicines;
  String? consultationDate;

  PresciptionModel({
    this.symptoms,
    this.diseaseIdentified,
    this.remarks,
    this.medicines,
    this.consultationDate,
  });

  factory PresciptionModel.fromJson(Map<String, dynamic> json) {
    return PresciptionModel(
      symptoms: json['symptoms'] as String?,
      diseaseIdentified: json['disease_identified'] as String?,
      remarks: json['remarks'] as String?,
      medicines: json['medicines'] as String?,
      consultationDate: json['consultation_date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'symptoms': symptoms,
        'disease_identified': diseaseIdentified,
        'remarks': remarks,
        'medicines': medicines,
        'consultation_date': consultationDate,
      };
}
