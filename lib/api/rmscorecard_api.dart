import 'dart:convert';
import 'package:http/http.dart' as http;

const apiUrl =
    'https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/40381/hscard';
const accessKey = 'd0ce67fd29msh53279f5b6f6bbabp1d081ejsna7a8dd32dd1dw';

class Welcome {
  final String scoreCard;
  final String matchHeader;

  Welcome({required this.scoreCard, required this.matchHeader});

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      scoreCard: json['scoreCard'] as String,
      matchHeader: json['matchHeader'] as String,
    );
  }
}

Future<Welcome> fetchApiData() async {
  final response = await http.get(Uri.parse('$apiUrl?access_key=$accessKey'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final Welcome welcome = Welcome.fromJson(jsonData);
    return welcome;
  } else {
    throw Exception('Failed to load API data');
  }
}

void main() async {
  try {
    final apiData = await fetchApiData();
    print('ScoreCard: ${apiData.scoreCard}');
    print('MatchHeader: ${apiData.matchHeader}');
    // Print other relevant data as needed
  } catch (e) {
    print('Error: $e');
  }
}
