import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:jait_jait/components/icon_button.dart';
import 'package:jait_jait/components/message/message_detail.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:jait_jait/page/home/screen/list_user.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  bool _error = false;
  bool _initialized = false;
  User? _user;

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        setState(() {
          _user = user;
        });
      });
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  final colors = [
    Color(0xffff6767),
    Color(0xff66e0da),
    Color(0xfff5a2d9),
    Color(0xfff0c722),
    Color(0xff6a85e5),
    Color(0xfffd9a6f),
    Color(0xff92db6e),
    Color(0xff73b8e5),
    Color(0xfffd7590),
    Color(0xffc78ae5),
  ];

  Color getUserAvatarNameColor(types.User user) {
    final index = user.id.hashCode % colors.length;
    return colors[index];
  }

  Widget _buildAvatar(types.Room room) {
    var color = Colors.transparent;

    if (room.type == types.RoomType.direct) {
      try {
        final otherUser = room.users.firstWhere(
          (u) => u.id != _user!.uid,
        );

        color = getUserAvatarNameColor(otherUser);
      } catch (e) {
        // Do nothing if other user is not found
      }
    }

    final hasImage = room.imageUrl != null;
    final name = room.name ?? '';

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage: hasImage ? NetworkImage(room.imageUrl!) : null,
        radius: 20,
        child: !hasImage
            ? Text(
                name.isEmpty ? '' : name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container();
    }

    if (!_initialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.add),
        //     onPressed: _user == null
        //         ? null
        //         : () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           fullscreenDialog: true,
        //           builder: (context) => const UsersPage(),
        //         ),
        //       );
        //     },
        //   ),
        // ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text('Rooms'),
      ),
      body: StreamBuilder<List<types.Room>>(
        stream: FirebaseChatCore.instance.rooms(),
        initialData: const [],
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                bottom: 200,
              ),
              child: const Text('No rooms'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final room = snapshot.data![index];
              return GestureDetector(
                onTap: () => Get.to(ChatPage(room: room)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      _buildAvatar(room),
                      Text(room.name ?? ''),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);
  final colors = [
    Color(0xffff6767),
    Color(0xff66e0da),
    Color(0xfff5a2d9),
    Color(0xfff0c722),
    Color(0xff6a85e5),
    Color(0xfffd9a6f),
    Color(0xff92db6e),
    Color(0xff73b8e5),
    Color(0xfffd7590),
    Color(0xffc78ae5),
  ];
  void _handlePressed(types.User otherUser, BuildContext context) async {
    final room = await FirebaseChatCore.instance.createRoom(otherUser);

    Navigator.of(context).pop();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatPage(
          room: room,
        ),
      ),
    );
  }

  Color getUserAvatarNameColor(types.User user) {
    final index = user.id.hashCode % colors.length;
    return colors[index];
  }

  Widget _buildAvatar(types.User user) {
    final color = getUserAvatarNameColor(user);
    final hasImage = user.imageUrl != null;
    final name = user.firstName;

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage: hasImage ? NetworkImage(user.imageUrl!) : null,
        radius: 20,
        child: !hasImage
            ? Text(
                name!.isEmpty ? '' : name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () => Get.to(UsersPage()),
          child: const Icon(Icons.add),
        ),
      ),
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
          Expanded(
            child: StreamBuilder<List<types.Room>>(
              stream: FirebaseChatCore.instance.rooms(),
              initialData: const [],
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      bottom: 200,
                    ),
                    child: const Text('No rooms'),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final room = snapshot.data![index];
                    return ListTile(
                      onTap: () => Get.to(MessageDetail(
                        room: room,
                      )),
                      leading: CircleAvatar(
                        backgroundColor: primaryColor,
                        backgroundImage: NetworkImage(room.users[1].imageUrl!),
                      ),
                      title: Hero(
                        tag: 'message-${room.users[1].firstName}',
                        child: Text(
                          room.users[1].firstName!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
