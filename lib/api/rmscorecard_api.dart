import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Scorecard {
// class Scorecard extends StatelessWidget {
  // final String variable;

  // const Scorecard({super.key, required this.variable});

  final String baseUrl =
      'https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/'; // Replace with your API base URL

  // Function to fetch an image by its ID
  Future<List<Map<String, dynamic>>> ScorecardefetchData(
      matchId, innings) async {
    final headers = {
      'X-RapidAPI-Key': 'ff7d38eb1bmsh5d9438c790492dfp14a9f4jsnfc3dbebe68fa',
    };

    final response = await http.get(
        Uri.parse('${baseUrl + matchId.toString()}/hscard'),
        headers: headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> scorecard = json.decode(response.body);

      // Extract team scorecard from the API response
      List<Map<String, dynamic>> teamDataList = [];
      for (var matchType in scorecard['scoreCard']) {
        if (matchType['inningsId'] == innings) {
          final scards = matchType['batTeamDetails']['batsmenData'];
          for (var batsman = 1; batsman < 12; batsman++) {
            String batName = scards['bat_$batsman']['batName'];
            String outDesc = scards['bat_$batsman']['outDesc'];
            int runs = scards['bat_$batsman']['runs'];
            int balls = scards['bat_$batsman']['balls'];

            Map<String, dynamic> teamData = {
              'batName': batName,
              'outDesc': outDesc,
              'runs': runs,
              'balls': balls,
            };

            teamDataList.add(teamData);
          }
        }
      }
      return teamDataList;
    } else {
      throw Exception('Failed to load API data');
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: FutureBuilder<List<Map<String, dynamic>>>(
  //       future: ScorecardefetchData(variable),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(child: CircularProgressIndicator());
  //         } else if (snapshot.hasError) {
  //           return Center(child: Text('scorecard: ${snapshot.error}'));
  //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //           return Center(child: Text('No scorecard available.'));
  //         } else {
  //           return ListView.builder(
  //             itemCount: snapshot.data!.length,
  //             itemBuilder: (context, index) {
  //               var teamData = snapshot.data![index];
  //               var batName = teamData['batName'];
  //               var outdecs = teamData['outDesc'];
  //               var runs = teamData['runs'];
  //               var balls = teamData['balls'];
  //               // var team1Image = teamData['team1Image'];
  //               // var team2Image = teamData['team2Image'];

  //               return ListTile(
  // title: Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text('Bat Name: $batName'),
  //         Text('Out Description: $outdecs'),
  //       ],
  //     ),
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text('Runs: $runs'),
  //         Text('Balls: $balls'),
  //       ],
  //     ),
  //   ],
  // ),
  // );
  //             },
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
}
