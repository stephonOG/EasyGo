import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:theo/otherScreens/seats_page.dart';

class SelectFlight extends StatefulWidget {
  const SelectFlight({Key? key}) : super(key: key);

  @override
  State<SelectFlight> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Select Flight"),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            children: [
              FlightCard(),
              FlightCard(),
              FlightCard(),

            ],
          ),
          )

        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  const FlightCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(_)=>SeatsGridPage(flight: true,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 5, spreadRadius: 0, offset: Offset(0,4), color: Color.fromRGBO(0, 0, 0, 0.25))
          ]
        ),
        // width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Accra',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                          SizedBox(width: 10,),
                          Text('Price: GHC 48.00'),
                        ],
                      ),
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Text('Tue 26 Jul 2022',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
                          ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kumasi',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Text('Tue 26 Jul 2022',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
                          ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('18:50 PM',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
                  SizedBox(width: 10,),


                  Icon(Icons.airplanemode_active_outlined),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,

                    ),
                  ),
                  Icon(Icons.my_location_rounded),

                  SizedBox(width: 10,),


                  Text('19:35 PM',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}


