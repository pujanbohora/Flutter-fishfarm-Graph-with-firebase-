import 'package:flutter/material.dart';

class AdminContact extends StatelessWidget {
  const AdminContact({Key? key}) : super(key: key);

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
              label: Text('Action',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Stephen')),
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
