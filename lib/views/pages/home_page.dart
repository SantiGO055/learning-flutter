import 'package:flutter/material.dart';
import 'package:flutter_app_test/views/data/constants.dart';
import 'package:flutter_app_test/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          HeroWidget(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic card',
                      style: KTextStyle.titleTealText
                    ),
                    Text("The description of card",
                    style: KTextStyle.descriptionText,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
