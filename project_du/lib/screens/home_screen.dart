import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project_du/navigators/pageview.dart';

import 'package:project_du/services/beamer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    print('проверка состояния юзера');
    user == null
        ? print('юзер не зарегистрирован')
        : print('юзер зарегистрирован');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: (user == null)
              // ? const Text("Контент для НЕ зарегистрированных в системе")
              ? const MyPageView()
              // : const Text('Контент для ЗАРЕГИСТРИРОВАННЫХ в системе'),

              : MyBeamer(),
        ),
      ),
    );
  }
}
