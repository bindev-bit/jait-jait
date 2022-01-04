import 'package:flutter/material.dart';

class OnBoardingHeader extends StatelessWidget {
  final String title, subTitle;
  const OnBoardingHeader(
      {required this.title, required this.subTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
