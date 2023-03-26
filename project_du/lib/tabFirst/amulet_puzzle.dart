import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AmuletPuzzle extends StatefulWidget {
  const AmuletPuzzle({Key? key}) : super(key: key);

  @override
  State<AmuletPuzzle> createState() => _AmuletPuzzleState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class _AmuletPuzzleState extends State<AmuletPuzzle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: Text('Text'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
