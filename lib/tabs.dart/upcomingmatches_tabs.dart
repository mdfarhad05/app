import 'package:app/api/upcomingmatches_api.dart';
import 'package:flutter/material.dart';

class UpcominmatchesTab extends StatefulWidget {
  @override
  _UpcomingmatchesTabState createState() => _UpcomingmatchesTabState();
}

class _UpcomingmatchesTabState extends State<UpcominmatchesTab> {
  List<dynamic> liveMatchesData = []; // Store the API data here
  final Upcomingmatches _upcomingmatches = const Upcomingmatches();

  @override
  void initState() {
    super.initState();
    _fetchUpcomingMatches(); // Fetch data when the tab is initialized
  }

  // Function to fetch live match data from Livematches widget
  void _fetchUpcomingMatches() async {
    // Call the instance method to fetch data
    List<Map<String, dynamic>> data =
        await _upcomingmatches.upcomingmatchesfetchData();

    setState(() {
      print('$data');
      liveMatchesData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      child: ListView.separated(
        padding: EdgeInsets.all(15),
        itemCount: liveMatchesData.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.black, // Set the divider line color to black
          height: 1.0, // Adjust the height of the divider line as needed
        ),
        itemBuilder: (context, index) {
          // Extract team data from API data
          // final team1LogoAsset = liveMatchesData[index]['team1Image'];
          // final team2LogoAsset = liveMatchesData[index]['team2Image'];
          final String team1Name = liveMatchesData[index]['team1Name'];
          final String team2Name = liveMatchesData[index]['team2Name'];

          return ListTile(
            title: Row(
              children: [
                // Team 1 Logo
                // FutureBuilder<File>(
                //   future:
                //       team1LogoAsset, // Replace with your actual Future<File> here
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       if (snapshot.hasData) {
                //         return Image.file(
                //           snapshot.data as File,
                //           width: 30, // Adjust the size as needed
                //           height: 30,
                //         );
                //       } else {
                //         return Text('Error');
                //       }
                //     } else {
                //       return CircularProgressIndicator(); // Show a loading indicator while the image is loading.
                //     }
                //   },
                // ),
                SizedBox(width: 10), // Add spacing between logo and name
                // Team 1 Name
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Team 1 Name
                        Text(
                          team1Name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20), // Add spacing between team names
                // Team 2 Name
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          team2Name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add spacing between name and logo
                // Team 2 Logo
                // FutureBuilder<File>(
                //   future:
                //       team2LogoAsset, // Replace with your actual Future<File> here
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       if (snapshot.hasData) {
                //         return Image.file(
                //           snapshot.data as File,
                //           width: 30, // Adjust the size as needed
                //           height: 30,
                //         );
                //       } else {
                //         return Text('Error');
                //       }
                //     } else {
                //       return CircularProgressIndicator(); // Show a loading indicator while the image is loading.
                //     }
                //   },
                // ),

                // Image.file(team2LogoAsset),
              ],
            ),
          );
        },
      ),
    );
  }
}
