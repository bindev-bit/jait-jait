import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/components/icon_button.dart';
import 'package:jait_jait/data/model/article_model.dart';

import 'article_detail.dart';

class ArticleSaved extends StatefulWidget {
  const ArticleSaved({Key? key}) : super(key: key);

  @override
  _ArticleSavedState createState() => _ArticleSavedState();
}

class _ArticleSavedState extends State<ArticleSaved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Saved",
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
        leading: Hero(
          tag: 'back-button',
          child: CustomIconButton(
            tooltip: 'Back',
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: primaryColor,
            ),
            onTap: () => Get.back(),
          ),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ...listArticles.map((e) => _articles(e)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _articles(Article e) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        splashColor: primaryColor.withOpacity(.1),
        highlightColor: primaryColor.withOpacity(.2),
        onTap: () => Get.to(const ArticleDetail()),
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: secondaryColor.withOpacity(.2),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: e.author,
                            style: const TextStyle(
                              fontSize: 14,
                              color: primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: " • ${e.timeRead} • ",
                          ),
                          TextSpan(
                            text: e.date,
                          ),
                        ],
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        e.newsTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      e.subTitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    e.imgUrl,
                    fit: BoxFit.fitHeight,
                    height: 120,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
