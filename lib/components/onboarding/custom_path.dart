import 'package:flutter/material.dart';

class OnBoardingPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..moveTo(0, size.height * .33)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height - size.height * .33)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
