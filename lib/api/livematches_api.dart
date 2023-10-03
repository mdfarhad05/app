import 'package:app/model/livematches_model.dart' as myAppModel;
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Livematches extends StatelessWidget {
  // Replace this with your API endpoint
  final String apiUrl =
      'https://cricbuzz-cricket.p.rapidapi.com/matches/v1/live';

  const Livematches({Key? key}) : super(key: key);

  Future<void> livematchesfetchdata() async {
    final headers = {
      'X-RapidAPI-Key': 'd0ce67fd29msh53279f5b6f6bbabp1d081ejsna7a8dd32dd1d',
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      // Parse the JSON data using your model
      final parsedData = myAppModel.welcomeFromJson(response.body);

      // Access the "appIndex" and print it
      final typeMatches = parsedData.typeMatches;
      for (var i in typeMatches) {
        var a = i.toJson()['seriesMatches'];
        for (var i in a) {
          var b = i['seriesAdWrapper']['matches'];
          for (var i in b) {
            var c = i;
            print('$c');
            return (c);
          }
        }
      }

      // Now, you can access the parsed data
      print(
          'App Index:  ${typeMatches[0].toJson()['seriesMatches'][0]['seriesAdWrapper']['matches'][0]}');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data Fetcher'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            livematchesfetchdata();
          },
          child: const Text('Live matches'),
        ),
      ),
    );
  }
}
