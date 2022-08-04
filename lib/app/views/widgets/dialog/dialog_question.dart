import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest_ummacademy/core/utils/constants.dart';

Future<dynamic> showDialogQuestion(
    {required String title,
    required String message,
    required VoidCallback onPressed}) {
  return Get.dialog(
    AlertDialog(
      title: Text(title),
      content: Text(message),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actions: [
        TextButton(
            onPressed: onPressed,
            child: const Text(
              'Ya',
              style: TextStyle(color: MyConstants.blueColor),
            )),
        TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Tidak',
              style: TextStyle(color: Colors.black),
            ))
      ],
    ),
  );
}
