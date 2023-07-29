import "package:flutter/material.dart";

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({Key? key}) : super(key: key);

  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  bool _isGameStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isGameStarted
          ?  SafeArea(
              child: Column(
                children: [

                  Column(
                    children: [
                      const Text("Dealer's score"),
                      Container(
                        height: 300,
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: 0,
                            itemBuilder: (context, index) {
                              // TODO: return dealer's cards here
                              return Container();
                            }
                        ),
                      )],
                  ),

                  Column(
                    children: [
                      const Text("Player's score"),
                      Container(
                        height: 300,
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: 0,
                            itemBuilder: (context, index) {
                              // TODO: return player's cards here
                              return Container();
                            }
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: [
                      MaterialButton(
                          onPressed: () {},
                          color: const Color(0XFFEC625F),
                          child: const Text("Another card"),

                      ),
                      MaterialButton(
                          onPressed: () {},
                          color: const Color(0XFFEC625F),
                          child: const Text("Next Round"),
                      )
                    ],
                  )

                ],
              ),

          )
          : Center(
              child: MaterialButton(
              color: const Color(0XFFEC625F),
              hoverColor: const Color(0XFFFF0000),
              minWidth: 200,
              height: 60,
              onPressed: () {
                setState(() {
                  _isGameStarted = true;
                });
              },
              child: const Text("Start Game"),
            )),
    );
  }
}
