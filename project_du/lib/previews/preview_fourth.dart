import 'package:flutter/material.dart';
import 'package:project_du/screens/login_screen.dart';
import 'package:project_du/screens/signup_screen.dart';

class FourthPreviewPage extends StatefulWidget {
  const FourthPreviewPage({Key? key}) : super(key: key);

  @override
  State<FourthPreviewPage> createState() => _FourthPreviewPageState();
}

class _FourthPreviewPageState extends State<FourthPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body:
          // Padding(
          //   padding: const EdgeInsets.all(100.0),
          Center(
        child: Container(
          padding: const EdgeInsets.only(top: 400.0),
          child: Column(
            children: [
              //  child: Text('Page 3')),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      ),
                  child: const Text('New User')),
              TextButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      ),
                  child: const Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
