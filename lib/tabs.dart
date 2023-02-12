import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'agenda.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key, required this.appointmentDetails});

  final List<Appointment> appointmentDetails;

  @override
  _Kontroller createState() => _Kontroller();
}

class _Kontroller extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(7)),
              height: 33,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: TabBar(
                    indicatorPadding: EdgeInsets.all(3),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.black87),
                    indicatorColor: Colors.grey.withOpacity(0.2),
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: const [
                      Tab(
                        icon: Icon(
                          Icons.list,
                          size: 32,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.add_home_work_outlined,
                          size: 30,
                        ),
                      ),
                      /*Tab(
                        icon: Icon(Icons.supervisor_account_rounded),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                //Tab1
                CustomAgenda(appointmentDetails: widget.appointmentDetails),
                //Tab2
                Container(),
                //Tab3
                /*Container(
                  color: Colors.transparent,
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
