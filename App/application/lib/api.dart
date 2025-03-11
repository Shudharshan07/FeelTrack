import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<double>> getResult(String text) async {
  final input = Uri.encodeComponent(text);
  final url =
      Uri.parse("https://tone-api-pfmh.onrender.com/predict?input=$input");
  final result = await http.get(url);
  try {
    if (result.statusCode == 200) {
      final data = jsonDecode(result.body);
      List<dynamic> res = data['prediction'];
      List<double> resultList = res.cast<double>();
      return resultList;
    } else {
      print("late");
    }

    return [];
  } catch (e) {
    print("");
    return [];
  }
}
