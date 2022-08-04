import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AuthEvent {
  GetStorage box = GetStorage();
  bool obsecureText = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
}
