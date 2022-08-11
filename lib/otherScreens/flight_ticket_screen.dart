import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ticket_widget/ticket_widget.dart';


class FlightTicketScreen extends StatefulWidget {
  const FlightTicketScreen({Key? key}) : super(key: key);

  @override
  State<FlightTicketScreen> createState() => _FlightTicketScreenState();
}

class _FlightTicketScreenState extends State<FlightTicketScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor('#F2F4F8'),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flight Ticket"),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Plane number',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                          SizedBox(height: 10,),
                          Text('GS-22345-5435',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Agency',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                          SizedBox(height: 10,),
                          Text('Emirates',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total price',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                          SizedBox(height: 10,),
                          Text('GHC 500.00',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ],
                ),



                SizedBox(height: 20,),
                // flignt ticket
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: HexColor('#2B5AB5'),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TicketWidget(
                    width: 350,
                    height: 250,
                    isCornerRounded: true,
                    padding: EdgeInsets.all(20),
                    child: TicketData(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: HexColor('#ffffff'),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Flight Journey',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                      SizedBox(height: 20,),
                      Container(
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('20:00',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                    Text('Thu, 1 Apr',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: HexColor('#A0A0A0')),),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('5:00 Hrs',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: HexColor('#2B5AB5')),),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('01:20',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                    Text('Thu, 1 Apr',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: HexColor('#A0A0A0')),),

                                  ],
                                ),
                              ],

                            ),
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 11),
                                      child: Column(
                                        children: List.generate(height~/30, (index) => Expanded(
                                          child: Container(
                                            color: index%2==0?Colors.transparent
                                                :Colors.grey[300],
                                            width: 2,
                                          ),
                                        )),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: HexColor('#2B5AB5'),
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                          child:  Center(
                                            child: Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#ffffff'),
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: HexColor('#2B5AB5'),
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                        ),

                                    ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Kumasi',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                        Text('Kumasi Airport',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: HexColor('#A0A0A0')),),

                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Accra',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                        Text('Kotoka Airport',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: HexColor('#A0A0A0')),),

                                      ],
                                    ),
                                  ],

                                ),
                              ],
                            ),
                          ],
                        ),
                      )


              ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class TicketData extends StatelessWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Full Name',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 10,),

                SizedBox(
                  width: MediaQuery.of(context).size.width/3.5,
                    child: Text('Baba Jamal Nasir Abdul',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),)),


              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Seat Place',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 10,),

                SizedBox(
                  width: MediaQuery.of(context).size.width/3.5,
                    child: Text('Exec 5 / Seat 7A',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),)),


              ],
            ),
          ],
        ),
        Row(
          children: List.generate(width~/10, (index) => Expanded(
            child: Container(
              color: index%2==0?Colors.transparent
                  :Colors.grey[300],
              height: 1,
            ),
          )),
        ),
        Container(
          height: 70,
          child: Center(
            child: BarcodeWidget(
              barcode: Barcode.code128(), // Barcode type and settings
              data: 'Booking Code G459FG54', //
              width: 200,// Content
              height: 70,
            ),
          ),
        )

      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
