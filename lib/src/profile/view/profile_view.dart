import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mama_app_flutter/src/core/user_account/auth_manager.dart';
import 'package:mama_app_flutter/src/profile/controller/profile_view_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileViewController profileViewController =
        Get.put(ProfileViewController());
    AuthenticationManager authenticationManager = Get.find();
    return ListView(
      children: [
        Container(
            width: 48,
            height: 48,
            child: Image.network(profileViewController.photo)),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(profileViewController.name),
          tileColor: Color.fromARGB(255, 248, 248, 248),
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text(profileViewController.email),
          tileColor: Color.fromARGB(255, 248, 248, 248),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(profileViewController.phone),
          tileColor: Color.fromARGB(255, 248, 248, 248),
        ),
        ListTile(
          leading: Icon(Icons.date_range),
          title: Text(profileViewController.birthDay),
          tileColor: Color.fromARGB(255, 248, 248, 248),
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title:
                      const Text('Çıkış yapmak istediğinizden emin misiniz?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Vazgeç'),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: const Text('Evet'),
                      onPressed: () {
                        authenticationManager.logOut();
                      },
                    ),
                  ],
                ),
              );
            },
            child: Text('Çıkış Yap')),
      ],
    );
  }
}
