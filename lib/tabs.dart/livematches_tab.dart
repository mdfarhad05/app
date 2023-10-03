import 'package:app/api/livematches_api.dart';
import 'package:flutter/material.dart';

class livematches extends StatefulWidget {
  @override
  State<livematches> createState() => _livematchesState();
}

class _livematchesState extends State<livematches> {
  @override
  Widget build(BuildContext context) {
    // Create an instance of the Recentmatches class
    Livematches livematchesInstance = Livematches();

    // Call the instance method
    livematchesInstance.livematchesfetchdata();

    return Container(
      color: Colors.deepPurple[100],
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
