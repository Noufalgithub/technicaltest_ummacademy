import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:technicaltest_ummacademy/app/views/home/home_view.dart';
import 'package:technicaltest_ummacademy/app/views/login/login_view.dart';
import 'package:technicaltest_ummacademy/core/dependency_injection/di_provider.dart';
import 'package:technicaltest_ummacademy/core/utils/constants.dart';

class CoreApp extends StatelessWidget {
  const CoreApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();

    return MultiProvider(
      providers: DIProvider.listProvider,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Umma Test",
        home: (box.hasData(MyConstants.token))
            ? const HomeView()
            : const LoginView(),
        theme: ThemeData(
          primaryColor: MyConstants.blueColor,
          // focusColor: MyConstants.kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          snackBarTheme: const SnackBarThemeData(actionTextColor: Colors.white),
        ),
      ),
    );
  }
}
