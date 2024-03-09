// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui/constants/callsTab_constants/calls_subtitles.dart';
import 'package:whatsapp_ui/constants/profile_image_constants.dart';
import 'package:whatsapp_ui/constants/statuesTab_constants/status_subtites.dart';
import 'package:whatsapp_ui/constants/subtitle_constants.dart';
import 'package:whatsapp_ui/constants/title_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userImage;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Whats App'),
            backgroundColor: Colors.green,
            actions: [
              Tab(
                child: Icon(CupertinoIcons.search),
              ),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                  icon: Icon(Icons.more_horiz_outlined),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text('New Group'),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text('Settings'),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Text('Logout'),
                        ),
                      ])
            ],
            bottom: TabBar(
                indicatorColor: Colors.black,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                tabs: const [
                  Tab(child: Text('Camera')),
                  Tab(child: Text('Chat')),
                  Tab(child: Text('Status')),
                  Tab(child: Text('Calls')),
                ]),
          ),
          body: TabBarView(children: [
            Center(
              child: IconButton(
                onPressed: () {
                  //For picking up the images from the camera
                  pickImagefromCamera();
                },
                icon: Icon(
                  CupertinoIcons.camera_circle_fill,
                  size: 100,
                ),
              ),
            ),
            _chatTaB(),
            _statusTaB(),
            _callTaB(),
          ]),
        ));
  }

  ListView _callTaB() {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(personImages[index]),
          ),
          title: Text(personNames[index]),
          subtitle: Text(
              index / 2 == 0 ? callsubTiltess[index] : 'Missed Video Call'),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(index / 2 == 0 ? Icons.call : Icons.video_call),
          ),
        );
      },
    );
  }

  ListView _statusTaB() {
    return ListView.builder(
      itemCount: personImages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.0),
                border: Border.all(
                  width: 3,
                  color: Colors.green,
                )),
            child: CircleAvatar(
              backgroundImage: AssetImage(personImages[index]),
            ),
          ),
          title: Text(personNames[index]),
          subtitle: Text(subTiltess[index]),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          ),
        );
      },
    );
  }

  ListView _chatTaB() {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(personImages[index]),
          ),
          title: Text(personNames[index]),
          subtitle: Text(subTiltes[index]),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.message),
          ),
        );
      },
    );
  }

  //For picking up the images from the camera
  Future pickImagefromCamera() async {
    final ImagePicker picker = ImagePicker();
// click an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      userImage = image!.path;
    });
  }
}
