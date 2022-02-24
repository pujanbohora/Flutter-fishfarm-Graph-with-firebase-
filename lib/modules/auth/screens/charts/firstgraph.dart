import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:fish_farm/firebase_store/data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:firebase_database/firebase_database.dart';

class FirstGraph extends StatefulWidget {
  const FirstGraph({Key? key}) : super(key: key);

  @override
  State<FirstGraph> createState() => _FirstGraphState();
}

class _FirstGraphState extends State<FirstGraph> {


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
        GraphData gd = GraphData(id:entry.value['id'], temp:entry.value['temp'], time:entry.value['time'], date:entry.value['date'], );
        graph_list.add(gd);
      }
      graph_list.sort((a,b) =>  a.id!.compareTo(b.id!));
      
  
      graph_list = graph_list.sublist(6, 11);
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
    return Scaffold(
          body: SafeArea(
              child: Container(
            child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(maximum:5),
                  // zoomPanBehavior: _zoomPanBehavior,
                  title: ChartTitle(text: 'Time and Temperature value'),
                  // tooltipBehavior: TooltipBehavior(enable: true),
                  series: [
                    ColumnSeries(
                        dataSource: graph_list,
                        xValueMapper: (GraphData paa, boo) => paa.time,
                        yValueMapper: (GraphData buu, hzz) => buu.temp,
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
  final double? temp;
  final String? time;
  final String? date;

  GraphData( {this.id, this.temp,  this.time,  this.date});
}