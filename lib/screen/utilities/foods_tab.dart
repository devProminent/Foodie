import 'package:flutter/material.dart';

class FoodsTab extends StatelessWidget {
  const FoodsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Image.asset('assets/images/food.png', fit: BoxFit.none),
        Image.asset('assets/images/food1.png', fit: BoxFit.none),
        Image.asset('assets/images/food2.png', fit: BoxFit.none),
        Image.asset('assets/images/food3.png', fit: BoxFit.none),
      ],
    );
  }
}
