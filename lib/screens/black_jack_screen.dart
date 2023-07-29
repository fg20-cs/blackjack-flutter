import "package:black_jack/widgets/buttons.dart";
import "package:black_jack/widgets/card_grid_view.dart";
import "package:flutter/material.dart";
import "dart:math";
import 'package:black_jack/styles/styles.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({Key? key}) : super(key: key);

  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  bool _isGameStarted = false;

  // Card Images
  List<Image> myCards = [];
  List<Image> dealersCards = [];

  // Cards
  String? dealerFirstCard;
  String? dealerSecondCard;

  String? playerFirstCard;
  String? playerSecondCard;


  //Scores
  int dealerScore = 0;
  int playerScore = 0;

  // Deck of cards
  final Map<String, int> deckOfCards = {
    "cards/2.1.png": 2,
    "cards/2.2.png": 2,
    "cards/2.3.png": 2,
    "cards/2.4.png": 2,
    "cards/3.1.png": 3,
    "cards/3.2.png": 3,
    "cards/3.3.png": 3,
    "cards/3.4.png": 3,
    "cards/4.1.png": 4,
    "cards/4.2.png": 4,
    "cards/4.3.png": 4,
    "cards/4.4.png": 4,
    "cards/5.1.png": 5,
    "cards/5.2.png": 5,
    "cards/5.3.png": 5,
    "cards/5.4.png": 5,
    "cards/6.1.png": 6,
    "cards/6.2.png": 6,
    "cards/6.3.png": 6,
    "cards/6.4.png": 6,
    "cards/7.1.png": 7,
    "cards/7.2.png": 7,
    "cards/7.3.png": 7,
    "cards/7.4.png": 7,
    "cards/8.1.png": 8,
    "cards/8.2.png": 8,
    "cards/8.3.png": 8,
    "cards/8.4.png": 8,
    "cards/9.1.png": 9,
    "cards/9.2.png": 9,
    "cards/9.3.png": 9,
    "cards/9.4.png": 9,
    "cards/10.1.png": 10,
    "cards/10.2.png": 10,
    "cards/10.3.png": 10,
    "cards/10.4.png": 10,
    "cards/J1.png": 10,
    "cards/J2.png": 10,
    "cards/J3.png": 10,
    "cards/J4.png": 10,
    "cards/Q1.png": 10,
    "cards/Q2.png": 10,
    "cards/Q3.png": 10,
    "cards/Q4.png": 10,
    "cards/K1.png": 10,
    "cards/K2.png": 10,
    "cards/K3.png": 10,
    "cards/K4.png": 10,
    "cards/A1.png": 11,
    "cards/A2.png": 11,
    "cards/A3.png": 11,
    "cards/A4.png": 11,
  };

  Map<String, int> playingCards = {};

  @override
  void initState() {
    super.initState();

    playingCards.addAll(deckOfCards);
  }

  // Reset the round and reset cards
  void startNewRound() {

    _isGameStarted = true;

    // start new round with full deck of cards
    playingCards = {};
    playingCards.addAll(deckOfCards);

    // reset the player and dealer cards
    myCards = [];
    dealersCards = [];

    // Get first random card for dealer
    Random random = Random();
    String cardOneKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));

    // remove the selected first card from the deck of playing cards
    playingCards.removeWhere((key, value) => key == cardOneKey);

    // Get second random card for dealer
    String cardTwoKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));

    // remove the selected second card from the deck of playing cards
    playingCards.removeWhere((key, value) => key == cardTwoKey);

    // Get first random card for player
    String cardThreeKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));

    // remove the third card from the playing cards deck
    playingCards.removeWhere((key, value) => key == cardThreeKey);

    // Get second random card for the player
    String cardFourKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));

    // remove the fourth card from the playing cards deck
    playingCards.removeWhere((key, value) => key == cardFourKey);

    // Assign cards to dealer and player
    dealerFirstCard = cardOneKey;
    dealerSecondCard = cardTwoKey;
    
    playerFirstCard = cardThreeKey;
    playerSecondCard = cardFourKey;

    // Adding dealers cards images to display in the grid view
    dealersCards.add(Image.asset(dealerFirstCard!));
    dealersCards.add(Image.asset(dealerSecondCard!));

    // Adding dealers cards images to display in the grid view
    myCards.add(Image.asset(playerFirstCard!));
    myCards.add(Image.asset(playerSecondCard!));

    // Calculate the score of the dealer and player
    dealerScore = deckOfCards[dealerFirstCard]! + deckOfCards[dealerSecondCard]!;
    playerScore = deckOfCards[playerFirstCard]! + deckOfCards[playerSecondCard]!;

    if (dealerScore <= 16) {

      String cardFiveKey = playingCards.keys.elementAt(random.nextInt(playingCards.length));
      dealersCards.add(Image.asset(cardFiveKey));
      playingCards.removeWhere((key, value) => key == cardFiveKey);
      dealerScore = dealerScore + deckOfCards[cardFiveKey]!;

    }

    setState(() {});
  }

  // Add extra card to player (hit)
  void addCard() {

    if (playingCards.isNotEmpty) {
      Random random = Random();
      String cardKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
      playingCards.removeWhere((key, value) => key == cardKey);
      myCards.add(Image.asset(cardKey));
      playerScore = playerScore + deckOfCards[cardKey]!;
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isGameStarted
          ?  SafeArea(
              child: Column(
                children: [

                  Column(
                    children: [
                      Text("Dealer's score: $dealerScore", style: countStyle),
                      CardGridView(cards: dealersCards)],
                  ),

                  Column(
                    children: [
                      Text("Player's score: $playerScore", style: countStyle),
                      CardGridView(cards: myCards),
                    ],
                  ),

                  IntrinsicWidth(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomButton(onPressed: () => addCard(), label: "Add Card"),
                        CustomButton(onPressed: () => startNewRound(), label: "Next Round")
                      ],
                    ),
                  )
                ],
              ),

          )
          : Center(
              child: CustomButton(onPressed: () => startNewRound(), label: "Start Game",)),
    );
  }
}

