import 'package:app/widgets/credit_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card Animation'),
        centerTitle: true,
      ),
      body: const CreditCardWidget(),
    );
  }
}
