import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/components/icon_button.dart';
import 'package:jait_jait/components/message/message_detail.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Messages",
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                    ),
                  ),
                  CustomIconButton(
                    tooltip: 'Search',
                    icon: const Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          ...ListTile.divideTiles(
            color: primaryColor,
            context: context,
            tiles: [
              ListTile(
                onTap: () => Get.to(const MessageDetail()),
                leading: const CircleAvatar(
                  backgroundColor: primaryColor,
                  backgroundImage: AssetImage("assets/img/avatars/avatar1.jpg"),
                ),
                title: const Hero(
                  tag: 'message-name',
                  child: Text(
                    "Dillah Probokusumo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                subtitle: const Text(
                  "You: Terimakasih kak Dillah... • Just Now",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
