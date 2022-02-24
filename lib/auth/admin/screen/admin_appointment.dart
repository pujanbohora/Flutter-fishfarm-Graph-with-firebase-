import 'package:fish_farm/auth/constants_colors.dart';
import 'package:fish_farm/auth/screens/contact.dart';
import 'package:flutter/material.dart';

class AdminAppointment extends StatelessWidget {
  const AdminAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: <Widget>[
      DataTable(
        columns: const [
          DataColumn(
              label: Text('Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Phone',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Message',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Appointment date',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Service Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Stylist Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Action',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Stephen')),
            DataCell(Text('Actor')),
            DataCell(Text('Actor')),
            DataCell(Text('Actor')),
            DataCell(Text('Actor')),
            DataCell(Text('Actor')),
            DataCell(Text('Actor')),
            DataCell(
                const Text(
                  "Delete",
                  style: TextStyle(
                      color: Colors.red, decoration: TextDecoration.underline),
                ),
                onTap: () {}),
          ]),
        ],
      ),
    ]);
  }
}
