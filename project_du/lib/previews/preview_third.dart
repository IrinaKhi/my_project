import 'package:flutter/material.dart';

class ThirdPreviewPage extends StatefulWidget {
  const ThirdPreviewPage({Key? key}) : super(key: key);

  @override
  State<ThirdPreviewPage> createState() => _ThirdPreviewPageState();
}

class _ThirdPreviewPageState extends State<ThirdPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: const Center(child: Text('Page 3')),
      ),
    );
  }
}
