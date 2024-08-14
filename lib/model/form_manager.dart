import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nurse_enroll/model/nurse_profile.dart';

class NurseProfileFormManager {
  String? profileImage;
  final TextEditingController nurseNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController licenseNoController = TextEditingController();
  String? workType;
  final TextEditingController dobController = TextEditingController();
  DateTime? selectedDate;
  String? gender;
  String? specialization;
  List<PlatformFile> attachments = [];

  NurseProfile collectFormData() {
    return NurseProfile(
      profileImage: profileImage ?? "",
      nurseName: nurseNameController.text,
      email: emailController.text,
      licenseNo: licenseNoController.text,
      workType: workType ?? "",
      dob: selectedDate ?? DateTime.now(),
      gender: gender ?? "",
      specialization: specialization ?? "",
      attachments: attachments.map((file) => file.name).toList(),
    );
  }
}
