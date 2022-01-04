import 'package:flutter/material.dart';
import 'package:jait_jait/components/home/home_appbar.dart';
import 'package:jait_jait/components/home/home_articles.dart';
import 'package:jait_jait/components/home/home_category.dart';
import 'package:jait_jait/components/home/home_list_tailors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HomeAppBar(),
              ListTailors(),
              ListCategory(),
              ListArticles(),
            ],
          ),
        ),
      ),
    );
  }
}
