import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/data/model/tailor_model.dart';
import 'package:jait_jait/page/tailor/tailor_detail.dart';

import '../icon_button.dart';

class MessageDetail extends StatelessWidget {
  const MessageDetail({Key? key}) : super(key: key);

  static const styleSomebody = BubbleStyle(
    nip: BubbleNip.leftCenter,
    color: Colors.white,
    borderWidth: 1,
    margin: BubbleEdges.only(top: 8, right: 50),
    alignment: Alignment.topLeft,
  );

  static const styleMe = BubbleStyle(
    nip: BubbleNip.rightCenter,
    color: secondaryColor,
    borderWidth: 1,
    margin: BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );

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
                  Row(
                    children: [
                      Hero(
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
                      const SizedBox(width: 10),
                      Hero(
                        tag: 'message-name',
                        child: GestureDetector(
                          onTap: () => Get.to(DetailUser(demoTailor[1])),
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Dillah Probokusumo",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomIconButton(
                        tooltip: 'Call',
                        icon: const Icon(
                          Icons.call_outlined,
                          color: primaryColor,
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      CustomIconButton(
                        tooltip: 'Video Call',
                        icon: const Icon(
                          Icons.video_call_outlined,
                          color: primaryColor,
                        ),
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.1),
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          "Tue 12.30",
                        ),
                      ),
                      _listMessage(),
                      // _bubble(
                      //   msg: 'Halo Dhila, ada yang bisa dibantu ?',
                      //   img: 'assets/img/avatars/avatars3.jpg',
                      // ),
                      // _bubble(
                      //   msg:
                      //       'Halo kak Dillah! aku mau tanya-tanya nih soal reworked baju, tapi aku mau nunjukin detailnya di video call boleh ya kak? supaya jelas aja gitu hehe.',
                      //   img: 'assets/img/avatars/avatars1.jpg',
                      //   isSender: true,
                      // ),
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
                        Icons.add,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
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
                        Icons.attach_file,
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
                        hintText: 'Type your message . . .',
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
                        Icons.keyboard_voice,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Bubble(
            style: styleSomebody,
            child: const Text(
                'Hi Jason. Sorry to bother you. I have a queston for you.'),
          ),
          Bubble(
            style: styleMe,
            child: const Text("Whats'up?"),
          ),
          Bubble(
            style: styleSomebody,
            child: const Text("I've been having a problem with my computer."),
          ),
          Bubble(
            style: styleSomebody,
            margin: const BubbleEdges.only(top: 4),
            showNip: false,
            child: const Text('Can you help me?'),
          ),
          Bubble(
            style: styleMe,
            child: const Text('Ok'),
          ),
          Bubble(
            style: styleMe,
            showNip: false,
            margin: const BubbleEdges.only(top: 4),
            child: const Text("What's the problem?"),
          ),
        ],
      ),
    );
  }

  Widget _bubble({
    required String msg,
    required String img,
    bool isSender = false,
  }) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [],
    );
  }
}
