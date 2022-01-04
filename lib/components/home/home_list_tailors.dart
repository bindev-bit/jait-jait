import 'package:flutter/material.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/model/tailor_model.dart';

class ListTailors extends StatelessWidget {
  const ListTailors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        bottom: 20,
      ),
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(.3),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Flexible(
                child: Text(
                  "Gratis konsultasi dengan penjahit rekomendasi",
                  style: TextStyle(
                    fontSize: 18,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          SizedBox(
            height: 90,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: demoTailor.map((e) => _listAvatars(e)).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listAvatars(dynamic e) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        elevation: 0,
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage(e.image!),
          fit: BoxFit.cover,
          width: 60,
          height: 60,
          child: InkWell(
            onTap: () {},
            splashColor: primaryColor.withOpacity(.1),
            highlightColor: primaryColor.withOpacity(.2),
          ),
        ),
      ),
    );
  }
}
