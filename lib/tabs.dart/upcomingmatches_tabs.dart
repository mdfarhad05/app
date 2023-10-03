import 'package:app/api/upcomingmatches_api.dart';
import 'package:flutter/material.dart';

class upcominmatches extends StatefulWidget {
  @override
  State<upcominmatches> createState() => _upcominmatchesState();
}

class _upcominmatchesState extends State<upcominmatches> {
  @override
  Widget build(BuildContext context) {
    // Create an instance of the Recentmatches class
    Upcomingmatches UpcomingmatchesInstance = Upcomingmatches();

    // Call the instance method
    UpcomingmatchesInstance.upcomingmatchesfetchData();

    return Container(
      color: Colors.deepPurple[300],
      child: ListView.separated(
        padding: EdgeInsets.all(15),
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Chat List $index"),
            trailing: Icon(Icons.arrow_circle_right_sharp),
          );
        },
      ),
    );
  }
}
