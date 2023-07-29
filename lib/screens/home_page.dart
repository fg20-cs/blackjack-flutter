import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isGameStarted = false;

    return Scaffold(
      body: _isGameStarted
          ? Container()
          : Center(
              child: MaterialButton(
              color: const Color(0XFFEC625F),
              onPressed: () {},
              child: const Text("Start Game"),
            )),
    );
  }
}
