import 'package:flutter/material.dart';

class CardGridView extends StatelessWidget {
  const CardGridView({
    super.key,
    required this.cards,
  });

  final List<Image> cards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: cards[index],
            );
          }
      ),
    );
  }
}
