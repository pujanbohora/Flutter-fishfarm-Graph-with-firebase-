import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SecondGraph extends StatefulWidget {
  const SecondGraph({Key? key}) : super(key: key);

  @override
  State<SecondGraph> createState() => _SecondGraphState();
}

class _SecondGraphState extends State<SecondGraph> {


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
        GraphData gd = GraphData(id:entry.value['id'], ph:entry.value['ph'], time:entry.value['time'], date:entry.value['date']);
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
    return Scaffold(
          body: SafeArea(
              child: Container(
            child: SfCartesianChart( 
                  primaryXAxis: CategoryAxis(maximumLabels:5),
                  // zoomPanBehavior: _zoomPanBehavior,
                  title: ChartTitle(text: 'Time and pH value'),
                  // legend: Legend(isVisible: true),
                  // tooltipBehavior: TooltipBehavior(enable: true),
                  series: [
                    LineSeries(
                        dataSource: graph_list,
                        xValueMapper: (GraphData paa, boo) => paa.time,
                        yValueMapper: (GraphData buu, hzz) => buu.ph,
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
  final double? ph;
  final String? time;
  final String? date;

  GraphData( {this.id, this.ph,  this.time,  this.date});
}




