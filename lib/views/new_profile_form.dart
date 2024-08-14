import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nurse_enroll/model/form_manager.dart';
import 'package:nurse_enroll/widgets/attachment_form.dart';
import 'package:nurse_enroll/widgets/form_fields.dart';
import 'package:nurse_enroll/widgets/profile_image.dart';

class ProfileForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final NurseProfileFormManager formManager;

  ProfileForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.formManager,
  }) : _formKey = formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  child: const Icon(Icons.arrow_back)),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Complete Your Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontFamily: "Manrope"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ProfileImage(
              fileName: formManager.profileImage,
              onChanged: (value) {
                formManager.profileImage = value;
              }),
          FormFields(
            title: "Nurse name",
            hintText: "Name",
            controller: formManager.nurseNameController,
            validationMsg: "Please enter name.",
          ),
          FormFields(
            title: "Email",
            hintText: "email",
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 8),
              child: Icon(
                Icons.email,
                color: Colors.grey,
                size: 30,
              ),
            ),
            controller: formManager.emailController,
            validationMsg: "Please enter email id.",
          ),
          FormFields(
            title: "License no",
            hintText: "License number",
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 8, top: 12),
              child: FaIcon(
                FontAwesomeIcons.idCard,
                color: Colors.grey,
              ),
            ),
            controller: formManager.licenseNoController,
            validationMsg: "Please enter license no.",
          ),
          FormFields(
            title: "Work type",
            hintText: "Work type",
            items: const ["Full time", "Part time"],
            selectedItem: formManager.workType,
            onChanged: (value) {
              formManager.workType = value;
            },
            validationMsg: "Please choose work type.",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: FormFields(
                    title: "DOB",
                    hintText: "Select Date",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 8),
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                    ),
                    isDateField: true,
                    controller: formManager.dobController,
                    onChanged: (value) {
                      formManager.selectedDate = DateTime.tryParse(value);
                      print("value :${formManager.selectedDate}");
                    },
                    validationMsg: "Please choose DOB.",
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: FormFields(
                    title: "Gender",
                    hintText: "Choose",
                    items: const [
                      {"label": "Male", "icon": "assets/images/male.png"},
                      {"label": "Female", "icon": "assets/images/female.png"},
                      {"label": "Others", "icon": "assets/images/others.png"},
                    ],
                    isIconField: true,
                    selectedItem: formManager.gender,
                    onChanged: (value) {
                      formManager.gender = value;
                    },
                    validationMsg: "Please choose gender.",
                  ))
            ],
          ),
          FormFields(
            title: "Specialization",
            hintText: "Choose Specialization",
            items: const [
              "Registered Nurse",
              "Cardiac Nurse",
              "Clinical Nurse Specialist",
              "Critical Care Nurse"
            ],
            selectedItem: formManager.specialization,
            onChanged: (value) {
              formManager.specialization = value;
            },
            validationMsg: "Please choose specialization.",
          ),
          AttachmentWidget(
            selectedFiles: formManager.attachments,
          ),
        ],
      ),
    );
  }
}
