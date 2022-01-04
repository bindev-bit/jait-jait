import 'package:flutter/material.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/model/article_model.dart';

class ListArticles extends StatelessWidget {
  const ListArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Artikel Populer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4.0),
                  splashColor: primaryColor.withOpacity(.1),
                  highlightColor: primaryColor.withOpacity(.2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 6,
                    ),
                    child: Text(
                      "Lihat semua",
                      style: TextStyle(color: primaryColor.withOpacity(.4)),
                    ),
                  ),
                )
              ],
            ),
          ),
          ...listArticles.map((e) => _articles(e)),
        ],
      ),
    );
  }

  Widget _articles(Article e) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        splashColor: primaryColor.withOpacity(.1),
        highlightColor: primaryColor.withOpacity(.2),
        onTap: () {},
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
