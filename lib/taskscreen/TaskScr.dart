import 'package:flutter/material.dart';

class TaskScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.menu),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("Page A"),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Page B"),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: Text("Page C"),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    print("Page 1 Opened.");
                  } else if (value == 1) {
                    print("Page 2 Opened.");
                  } else if (value == 2) {
                    print("Page 3 Opened.");
                  }
                }
                // icon: Icon(Icons.menu),
                // color: Colors.white,
                // itemBuilder: (BuildContext context) {  },

                ),
          ],
        ),
      ),
    );
  }
}
