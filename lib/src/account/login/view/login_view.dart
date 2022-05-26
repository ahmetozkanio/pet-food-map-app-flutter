import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mama_app_flutter/src/account/login/controller/login_view_controller.dart';
import 'package:mama_app_flutter/src/account/register/view/register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    LoginViewController _loginViewController = Get.put(LoginViewController());
    return Scaffold(
      body: SafeArea(child: loginForm()),
    );
  }

  Form loginForm() {
    LoginViewController _loginViewController = Get.find();
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _loginFormKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        // shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          // Image.asset('assets/logo.png'),
          Text(
            "Giriş",
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "E-mail",
            ),
            // maxLength: 11,
            // keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            // ],
            controller: _loginViewController.emailCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'E-mail adresinizi giriniz.'
                  : null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Şifre",
            ),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: _loginViewController.passwordCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Lütfen şifrenizi giriniz.'
                  : null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          Obx(
            () => _loginViewController.loginButtonLoading.value
                ? Center(
                    child: CupertinoActivityIndicator(
                      radius: 14,
                    ),
                  )
                : ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () async {
                      if (_loginFormKey.currentState?.validate() ?? false) {
                        await _loginViewController.loginUser(
                            _loginViewController.emailCtrl.text,
                            _loginViewController.passwordCtrl.text);
                      }
                    },
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(fontSize: 16),
                    )),
          ),

          TextButton(
            onPressed: () {
              Get.to(
                () => RegisterView(),
                transition: Transition.rightToLeft,
              );
            },
            child: Text('Yeni Kayıt Oluştur.'),
          ),
        ],
      ),
    );
  }
}
