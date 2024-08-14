class NurseProfile {
  final String profileImage;
  final String nurseName;
  final String email;
  final String licenseNo;
  final String workType;
  final DateTime dob;
  final String gender;
  final String specialization;
  final List<String> attachments;

  NurseProfile({
    required this.profileImage,
    required this.nurseName,
    required this.email,
    required this.licenseNo,
    required this.workType,
    required this.dob,
    required this.gender,
    required this.specialization,
    required this.attachments,
  });

  Map<String, dynamic> toJson() {
    return {
      "profileImage": profileImage,
      "nurseName": nurseName,
      "email": email,
      "licenseNo": licenseNo,
      "workType": workType,
      "dob": dob.toIso8601String(),
      "gender": gender,
      "specialization": specialization,
      "attachments": attachments,
    };
  }
}
