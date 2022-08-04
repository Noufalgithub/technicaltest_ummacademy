import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest_ummacademy/app/providers/auth/auth_event.dart';
import 'package:technicaltest_ummacademy/app/views/home/home_view.dart';
import 'package:technicaltest_ummacademy/app/views/login/login_view.dart';
import 'package:technicaltest_ummacademy/app/views/widgets/dialog/dialog_loading.dart';
import 'package:technicaltest_ummacademy/app/views/widgets/dialog/dialog_question.dart';
import 'package:technicaltest_ummacademy/app/views/widgets/dialog/dialog_snackbar.dart';
import 'package:technicaltest_ummacademy/core/network/dio_service.dart';
import 'package:technicaltest_ummacademy/core/network/parsing_dio_error.dart';
import 'package:technicaltest_ummacademy/core/utils/base_url.dart';
import 'package:technicaltest_ummacademy/core/utils/constants.dart';
import 'package:technicaltest_ummacademy/core/utils/enum.dart';

class AuthState extends ChangeNotifier with AuthEvent, DioService {
  Future<void> postLogin() async {
    loadingBuilder(title: 'Loading...');

    final response = await dio.post(BaseUrl.postLogin,
        data: {'email': emailC.text, 'password': passwordC.text});

    try {
      if (emailC.text.isEmpty || passwordC.text.isEmpty) {
        // close the loading
        Get.back();

        showSnackBar(
            snackBarType: SnackBarType.error,
            title: 'Error',
            message: 'Email atau Passwword tidak boleh kosong.');
      } else {
        if (response.statusCode == 200) {
          if (response.data['status'] == 'success') {
            // close the loading
            Get.back();
            emailC.clear();
            passwordC.clear();
            obsecureText = true;

            box.write(
                MyConstants.token, response.data['content']['access_token']);

            Get.offAll(const HomeView());
          } else {
            // close the loading
            Get.back();

            showSnackBar(
                snackBarType: SnackBarType.error,
                title: "Error",
                message: response.data['message']);
          }
        } else {
          // close the loading
          Get.back();

          showSnackBar(
              snackBarType: SnackBarType.error,
              title: "Error",
              message: 'Terjadi kesalahan, tidak dapat login.');
        }
      }
    } on DioError catch (e) {
      ParsingDioError.getErrorType(e);
    }
    notifyListeners();
  }

  Future<void> postLogout() async {
    showDialogQuestion(
        title: 'Logout',
        message: 'Apakah Anda yakin ingin keluar ?',
        onPressed: () async {
          final response = await dio.post(BaseUrl.postLogout);
          print(response.data);
          Get.offAll(const LoginView());
          box.remove(MyConstants.token);
        });
    notifyListeners();
  }

  void changeObsecureText() async {
    obsecureText = !obsecureText;
    notifyListeners();
  }
}
