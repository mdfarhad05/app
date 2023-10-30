import 'package:app/api/rmscorecard_api.dart';
import 'package:flutter/material.dart';

class Scards extends StatefulWidget {
  final String matchId;
  const Scards({super.key, required this.matchId});
  @override
  _ScardsState createState() => _ScardsState();
}

class _ScardsState extends State<Scards> {
  String matchId = "";
  final Scorecard dataFetcher = Scorecard(); // Your data fetching class
  // Scorecard(variable: '40381'); // Your data fetching class
  List<Map<String, dynamic>> firstInningsData = [];
  List<Map<String, dynamic>> secondInningsData = [];

  @override
  void initState() {
    super.initState();
    matchId = widget.matchId;
    fetchData(widget.matchId);
  }

  Future<void> fetchData(matchId) async {
    // Replace with the actual match ID
    final firstInnings = await dataFetcher.ScorecardefetchData(matchId, 1);
    final secondInnings = await dataFetcher.ScorecardefetchData(matchId, 2);

    setState(() {
      firstInningsData = firstInnings;
      secondInningsData = secondInnings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Match Scorecard')),
          bottom: TabBar(
            tabs: [
              Tab(text: 'First Innings'),
              Tab(text: 'Second Innings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildTab(firstInningsData),
            buildTab(secondInningsData),
          ],
        ),
      ),
    );
  }

  Widget buildTab(List<Map<String, dynamic>> data) {
    // Build your tab content using the fetched data
    // Return a Widget that displays the data as you need

    // Assuming 'data' is a List of items you want to display
    return ListView.separated(
      itemCount: data.length, // Replace with the actual number of items
      itemBuilder: (BuildContext context, int index) {
        // Replace this with your item rendering logic
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data[index]['batName']),
                  Text(data[index]['outDesc']),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data[index]['runs']!.toString()),
                  Text(' (${data[index]['balls']!.toString()})'),
                ],
              ),
            ],
          ),
          // Replace with your data structure
          // Add other widgets here to display other information
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        // This widget will be used as a separator between list items
        return Divider();
      },
    );
  }
}
