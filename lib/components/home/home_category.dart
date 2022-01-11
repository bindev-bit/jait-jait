import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/model/category_model.dart';
import 'package:jait_jait/page/category/category_page.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Semua Kategori",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              const SizedBox(width: 15),
              ...listCategory.map((e) => _category(e)),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ],
    );
  }

  Widget _category(dynamic e) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7FB),
        border: Border.all(color: primaryColor.withOpacity(.5), width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Material(
              type: MaterialType.transparency,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 1),
                    height: 70,
                    width: 70,
                    child: IconButton(
                      icon: Image.asset(e.icon),
                      onPressed: () {},
                    ),
                  ),
                  Hero(
                    tag: 'category-${e.title}',
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        e.title,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox.expand(
            child: InkWell(
              onTap: () => Get.to(
                CategoryPage(e.title),
              ),
            ),
          )
        ],
      ),
    );
  }
}
