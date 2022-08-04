import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> loadingBuilder({required String title}) {
  return Get.dialog(
    Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Container(
        height: 80,
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            const SizedBox(
              child: CircularProgressIndicator.adaptive(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    title,
                  )),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  );
}
