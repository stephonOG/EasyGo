import 'package:flutter/material.dart';
import 'package:theo/main/help.dart';
import 'package:theo/main/my_booking.dart';

import 'main/home.dart';
class Dashboard extends StatefulWidget {
  int indexing;

  Dashboard({
    this.indexing = 0,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {

  int? page;

  Widget currentpages (int index) {
    switch (index) {
      case 0 :
        return new Home();
        break;
      case 1 :
        return new MyBooking();
        break;
      case 2 :
        return new Help();
        break;
      default :
        return new Home();
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    page = widget.indexing;
    super.initState();
  }

  Widget titles(int index) {
    switch (index) {
      case 0 :
        return Text("TicGet");
        break;
      case 1 :
        return Text("My Booking");
        break;
      case 2 :
        return Text("Help");
        break;
    }
    return Text('');
  }
  //https://www.mindinventory.com/mobile-portfolio/bus-ticket-booking-app.php
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: titles(page!),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index){
              setState(() {
                page = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: page!,
            items: [
               BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
               BottomNavigationBarItem(icon: Icon(Icons.list), label: "My Booking"),
               BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Help"),
            ]
        ),
        body: currentpages(page!),
    );
  }

}