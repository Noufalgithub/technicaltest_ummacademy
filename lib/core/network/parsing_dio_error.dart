import 'package:dio/dio.dart';
import 'package:technicaltest_ummacademy/app/views/widgets/dialog/dialog_snackbar.dart';
import 'package:technicaltest_ummacademy/core/utils/enum.dart';

class ParsingDioError {
  static Future<void> getErrorType(DioError e) async {
    if (e.type == DioErrorType.connectTimeout) {
      showSnackBar(
          snackBarType: SnackBarType.error,
          message: "Cobalah beberapa saat lagi",
          title: "Connect Timeout");
    } else if (e.type == DioErrorType.receiveTimeout) {
      showSnackBar(
          snackBarType: SnackBarType.error,
          message: "Cobalah beberapa saat lagi",
          title: "Receive Timeout");
    } else if (e.type == DioErrorType.sendTimeout) {
      showSnackBar(
          snackBarType: SnackBarType.error,
          message: "Cobalah beberapa saat lagi",
          title: "Send Timeout");
    } else if (e.type == DioErrorType.other) {
      showSnackBar(
          snackBarType: SnackBarType.error,
          message: "Cobalah beberapa saat lagi",
          title: "Server Sibuk");
    }
  }
}
