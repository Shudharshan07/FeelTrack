import 'package:flutter/material.dart';
import 'package:application/widgets.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
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
      drawer: Drawer(
        width: 250,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Drawer_Elements(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextBox(),
            Padding(padding: EdgeInsets.only(bottom: 12)),
            Analysis(),
            Padding(padding: EdgeInsets.only(bottom: 12)),
            Graph()
          ],
        ),
      ),
    );
  }
}
