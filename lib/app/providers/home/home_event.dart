import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:technicaltest_ummacademy/app/models/model_ref_jurusan/data_jurusan.dart';
import 'package:technicaltest_ummacademy/app/models/model_ref_jurusan/model_ref_jurusan.dart';
import 'package:technicaltest_ummacademy/core/utils/enum.dart';

class HomeEvent {
  int currentPage = 1;
  int totalPage = 0;
  int totalData = 0;
  ModelRefJurusan? modelRefJurusan;
  List<DataJurusan> dataJurusan = [];
  LoadingState loadingState = LoadingState.initialize;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
}
