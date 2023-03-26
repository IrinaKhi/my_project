import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'package:project_du/tabFirst/amulet_puzzle.dart';

import 'package:google_fonts/google_fonts.dart';

class MyGameplayPage extends StatefulWidget {
  const MyGameplayPage({Key? key}) : super(key: key);

  @override
  State<MyGameplayPage> createState() => _MyGameplayPageState();
}

class _MyGameplayPageState extends State<MyGameplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Gameplay',
          textAlign: TextAlign.center,
          style: GoogleFonts.neucha(fontSize: 22, color: Colors.transparent),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: const FractionalOffset(0.5, 0.3),
            child: OpenContainer(
              transitionDuration: const Duration(milliseconds: 900),
              transitionType: ContainerTransitionType.fadeThrough,
              middleColor: Colors.transparent,
              closedColor: Colors.transparent,
              openColor: Colors.transparent,
              closedElevation: 0,
              openElevation: 0,
              openBuilder: (context, action) => const AmuletPuzzle(),
              closedBuilder: (context, action) => Container(
                color: Colors.transparent,
                width: 100,
                height: 100,
                child: const Image(
                    image: AssetImage('assets/images/amulet_red2.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
