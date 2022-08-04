import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:technicaltest_ummacademy/app/providers/auth/auth_state.dart';
import 'package:technicaltest_ummacademy/app/views/widgets/general_button.dart';
import 'package:technicaltest_ummacademy/app/views/widgets/general_text_field.dart';
import 'package:technicaltest_ummacademy/core/utils/constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthState>(
        builder: (context, data, _) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo-ummacademy.png',
                fit: BoxFit.cover,
                width: Get.width * 0.5,
              ),
              const SizedBox(
                height: 10,
              ),
              GeneralTextField(
                controller: data.emailC,
                label: 'Email',
                labelColor: Colors.white,
                inputType: TextInputType.emailAddress,
                hintText: 'Masukkan email',
              ),
              GeneralTextField(
                controller: data.passwordC,
                label: 'Password',
                maxLines: 1,
                labelColor: Colors.white,
                hintText: 'Masukkan password',
                obscureText: data.obsecureText,
                suffixIcon: InkWell(
                    onTap: () {
                      data.changeObsecureText();
                    },
                    child: Icon(
                      (data.obsecureText)
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: (data.obsecureText)
                          ? Colors.grey
                          : MyConstants.blueColor,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              GeneralButton(
                  label: 'MASUK',
                  width: Get.width,
                  onPressed: () {
                    data.postLogin();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
