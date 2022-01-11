import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/components/icon_button.dart';
import 'package:jait_jait/page/article/article_saved.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({Key? key}) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
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
        actions: [
          CustomIconButton(
            tooltip: 'Share',
            icon: const Icon(
              Icons.share,
              color: primaryColor,
            ),
            onTap: () {},
          ),
          CustomIconButton(
            tooltip: 'Save',
            icon: const Icon(
              Icons.bookmark_border,
              color: primaryColor,
            ),
            onTap: () => Get.to(const ArticleSaved()),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: Get.height / 2.5,
                        child: Image.asset(
                          'assets/img/articles/article3.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: const [
                            Icon(Icons.favorite_border),
                            SizedBox(width: 10),
                            Text("10.4K"),
                            SizedBox(width: 10),
                            Text(
                              "45 comments",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "3 Hobbies That Can Improve Your Memory",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/img/avatars/avatar1.jpg'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Markham Heid",
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            Text(
                              " • 5 min read • 23 Oct",
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                            "See our winners in the gallery below, and keep reading for every single street style snap we published this week."),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {},
                    splashColor: primaryColor.withOpacity(.1),
                    highlightColor: primaryColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: secondaryColor.withOpacity(.4),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.favorite_border,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        fillColor: secondaryColor.withOpacity(.4),
                        hintText: 'Write a comment',
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomIconButton(
                  tooltip: 'send',
                  icon: Icon(Icons.send),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
