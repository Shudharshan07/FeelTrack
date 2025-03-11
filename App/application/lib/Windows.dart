import 'package:application/provide.dart';
import 'package:flutter/material.dart';
import 'package:application/widgets.dart';

class Windows extends StatelessWidget {
  const Windows({super.key});

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "F E E L - T R A C K",
          style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary, fontSize: 22),
        ),
        titleSpacing: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 210, child: Drawer_Elements()),
            Padding(padding: EdgeInsets.only(right: 20)),
            SizedBox(
              width: 500,
              child: ListView(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: TextBox()),
                  Padding(padding: EdgeInsets.only(bottom: 12)),
                  Analysis(),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 20)),
            SizedBox(width: 470, child: ListView(children: [Graph()])),
          ],
        ),
      ),
    );
  }
}
