import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:technicaltest_ummacademy/app/models/model_ref_jurusan/model_ref_jurusan.dart';
import 'package:technicaltest_ummacademy/app/providers/home/home_event.dart';
import 'package:technicaltest_ummacademy/app/views/widgets/dialog/dialog_snackbar.dart';
import 'package:technicaltest_ummacademy/core/network/dio_service.dart';
import 'package:technicaltest_ummacademy/core/network/parsing_dio_error.dart';
import 'package:technicaltest_ummacademy/core/utils/base_url.dart';
import 'package:technicaltest_ummacademy/core/utils/enum.dart';

class HomeState extends ChangeNotifier with HomeEvent, DioService {
  Future<void> getRefJurusan({bool initial = true}) async {
    if (initial) {
      currentPage = 1;
      totalPage = 0;
      totalData = 0;
    }
    loadingState = LoadingState.loading;
    try {
      if (currentPage != totalPage) {
        final response = await dio
            .get(BaseUrl.getRefJurusan, queryParameters: {'page': currentPage});

        if (response.data['status'] == true) {
          loadingState = LoadingState.loaded;
          modelRefJurusan = ModelRefJurusan.fromJson(response.data);
          if (modelRefJurusan!.data != null &&
              dataJurusan.length != modelRefJurusan!.data!.total) {
            dataJurusan.addAll(modelRefJurusan!.data!.data ?? []);
            totalPage = modelRefJurusan!.data!.lastPage!;
            totalData = modelRefJurusan!.data!.total!;
          }
          if (currentPage != totalPage) {
            currentPage++;
          }
          refreshController.refreshCompleted();
          refreshController.loadComplete();
          notifyListeners();
        } else {
          loadingState = LoadingState.error;
          showSnackBar(
              snackBarType: SnackBarType.error,
              title: 'Error',
              message: response.data['message']);
          print(response.data['message']);
        }
      }
    } on DioError catch (e) {
      loadingState = LoadingState.error;
      ParsingDioError.getErrorType(e);
    }
  }
}
