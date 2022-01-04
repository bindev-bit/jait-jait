class Article {
  String imgUrl;
  String newsTitle;
  String subTitle;
  String author;
  String timeRead;
  String date;
  int like;
  String comments;

  Article(this.imgUrl, this.newsTitle, this.subTitle, this.author,
      this.timeRead, this.date, this.like, this.comments);
}

List<Article> listArticles = <Article>[
  Article(
    "assets/img/articles/article1.jpg",
    "The Best Street Style Looks From New York Fashion Week Spring 2022",
    "See our winners in the gallery below, and keep reading for every single street style snap we published this week.",
    "Fashionista",
    "5 min read",
    "Sep 14, 2021",
    105,
    "45 comments",
    //https://fashionista.com/2021/09/best-new-york-fashion-week-street-style-spring-2022
  ),
  Article(
    "assets/img/articles/article2.jpg",
    "7 Easy Yet Fashionable Outfit Ideas Perfect for Eid blabl blabla blablaa",
    "The holiday calls for lots of celebration, and there's no doubt everyone shows up with some of their best outfits.",
    "Yusra Siddiqui",
    "5 min read",
    "May 4, 2021",
    53,
    "35 comments",
    //https://www.whowhatwear.com/eid-outfit-ideas
  ),
  Article(
    "assets/img/articles/article2.jpg",
    "The 18 Best Beauty Looks From Milan Fashion Week Street Style",
    "Among the standout trends we spotted on Milan Fashion Week attendees are plenty of red lipstick.",
    "Stephanie Saltzman",
    "7 min read",
    "Sep 29, 2021",
    32,
    "55 comments",
    //https://fashionista.com/2021/09/beauty-hair-makeup-street-style-mfw-spring-2022
  ),
  Article(
    "assets/img/articles/article1.jpg",
    "The 18 Best Beauty Looks From Milan Fashion Week Street Style",
    "Among the standout trends we spotted on Milan Fashion Week attendees are plenty of red lipstick, soft natural curls, Afros and many fancy headscarves.",
    "Stephanie Saltzman",
    "7 min read",
    "Sep 29, 2021",
    93,
    "15 comments",
    //https://fashionista.com/2021/09/beauty-hair-makeup-street-style-mfw-spring-2022
  ),
  Article(
    "assets/img/articles/article2.jpg",
    "The 18 Best Beauty Looks From Milan Fashion Week Street Style",
    "Among the standout trends we spotted on Milan Fashion Week attendees are plenty of red lipstick, soft natural curls, Afros and many fancy headscarves.",
    "Stephanie Saltzman",
    "7 min read",
    "Sep 29, 2021",
    76,
    "75 comments",
    //https://fashionista.com/2021/09/beauty-hair-makeup-street-style-mfw-spring-2022
  ),
  Article(
    "assets/img/articles/article1.jpg",
    "The 18 Best Beauty Looks From Milan Fashion Week Street Style",
    "Among the standout trends we spotted on Milan Fashion Week attendees are plenty of red lipstick, soft natural curls, Afros and many fancy headscarves.",
    "Stephanie Saltzman",
    "7 min read",
    "Sep 29, 2021",
    88,
    "48 comments",
    //https://fashionista.com/2021/09/beauty-hair-makeup-street-style-mfw-spring-2022
  ),
  Article(
    "assets/img/articles/article2.jpg",
    "The 18 Best Beauty Looks From Milan Fashion Week Street Style",
    "Among the standout trends we spotted on Milan Fashion Week attendees are plenty of red lipstick, soft natural curls, Afros and many fancy headscarves.",
    "Stephanie Saltzman",
    "7 min read",
    "Sep 29, 2021",
    91,
    "15 comments",
    //https://fashionista.com/2021/09/beauty-hair-makeup-street-style-mfw-spring-2022
  ),
];
