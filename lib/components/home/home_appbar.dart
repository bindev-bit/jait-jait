import 'package:flutter/material.dart';
import 'package:jait_jait/components/const/color.dart';

import '../icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: primaryColor,
              backgroundImage: AssetImage('assets/img/avatars/avatar1.jpg'),
            ),
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/icon/logo_jaitjait.png',
                width: 120,
              ),
            ),
            CustomIconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
