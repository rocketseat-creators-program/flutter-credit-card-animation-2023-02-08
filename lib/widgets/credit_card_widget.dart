import 'dart:math';

import 'package:flutter/material.dart';

class CreditCardWidget extends StatefulWidget {
  const CreditCardWidget({super.key});

  @override
  State<CreditCardWidget> createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  bool isFront = true;
  double angle = 0;

  Widget _buildCardFront() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(angle / 180 * pi),
      child: Image.asset('assets/images/card-front.png'),
    );
  }

  Widget _buildCardBack() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(
          angle / 180 * pi,
        ),
      child: Image.asset('assets/images/card-back.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              angle += details.delta.dy;
              angle %= 360;
              isFront = (angle <= 90 || angle >= 270);
            });
          },
          child: isFront ? _buildCardFront() : _buildCardBack(),
        ),
      ),
    );
  }
}
