import 'package:flutter/material.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/components/home/home_appbar.dart';
import 'package:jait_jait/components/home/home_articles.dart';
import 'package:jait_jait/components/home/home_category.dart';
import 'package:jait_jait/components/home/home_list_tailors.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeScreen(this.scaffoldKey, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            children: [
              HomeAppBar(widget.scaffoldKey),
              const ListTailors(),
              const ListCategory(),
              const ListArticles(),
            ],
          ),
        ),
      ),
    );
  }
}
