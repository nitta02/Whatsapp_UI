// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Whats App'),
            actions: [
              Tab(
                child: Icon(CupertinoIcons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              )
            ],
            bottom: TabBar(tabs: [
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.camera),
              ),
              Tab(child: Text('Chat')),
              Tab(child: Text('Status')),
              Tab(child: Text('Calls')),
            ]),
          ),
          body: TabBarView(children: const [
            Text('Camera'),
            Text('Chat'),
            Text('Status'),
            Text('Calls'),
          ]),
        ));
  }
}
