import 'package:application/widgets.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("S E T T I N G S"),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(
                  Icons.palette,
                  size: 18,
                ),
                title: Text(
                  "D A R K - T H E M E",
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Theme_Switch(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
