import 'package:application/api.dart';
import 'package:application/theme.dart';
import 'package:flutter/material.dart';
import 'package:application/provide.dart';
import 'package:provider/provider.dart';
import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:fl_chart/fl_chart.dart';

BoxDecoration general(BuildContext context) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).colorScheme.secondary);
}

class Graph_clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double w = size.width;
    double h = size.height;

    double ratio = 0.85;
    double curve = 20;

    path.lineTo(w * ratio, h * (1 - ratio));
    path.lineTo(w - curve, h * (1 - ratio));
    path.quadraticBezierTo(w, h * (1 - ratio), w, h * (1 - ratio) + curve);

    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, h * (1 - ratio) + curve);
    path.quadraticBezierTo(0, h * (1 - ratio), curve, h * (1 - ratio));

    path.lineTo(w * (1 - ratio), h * (1 - ratio));
    path.quadraticBezierTo(w / 2, h * -0.1, w * ratio, h * (1 - ratio));

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> old) {
    return false;
  }
}

class Bar_Chart extends StatefulWidget {
  const Bar_Chart({super.key});

  @override
  State<Bar_Chart> createState() => _Bar_ChartState();
}

class _Bar_ChartState extends State<Bar_Chart> {
  List<String> txt = [
    "    Fear",
    "    Sad",
    "       Anger",
    "      Love",
    "           Surprice",
    "    Joy"
  ];
  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width < 400) ? 32 : 64;
    return Consumer<Graphs>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 200,
          child: BarChart(BarChartData(
              minY: 0,
              maxY: 1,
              barGroups: [
                BarChartGroupData(x: 0, barRods: [
                  BarChartRodData(
                      toY: value.arr[0],
                      width: w,
                      borderRadius: BorderRadius.zero)
                ]),
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                      toY: value.arr[1],
                      width: w,
                      borderRadius: BorderRadius.zero)
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(
                      toY: value.arr[2],
                      width: w,
                      borderRadius: BorderRadius.zero)
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(
                      toY: value.arr[3],
                      width: w,
                      borderRadius: BorderRadius.zero)
                ]),
                BarChartGroupData(x: 4, barRods: [
                  BarChartRodData(
                      toY: value.arr[4],
                      width: w,
                      borderRadius: BorderRadius.zero)
                ]),
                BarChartGroupData(x: 5, barRods: [
                  BarChartRodData(
                      toY: value.arr[5],
                      width: w,
                      borderRadius: BorderRadius.zero)
                ]),
              ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    int i = value.toInt();
                    return Transform.rotate(
                        angle: (1.5707963), child: Text(txt[i]));
                  },
                )),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(reservedSize: 30, showTitles: true)),
              ),
              gridData: FlGridData(show: false))),
        ),
      ),
    );
  }
}

FluentUiEmojiIcon Emoji(int val) {
  if (val == 0)
    return FluentUiEmojiIcon(w: 150, h: 150, fl: Fluents.flSadButRelievedFace);
  else if (val == 1)
    return FluentUiEmojiIcon(w: 150, h: 150, fl: Fluents.flDisappointedFace);
  else if (val == 2)
    return FluentUiEmojiIcon(w: 150, h: 150, fl: Fluents.flAngryFace);
  else if (val == 3)
    return FluentUiEmojiIcon(
        w: 150, h: 150, fl: Fluents.flSmilingFaceWithHeartEyes);
  else if (val == 4)
    return FluentUiEmojiIcon(w: 150, h: 150, fl: Fluents.flAstonishedFace);
  else
    return FluentUiEmojiIcon(
        w: 150, h: 150, fl: Fluents.flGrinningFaceWithSmilingEyes);
}

final TextEditingController text = TextEditingController();

class TextBox extends StatelessWidget {
  const TextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: general(context),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          controller: text,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          cursorColor: Theme.of(context).colorScheme.tertiary,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey.shade700),
            hintText: "What's on your mind?",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class Analysis extends StatefulWidget {
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: MaterialButton(
        height: 60,
        color: Color.fromRGBO(255, 161, 73, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              });
          List<double> res = await getResult(text.text);
          Provider.of<Graphs>(context, listen: false).Change_Array(res);
          Navigator.of(context).pop();
        },
        child: Text(
          "A N A L Y S I S",
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  String val = "";
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MediaQuery.of(context).size.width < 400 ? Graph_clip() : null,
      child: Container(
          height: 500,
          decoration: general(context),
          child: Consumer<Graphs>(
            builder: (context, value, child) => Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Emoji(value.index),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Class_Text(),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Bar_Chart(),
                ],
              ),
            ),
          )),
    );
  }
}

class Drawer_Elements extends StatelessWidget {
  const Drawer_Elements({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: ListView(
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.secondary,
              size: 100,
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 20,
              ),
              title: Text(
                "S E T T I N G S",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark,
                size: 20,
              ),
              title: Text(
                "A B O U T",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
            )
          ],
        ),
      ),
    );
  }
}

class Theme_Switch extends StatefulWidget {
  const Theme_Switch({super.key});

  @override
  State<Theme_Switch> createState() => _Theme_SwitchState();
}

class _Theme_SwitchState extends State<Theme_Switch> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<Theme_Manager>(context);
    return Transform.scale(
      scaleX: 0.8,
      scaleY: 0.8,
      child: Switch(
        activeColor: Theme.of(context).colorScheme.tertiary,
        activeTrackColor: Color.fromRGBO(30, 144, 255, 1),
        value: currentTheme.themeData == Dark_Theme,
        onChanged: (bool newVal) {
          Provider.of<Theme_Manager>(context, listen: false)
              .ChangeTheme(newVal);
        },
      ),
    );
  }
}

class Class_Text extends StatefulWidget {
  const Class_Text({super.key});

  @override
  State<Class_Text> createState() => _Class_TextState();
}

class _Class_TextState extends State<Class_Text> {
  List<String> Emotions = ["Fear", "Sad", "Anger", "Love", "Surprise", "Joy"];
  @override
  Widget build(BuildContext context) {
    return Consumer<Graphs>(
      builder: (context, value, child) => Container(
        height: 50,
        child: Center(
          child: Text(
            value.index > -1 ? Emotions[value.index] : Emotions[5],
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
