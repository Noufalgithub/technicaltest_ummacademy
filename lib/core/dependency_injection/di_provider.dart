import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:technicaltest_ummacademy/app/providers/auth/auth_state.dart';
import 'package:technicaltest_ummacademy/app/providers/home/home_state.dart';

class DIProvider {
  static final List<SingleChildWidget> listProvider = [
    ChangeNotifierProvider<AuthState>(
      create: (_) => AuthState(),
    ),
    ChangeNotifierProvider<HomeState>(
      create: (_) => HomeState(),
    ),
  ];
}
