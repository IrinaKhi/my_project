import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:project_du/previews/preview_first.dart';
import 'package:project_du/previews/preview_fourth.dart';
import 'package:project_du/previews/preview_second.dart';
import 'package:project_du/previews/preview_third.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('зашли в PageView');
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    //  var screens;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(children: [
        PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            FirstPreviewPage(),
            SecondPreviewPage(),
            ThirdPreviewPage()
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0, right: 300.0),
          child: PageViewIndicator(length: 3, currentIndex: _currentIndex),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          if (_currentIndex > 1)
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FourthPreviewPage()),
              )
            }
          else
            {
              controller.nextPage(
                  duration: const Duration(seconds: 1), curve: Curves.easeInOut)
            }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
