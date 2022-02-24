import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ForthGraph extends StatefulWidget {
  const ForthGraph({Key? key}) : super(key: key);

  @override
  State<ForthGraph> createState() => _ForthGraphState();
}

class _ForthGraphState extends State<ForthGraph> {


  final Future<FirebaseApp> _future = Firebase.initializeApp();
  // late List<_ChartData> data;
  late TooltipBehavior _tooltipBehavior;

  List<GraphData> chart_data = [];

  DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref();
        
  List<GraphData> graph_list = [];
  setGraphList() { 
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      for (var entry in data.entries) {
        GraphData gd = GraphData(id:entry.value['id'], water_level:entry.value['water_level'], time:entry.value['time'], date:entry.value['date']);
        graph_list.add(gd);
      }
      graph_list.sort((a,b) =>  a.id!.compareTo(b.id!));
      

      graph_list = graph_list.sublist(2, 7);
      print(graph_list.length);

    });
  } 

  @override
  void initState() {
    setGraphList();
     _tooltipBehavior = TooltipBehavior(enable: true);
     super.initState();
  }

  // void initState() {
  @override
  Widget build(BuildContext context) {
    // setGraphList();
    return Scaffold(
          body: SafeArea(
              child: Container(
            child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(maximum:5),
                  // zoomPanBehavior: _zoomPanBehavior,
                  title: ChartTitle(text: 'Time and Water Level'),
                  legend: Legend(isVisible: true),
                  // tooltipBehavior: TooltipBehavior(enable: true),
                  series: [
                    LineSeries(
                        dataSource: graph_list,
                        xValueMapper: (GraphData paa, boo) => paa.time,
                        yValueMapper: (GraphData buu, hzz) => buu.water_level,
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                        )
                        
                  ],
                  ),
          )),
          
        );

  
  }
}


class GraphData {
  final int? id;
  final double? water_level;
  final String? time;
  final String? date;

  GraphData( {this.id, this.water_level,  this.time,  this.date});
}




