import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/components/icon_button.dart';
import 'package:jait_jait/data/model/tailor_model.dart';
import 'package:jait_jait/page/tailor/screen/janji_screen.dart';
import 'package:jait_jait/page/tailor/screen/konsultasi_screen.dart';

class DetailUser extends StatefulWidget {
  final TailorModel tailor;
  const DetailUser(this.tailor, {Key? key}) : super(key: key);

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  int _currentIndex = 0;

  VoidCallback _tapBadge(int index) {
    return () {
      setState(() {
        _currentIndex = index;
      });
    };
  }

  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;

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
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Scrollbar(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: 'detail-tailor-${widget.tailor.name}',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: secondaryColor.withOpacity(.4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(widget.tailor.image!),
                                  radius: 30,
                                  backgroundColor: primaryColor,
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
                                        widget.tailor.name!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        widget.tailor.speciality!,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            initialRating: widget.tailor.rating!
                                                .toDouble(),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const [
                                Text(
                                  "Tentang",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Dillah Probokusumo merupakan TikToker, Model dan juga Beauty vlogger asal Jakarta. Dia menekuni dunia fashion mulai dari 2014. Dillah sudah banyak menangangin permintaan jahit baju yang cukup sulit dengan desain yang unik. Saat ini ia menekuni bidang reworked fashion dan menerima pesanan jahit modifikasi pakaian.",
                                  style: TextStyle(
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Spesialisasi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: secondaryColor,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Reworked Pakaian',
                                          style: TextStyle(
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: _customBadge(
                                        'Konsultasi Online',
                                        active:
                                            _currentIndex == 0 ? true : false,
                                        onTap: _tapBadge(0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: _customBadge(
                                        'Janji Temu',
                                        active:
                                            _currentIndex == 1 ? true : false,
                                        onTap: _tapBadge(1),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: _customBadge(
                                        'Portfolio',
                                        active:
                                            _currentIndex == 2 ? true : false,
                                        onTap: _tapBadge(2),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: _customBadge(
                                        'Review',
                                        active:
                                            _currentIndex == 3 ? true : false,
                                        onTap: _tapBadge(3),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Offstage(
                      offstage: _currentIndex != 0,
                      child: const KonsultasiScreen(),
                    ),
                    Offstage(
                      offstage: _currentIndex != 1,
                      child: JanjiTemuScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Offstage(
              offstage: _currentIndex == 0 || _currentIndex == 1 ? false : true,
              child: ElevatedButton(
                child: _currentIndex == 0
                    ? Text("Chat Sekarang")
                    : Text("Buat Janji"),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _customBadge(String name,
      {required bool active, required VoidCallback onTap}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: active ? primaryColor : secondaryColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: active ? secondaryColor : primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
