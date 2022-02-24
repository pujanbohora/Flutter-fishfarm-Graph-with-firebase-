import 'package:fish_farm/auth/admin/screen/add_services.dart';
import 'package:fish_farm/auth/admin/screen/add_special_offers.dart';
import 'package:fish_farm/auth/admin/screen/admin_appointment.dart';
import 'package:fish_farm/auth/admin/screen/admin_contact.dart';
import 'package:fish_farm/auth/admin/screen/admin_services.dart';
import 'package:fish_farm/auth/admin/screen/admin_special_offers.dart';
import 'package:fish_farm/auth/constants_colors.dart';
import 'package:flutter/material.dart';

class AdminSideNavWidget extends StatefulWidget {
  AdminSideNavWidget({Key? key}) : super(key: key);

  @override
  State<AdminSideNavWidget> createState() => _AdminSideNavWidgetState();
}

class _AdminSideNavWidgetState extends State<AdminSideNavWidget> {
  int currentIndex = 0;

  changePageIndex(int changedIndex) {
    setState(() {
      currentIndex = changedIndex;
    });
  }

  List<String> navigationTitles = [
    'Add Service',
    'Add Special Offers',
    'Admin Contact',
    'Admin Appointment',
    'Admin Services',
    "Admin Special Offers"
  ];

  List<Widget> navigationPages = [
    AddServices(),
    AddSpecialServices(),
    AdminContact(),
    AdminAppointment(),
    AdminService(),
    AdminSpecialServices()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          navigationTitles[currentIndex],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: CustomColors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: navigationPages[currentIndex],
      drawer: Drawer(
        child: Container(
          color: CustomColors.white,
          width: 300,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Beauty World',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 10, 9)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: CustomColors.greyDark,
                height: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: (() => Navigator.pop(context)),
                          child: NavTitle(
                            index: 0,
                            title: 'Add Service',
                            currentIndex: currentIndex,
                            changePageIndex: changePageIndex,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        NavTitle(
                            title: 'Add Special Offers',
                            index: 1,
                            currentIndex: currentIndex,
                            changePageIndex: changePageIndex),
                        const SizedBox(
                          height: 10,
                        ),
                        NavTitle(
                            title: 'Admin Contact',
                            index: 2,
                            currentIndex: currentIndex,
                            changePageIndex: changePageIndex),
                        const SizedBox(
                          height: 10,
                        ),
                        NavTitle(
                            title: 'Admin Appointment',
                            index: 3,
                            currentIndex: currentIndex,
                            changePageIndex: changePageIndex),
                        const SizedBox(
                          height: 10,
                        ),
                        NavTitle(
                            title: 'Admin Services',
                            index: 4,
                            currentIndex: currentIndex,
                            changePageIndex: changePageIndex),
                        const SizedBox(
                          height: 10,
                        ),
                        NavTitle(
                            title: 'Admin Special Offers',
                            index: 5,
                            currentIndex: currentIndex,
                            changePageIndex: changePageIndex),
                        const SizedBox(
                          height: 30,
                        ),
                        NavTitle(
                            title: 'Log Out',
                            index: 6,
                            currentIndex: currentIndex,
                            changePageIndex: changePageIndex)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavTitle extends StatefulWidget {
  String title;
  int index;
  Function changePageIndex;
  int currentIndex;

  NavTitle(
      {Key? key,
      required this.title,
      required this.index,
      required this.changePageIndex,
      required this.currentIndex})
      : super(key: key);

  @override
  State<NavTitle> createState() => _NavTitleState();
}

class _NavTitleState extends State<NavTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.changePageIndex(widget.index);
            Navigator.pop(context);
          });
        },
        child: widget.currentIndex == widget.index
            ? Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: CustomColors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: CustomColors.white, fontWeight: FontWeight.bold),
                  ),
                ))
            : Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: CustomColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: CustomColors.black, fontWeight: FontWeight.bold),
                  ),
                )),
      ),
    );
  }
}
