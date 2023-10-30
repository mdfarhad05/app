import 'package:flutter/material.dart';
// import 'package:app/api/getimages_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Recentmatches extends StatelessWidget {
  const Recentmatches({super.key});
  // Replace this with your API endpoint
  final String apiUrl =
      'https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent';

  Future<List<Map<String, dynamic>>> recentmatchesfetchData() async {
    final headers = {
      'X-RapidAPI-Key': 'ff7d38eb1bmsh5d9438c790492dfp14a9f4jsnfc3dbebe68fa',
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> matches = json.decode(response.body);

      // Extract team names and images from the API response
      List<Map<String, dynamic>> teamDataList = [];
      for (var matchType in matches['typeMatches']) {
        final seriesMatches = matchType['seriesMatches'] as List<dynamic>;
        for (var seriesMatch in seriesMatches) {
          if (seriesMatch['seriesAdWrapper'] != null) {
            final matches =
                seriesMatch['seriesAdWrapper']['matches'] as List<dynamic>;
            for (var match in matches) {
              final team1Name = match['matchInfo']['team1']['teamSName'];
              final team2Name = match['matchInfo']['team2']['teamSName'];
              final matchId = match['matchInfo']['matchId'];
              // final team1ImageId = match['matchInfo']['team1']['imageId'];
              // final team2ImageId = match['matchInfo']['team2']['imageId'];

              // final team1Image = ImageApi.fetchImageById(team1ImageId);
              // final team2Image = ImageApi.fetchImageById(team2ImageId);

              Map<String, dynamic> teamData = {
                'team1Name': team1Name,
                'team2Name': team2Name,
                'matchId': matchId,
                // 'team1Image': team1Image,
                // 'team2Image': team2Image,
              };

              teamDataList.add(teamData);
            }
          }
        }
      }
      return teamDataList;
    } else {
      throw Exception('Failed to load matches');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: recentmatchesfetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No live matches available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var teamData = snapshot.data![index];
                var team1Name = teamData['team1Name'];
                var team2Name = teamData['team2Name'];
                // var team1Image = teamData['team1Image'];
                // var team2Image = teamData['team2Image'];

                return ListTile(
                  // leading: Image.network(team1Image), // Team 1 image
                  title: Text(team1Name), // Team 1 name
                  subtitle: Text(team2Name), // Team 2 name
                  // trailing: Image.network(team2Image), // Team 2 image
                );
              },
            );
          }
        },
      ),
    );
  }
}
