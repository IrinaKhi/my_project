import 'package:flutter/material.dart';

class SecondPreviewPage extends StatefulWidget {
  const SecondPreviewPage({Key? key}) : super(key: key);

  @override
  State<SecondPreviewPage> createState() => _SecondPreviewPageState();
}

class _SecondPreviewPageState extends State<SecondPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: const Center(child: Text('Page 2')),
      ),
    );
  }
}
