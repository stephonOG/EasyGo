import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:theo/EasyGoIcons.dart';
import 'package:theo/otherScreens/bus_ticket_screen.dart';
import 'package:theo/otherScreens/flight_ticket_screen.dart';

class PaymentMethod extends StatefulWidget {
  final bool flight;
  const PaymentMethod({Key? key, required this.flight}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool creditCard = false, momo = false, mtn = true;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment method'),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  color: creditCard?HexColor('EBF0FF'):null,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    onTap: (){
                      if(mounted){
                        setState((){
                          creditCard = !creditCard;
                          momo = false;
                        });
                      }
                    },
                    leading: Icon(Icons.credit_card, color: HexColor('#40BFFF'),),
                    title: Text('Credit Card or Debit', style: TextStyle(color: HexColor('#003049')),),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                if(creditCard)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: HexColor('e0e0e0')),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            child: Container(
                              child: TextFormField(
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Theme.of(context).textTheme.bodyText2?.color,letterSpacing: -0.1),
                                  cursorHeight: 20,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                    hintText: "Name on card"
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: width,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: HexColor('e0e0e0')),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            child: Container(
                              child: TextFormField(
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Theme.of(context).textTheme.bodyText2?.color,letterSpacing: -0.1),
                                  cursorHeight: 20,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                    hintText: "Card number"
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (width/2) - 40,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: HexColor('e0e0e0')),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                child: Container(
                                  child: TextFormField(
                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Theme.of(context).textTheme.bodyText2?.color,letterSpacing: -0.1),
                                      cursorHeight: 20,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "DD / MM / YYYY "
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: (width/2) - 40,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: HexColor('e0e0e0')),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                child: Container(
                                  child: TextFormField(
                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Theme.of(context).textTheme.bodyText2?.color,letterSpacing: -0.1),
                                      cursorHeight: 20,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "CVV"
                                      )
                                  ),
                                ),
                              ),
                            ),


                          ],
                        )

                      ],
                    ),
                  ),
                Container(
                  color: momo?HexColor('EBF0FF'):null,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    onTap: (){
                      if(mounted){
                        setState((){
                          momo = !momo;
                          creditCard = false;
                        });
                      }
                    },
                    leading: Icon(EasyGoIcons.mobile, color: HexColor('27AE60'),),
                    title: Text('Mobile Money', style: TextStyle(color: HexColor('#003049')),),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                if(momo)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                if(mounted){
                                  setState((){
                                    mtn = true;
                                  });
                                }
                              },
                              child: Container(
                                width: (width/2) - 40,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: mtn?Colors.blueAccent:Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: !mtn?Border.all(color: HexColor('e0e0e0')):null,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                  child: Center(child: Text('MTN', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: mtn?Colors.white:Colors.black),)),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                if(mounted){
                                  setState((){
                                    mtn = false;
                                  });
                                }
                              },
                              child: Container(
                                width: (width/2) - 40,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: !mtn?Colors.blueAccent:Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: mtn?Border.all(color: HexColor('e0e0e0')):null,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                  child: Center(child: Text('Vodafone', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: !mtn?Colors.white:Colors.black),)),
                                ),
                              ),
                            ),


                          ],
                        ),
                        SizedBox(height: 20,),

                        Container(
                          width: width,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: HexColor('e0e0e0')),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            child: Container(
                              child: TextFormField(
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Theme.of(context).textTheme.bodyText2?.color,letterSpacing: -0.1),
                                  cursorHeight: 20,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Moblie Number"
                                  )
                              ),
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(_)=>widget.flight?FlightTicketScreen(): BusTicketScreen()));
                    },
                    child: Container(
                      width: width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent
                      ),
                      child: Center(
                        child: Text('Pay GHC 70.00', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16 ),),

                      ),
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
