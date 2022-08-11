
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ticket_widget/ticket_widget.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double topBarHeight = height * 0.11;
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: HexColor("f4f4f4"),
                width: width,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            height: 38,
                            width: width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(onTap:(){
                                  if(mounted){
                                    setState((){
                                      selectedFilter = 'All';
                                    });
                                  }
                                },child: FilterCard(filterName: 'All', isActive: selectedFilter=='All'?true:false)),
                                InkWell(onTap:(){
                                  if(mounted){
                                    setState((){
                                      selectedFilter = 'Flight';
                                    });
                                  }
                                },child: FilterCard(filterName: 'Flight', isActive: selectedFilter=='Flight'?true:false)),
                                InkWell(onTap:(){
                                  if(mounted){
                                    setState((){
                                      selectedFilter = 'Bus';
                                    });
                                  }
                                },child: FilterCard(filterName: 'Bus', isActive: selectedFilter=='Bus'?true:false,)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // the order details card
                          const OrderDetailsCard(orderStatus: 'active',),
                          const OrderDetailsCard(orderStatus: "active"),
                          const OrderDetailsCard(orderStatus: "complete"),
                          const OrderDetailsCard(orderStatus: "complete"),
                          const OrderDetailsCard(orderStatus: "active"),
                          const OrderDetailsCard(orderStatus: "active"),
                          const OrderDetailsCard(orderStatus: "active"),
                          const OrderDetailsCard(orderStatus: "active"),
                          const OrderDetailsCard(orderStatus: "active"),
                          const OrderDetailsCard(orderStatus: "active"),
                          const OrderDetailsCard(orderStatus: "active"),
                          const OrderDetailsCard(orderStatus: "active"),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}


class FilterCard extends StatelessWidget {
  final String filterName;
  final bool isActive;
  const FilterCard({Key? key, required this.filterName, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 38,
      constraints: const BoxConstraints(minWidth: 104),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isActive ? HexColor('4F4F4F') : HexColor('EBEBEB')),
        color: isActive ? HexColor('4F4F4F') : HexColor('FFFFFF'),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            filterName,
            style: TextStyle(
                fontFamily: 'Gilroy-Medium',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isActive
                    ? HexColor("FFFFFF")
                    : Theme.of(context).textTheme.caption?.color),
          ),
        ),
      ),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  final String orderStatus;
  const OrderDetailsCard({Key? key, required this.orderStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        showModalBottomSheet(context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            builder: (_){
          return ListView(
            children: [

              Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bus number',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),),
                              SizedBox(height: 10,),
                              Text('GS-22345-5435',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Agency',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),),
                              SizedBox(height: 10,),
                              Text('Metro Mass',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
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
                              Text('Total price',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),),
                              SizedBox(height: 10,),
                              Text('GHC 500.00',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
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
                          Text('Bus Journey',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
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
                                            Text('Kuamsi',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                            // Text('Kumasi Airport',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: HexColor('#A0A0A0')),),

                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Accra',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                            // Text('Kotoka Airport',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: HexColor('#A0A0A0')),),

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
          );
        });
      },
      child: Container(
        width: width,
        constraints: const BoxConstraints(minHeight: 150),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: HexColor("FCFCFC"), boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(186, 186, 186, 0.25),
            offset: Offset(
              0,
              2,
            ),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ),
        ]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // orderId and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Ticket id #GG123S3",
                            style: TextStyle(
                                fontFamily: "Gilroy-Medium",
                                fontSize: 14.0,
                                color: HexColor("4F4F4F"),
                                height: 1.1),
                          ),

                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "GHC 500.00",
                            style: TextStyle(
                                fontFamily: "Gilroy-SemiBold",
                                fontSize: 14.0,
                                color:
                                Theme.of(context).textTheme.caption?.color),
                          ),

                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // Date
                  Row(
                    children: [
                      Text(
                        "Booked on Sat, Nov 28",
                        style: TextStyle(
                          color: HexColor("828282"),
                          fontFamily: "Gilroy-Medium",
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(19, 19, 19, 0.4),
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "08:30 PM",
                        style: TextStyle(
                          color: HexColor("828282"),
                          fontFamily: "Gilroy-Medium",
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // Date
                  Row(
                    children: [
                      Text(
                        "Departure Date Mon, Nov 31",
                        style: TextStyle(
                          color: HexColor("828282"),
                          fontFamily: "Gilroy-Medium",
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(19, 19, 19, 0.4),
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "08:30 PM",
                        style: TextStyle(
                          color: HexColor("828282"),
                          fontFamily: "Gilroy-Medium",
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Restaurant location
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: HexColor("C4C4C4"),
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Accra",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.caption?.color,
                          fontFamily: "Gilroy-Medium",
                        ),
                      )
                    ],
                  ),
                  // begin small boxes
                  SizedBox(
                      width: 8,
                      height: 4,
                      child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: -5.0,
                              child: Center(
                                  child: Container(
                                    width: 2,
                                    color: HexColor("dedede"),
                                    height: 4,
                                  )),
                            )
                          ])),

                  SizedBox(
                      width: 8,
                      height: 3,
                      child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: -4.0,
                              child: Center(
                                  child: Container(
                                    width: 2,
                                    color: HexColor("dedede"),
                                    height: 3,
                                  )),
                            )
                          ])),

                  SizedBox(
                      width: 8,
                      height: 3,
                      child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: -2.0,
                              child: Center(
                                  child: Container(
                                    width: 2,
                                    color: HexColor("dedede"),
                                    height: 3,
                                  )),
                            )
                          ])),

                  SizedBox(
                      width: 8,
                      height: 3,
                      child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: -0.0,
                              child: Center(
                                  child: Container(
                                    width: 2,
                                    color: HexColor("dedede"),
                                    height: 3,
                                  )),
                            )
                          ])),
                  SizedBox(
                      width: 8,
                      height: 3,
                      child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: 2.0,
                              child: Center(
                                  child: Container(
                                    width: 2,
                                    color: HexColor("dedede"),
                                    height: 3,
                                  )),
                            )
                          ])),
                  //end small boxes

                  // delivered location
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: HexColor("2F80ED"),
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Kumasi",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.caption?.color,
                          fontFamily: "Gilroy-Medium",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),

          ],
        ),
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
                    child: Text('Seat 7',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),)),


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
