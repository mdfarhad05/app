import 'package:app/api/recentmatches_api.dart';
import 'package:flutter/material.dart';

class recentmatches extends StatefulWidget {
  @override
  State<recentmatches> createState() => _recentmatchesState();
}

class _recentmatchesState extends State<recentmatches> {
  @override
  Widget build(BuildContext context) {
    // Create an instance of the Recentmatches class
    Recentmatches recentmatchesInstance = Recentmatches();

    // Call the instance method
    recentmatchesInstance.recentmatchesfetchData();

    return Container(
      color: Colors.deepPurple[500],
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
