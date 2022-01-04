import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  final Widget header;
  final String image;
  final Widget button;
  const OnBoardingScreen(
      {required this.header,
      required this.image,
      required this.button,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            header,
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 80,
                    right: 80,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox.expand(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [.4, 1],
                          colors: [
                            Colors.white10,
                            Colors.white60,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 80,
                    right: 80,
                    child: button,
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
