import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mama_app_flutter/src/account/login/view/login_view.dart';
import 'package:mama_app_flutter/src/account/register/controller/register_view_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _registerFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    RegisterViewController _registerViewController =
        Get.put(RegisterViewController());
    return Scaffold(
      body: SafeArea(child: registerForm()),
      backgroundColor: Colors.white,
    );
  }

  Form registerForm() {
    RegisterViewController _registerViewController = Get.find();
    return Form(
      key: _registerFormKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        // shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Image.asset(
            'assets/ic_user.png',
            width: 128.0,
            height: 128.0,
          ),
          Text(
            "Kayıt",
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
            controller: _registerViewController.emailCtrl,
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
            controller: _registerViewController.passwordCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Lütfen şifrenizi giriniz.'
                  : null;
            },
          ),
          SizedBox(
            height: 8,
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
              labelText: "İsim",
            ),
            keyboardType: TextInputType.name,
            controller: _registerViewController.nameCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Lütfen isminizi giriniz.'
                  : null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Telefon",
            ),
            keyboardType: TextInputType.phone,
            controller: _registerViewController.phoneCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Lütfen telefon numaranızı giriniz.'
                  : null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.date_range,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Doğum Tarihi",
            ),
            keyboardType: TextInputType.datetime,
            controller: _registerViewController.birthday,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Lütfen doğum tarihinizi giriniz.'
                  : null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          Obx(() => CheckboxListTile(
              title: Row(
                children: [
                  Text(
                    'KVKK metnini ',
                    style: TextStyle(fontSize: 14.0, color: Colors.red),
                  ),
                  Text(
                    'okudum, onayliyorum',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              value: _registerViewController.kvkk.value,
              onChanged: (value) {
                if (value != null) {
                  _registerViewController.kvkk.value = value;
                }
              })),
          Obx(
            () => _registerViewController.registerButtonLoading.value
                ? Center(
                    child: CupertinoActivityIndicator(
                      radius: 14,
                    ),
                  )
                : ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () async {
                      if (_registerFormKey.currentState?.validate() ?? false) {
                        await _registerViewController.registerUser();
                      }
                    },
                    child: Text(
                      'Kayıt Ol',
                      style: TextStyle(fontSize: 16),
                    )),
          ),
          TextButton(
            onPressed: () {
              Get.to(
                () => LoginView(),
                transition: Transition.leftToRight,
              );
            },
            child: Text('Giriş Yap.'),
          ),
        ],
      ),
    );
  }
}
