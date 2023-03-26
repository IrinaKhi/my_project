import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstPreviewPage extends StatefulWidget {
  const FirstPreviewPage({Key? key}) : super(key: key);

  @override
  State<FirstPreviewPage> createState() => _FirstPreviewPageState();
}

class _FirstPreviewPageState extends State<FirstPreviewPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.redAccent[100],
        child: const Center(child: Text('Page 1')),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => print('Переход'),
      //   //  tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailin
    );
  }
}
