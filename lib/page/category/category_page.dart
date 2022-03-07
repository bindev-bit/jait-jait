import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/components/icon_button.dart';
import 'package:jait_jait/data/model/tailor_model.dart';
import 'package:jait_jait/page/tailor/tailor_detail.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  const CategoryPage(this.title, {Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false, // This!
      endDrawer: Drawer(
        child: Container(
          color: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: secondaryColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Filter",
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                _topFilter(),
                const Divider(
                  color: secondaryColor,
                  thickness: 1,
                ),
                _lokasiFilter(),
                const Divider(
                  color: secondaryColor,
                  thickness: 1,
                ),
                _ratingFilter(),
              ],
            ),
          ),
        ),
      ),
      body: _nestedView(),
    );
  }

  Widget _nestedView() {
    return NestedScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, box) => [
        _sliverAppBar(),
      ],
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: tabController,
        children: [
          Scrollbar(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  ...demoTailor.map(
                    (e) => Hero(
                      tag: 'detail-tailor-${e.name}',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: secondaryColor.withOpacity(.4),
                          ),
                          child: InkWell(
                            onTap: () => Get.to(
                              DetailUser(e),
                              duration: const Duration(milliseconds: 800),
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(e.image!),
                                    radius: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          e.name!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          e.speciality!,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating:
                                                  e.rating!.toDouble(),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 18,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: primaryColor,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              "97 Reviews",
                                              style: TextStyle(
                                                color: Colors.amber,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          Container(),
        ],
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 100,
      floating: true,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        CustomIconButton(
          tooltip: 'Search',
          icon: const Icon(
            Icons.search,
            color: primaryColor,
          ),
          onTap: () {},
        ),
        CustomIconButton(
          backgroundColor: Colors.transparent,
          tooltip: 'Filter',
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: primaryColor,
          ),
          onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
        ),
      ],
      title: Hero(
        tag: 'category-${widget.title}',
        child: Material(
          type: MaterialType.transparency,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              color: primaryColor,
            ),
          ),
        ),
      ),
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
      bottom: TabBar(
        labelColor: primaryColor,
        indicatorColor: primaryColor,
        controller: tabController,
        tabs: const [
          Tab(
            text: "Online",
          ),
          Tab(
            text: "Janji temu",
          ),
        ],
      ),
    );
  }

  Widget _badgeFilter(String title, {required bool active}) {
    return Expanded(
      child: AnimatedOpacity(
        opacity: active ? 1.0 : 0.4,
        duration: const Duration(milliseconds: 500),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: secondaryColor,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _topFilter() {
    return Column(
      children: [
        Row(
          children: [
            _badgeFilter('Near me', active: true),
            const SizedBox(
              width: 10,
            ),
            _badgeFilter('Terpopuler', active: false),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _badgeFilter('A - Z', active: false),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _lokasiFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Lokasi",
          style: TextStyle(
            fontSize: 18,
            color: secondaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            _badgeFilter('Bandung', active: true),
            const SizedBox(
              width: 10,
            ),
            _badgeFilter('Jakarta', active: false),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _badgeFilter('Solo', active: false),
            const SizedBox(
              width: 10,
            ),
            _badgeFilter('Sidoarjo', active: false),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(5.0),
              splashColor: Colors.white54,
              child: const Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'See more',
                    style: TextStyle(color: secondaryColor),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _ratingFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Penilaian",
          style: TextStyle(
            fontSize: 18,
            color: secondaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            _badgeFilter('Bintang 5', active: true),
            const SizedBox(
              width: 10,
            ),
            _badgeFilter('Bintang 4 keatas', active: false),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _badgeFilter('Bintang 3 keatas', active: false),
            const SizedBox(
              width: 10,
            ),
            _badgeFilter('Bintang 2 keatas', active: false),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _badgeFilter('Bintang 1 keatas', active: false),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: Container()),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
