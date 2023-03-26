import 'package:flutter/material.dart';

class MyNotificationsPage extends StatefulWidget {
  const MyNotificationsPage({Key? key}) : super(key: key);

  @override
  State<MyNotificationsPage> createState() => _MyNotificationsPageState();
}

class _MyNotificationsPageState extends State<MyNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: const Center(child: Text('Notifications')),
      ),
    );
  }
}
