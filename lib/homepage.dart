import 'package:app/tabs.dart/livematches_tab.dart';
import 'package:app/tabs.dart/recentmatches_tab.dart';
import 'package:app/tabs.dart/upcomingmatches_tabs.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'FORSAY',
          ),
          centerTitle: true),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Material(
              child: Container(
                height: 70,
                color: Colors.white,
                child: TabBar(
                  physics: const ClampingScrollPhysics(),
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  unselectedLabelColor: Colors.deepPurple,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.deepPurple),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.deepPurple, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Live"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.deepPurple, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Upcoming"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.deepPurple, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Recent"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 1st tab
                  livematches(),
                  // 2nd tab
                  upcominmatches(),
                  //3rd tab
                  recentmatches(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
