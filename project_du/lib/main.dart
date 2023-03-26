import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_du/previews/preview_first.dart';
import 'package:project_du/previews/preview_fourth.dart';
import 'package:project_du/previews/preview_second.dart';
import 'package:project_du/previews/preview_third.dart';
import 'package:project_du/screens/account_screen.dart';
import 'package:project_du/screens/home_screen.dart';
import 'package:project_du/screens/login_screen.dart';
import 'package:project_du/screens/reset_password_screen.dart';
import 'package:project_du/screens/signup_screen.dart';
import 'package:project_du/screens/verify_email_screen.dart';
import 'package:project_du/services/beamer.dart';
import 'package:project_du/services/firebase_streem.dart';

// Firebase Авторизация - Сценарии:
//    Войти - Почта / Пароль
//    Личный кабинет
//    Зарегистрироваться - Почта / Пароль два раза
//        Подтвердить почту - Отправить письмо снова / Отменить
//    Сбросить пароль - Почта

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/verify_email': (context) => const VerifyEmailScreen(),
        '/preview_first': (context) => const FirstPreviewPage(),
        '/preview_second': (context) => const SecondPreviewPage(),
        '/preview_third': (context) => const ThirdPreviewPage(),
        '/preview_fourth': (context) => const FourthPreviewPage(),
        '/beamer': (context) => MyBeamer(),
      },
      initialRoute: '/',
    );
  }
}
