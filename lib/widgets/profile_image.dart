import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  ProfileImage({super.key, required this.fileName, required this.onChanged});

  String? fileName;
  final Function(String)? onChanged;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
        widget.onChanged?.call(_profileImage!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            "Profile Picture",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                fontFamily: "Manrope"),
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  _profileImage != null ? FileImage(_profileImage!) : null,
              child: _profileImage == null
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.44,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xff3b42ba),
                  ),
                ),
                onPressed: _pickImage,
                child: const Text(
                  "Upload picture",
                  style: TextStyle(
                      color: Color(0xff3b42ba),
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
