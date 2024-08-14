import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nurse_enroll/environment.dart';
import 'package:nurse_enroll/model/nurse_profile.dart';

Future<void> registerNewProfile(NurseProfile profile) async {
  final dio = Dio();
  String apiUrl = '${environment['baseUrl']}/profile';
  debugPrint('apiUrl: ${apiUrl}');
  debugPrint('Request data: ${profile.toJson()}');
  try {
    final response = await dio.post(apiUrl, data: profile.toJson());
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response data: ${response.data}');
  } catch (e) {
    debugPrint('Error: $e');
  }
}
