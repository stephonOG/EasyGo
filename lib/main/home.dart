import 'package:flutter/material.dart';
import 'package:theo/otherScreens/select_bus.dart';
import 'package:theo/otherScreens/select_flight.dart';

import '../components/color.dart';
import '../components/widget_component.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {


  bool bus = true;


  // final formats = DateFormat("yyyy-MM-dd");
  DateTime? journeys;

  void fetchDate(){
    //todo: add the fetch data logic

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
        children: <Widget>[

          Container(
              height: height/9,
              child: Image.asset('images/easygo.png')),
          const SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  if(mounted){
                    setState((){
                      bus = true;
                    });
                  }
                },
                child: Container(
                  width: width/3,
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(spreadRadius: 1, blurRadius: 4, color: Colors.black26)
                    ],
                    color: bus? Colors.blueAccent :Colors.white,
                  ),
                  child: Center(
                    child: Text('Bus', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: bus?Colors.white:Colors.black),),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  if(mounted){
                    setState((){
                      bus = false;
                    });
                  }
                },
                child: Container(
                  width: width/3,
                  height: 40,
                  decoration: BoxDecoration(
                    color: !bus? Colors.blueAccent :Colors.white,
                    boxShadow: [
                      BoxShadow(spreadRadius: 1, blurRadius: 4, color: Colors.black26)
                    ]
                  ),
                  child: Center(
                    child: Text('Airplane', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: !bus?Colors.white:Colors.black),),
                  ),
                ),
              )
            ],

          ),
          SizedBox(height: 10,),
          if(bus)
            BusScreen(),

          if(!bus)
            PlaneScreen()


          // Text("Prefered Bus",
          //   style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontSize: 16.0),
          // ),
          //
          // Text("Favorite Bus",
          //   style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontSize: 16.0),
          // ),
        ],
      ) ,
    
    );
  }

}

class BusScreen extends StatefulWidget {
  const BusScreen({Key? key}) : super(key: key);

  @override
  State<BusScreen> createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  TextEditingController fromController = new TextEditingController();
  TextEditingController toController = new TextEditingController();
  DateTime? date;
  var agencies = ['Select Agency','VIP Agency', 'STC Agency','Metro Mass'];
  String dropDownValue = 'Select Agency';

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        // SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //     child: Text('Where do you want to travel to?', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),)),
        DropdownButton(
          style: TextStyle(color: Colors.black),
          value: dropDownValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: agencies.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropDownValue = newValue!;
            });
          },
        ),
        Card(
          elevation: 2.0,
          child: Padding(padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                WidgetComponent.formField(
                  borders: InputBorder.none,
                  label: "From",
                  prefix: Icon(Icons.location_city),
                  controllers: fromController,
                ),
                WidgetComponent.formField(
                  borders: InputBorder.none,
                  label: "To",
                  prefix: Icon(Icons.location_city),
                  controllers: toController,
                ),
                SizedBox(height: 8.0,),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0,),
        Card(
            elevation: 2.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text("Journey Date"),
                  ),
                  // DateTimeField(
                  //   format: formats,
                  //   onShowPicker: (context, currentValue) {
                  //     return showDatePicker(
                  //         context: context,
                  //         initialDate: currentValue ?? DateTime.now(),
                  //         firstDate: DateTime(1970), lastDate: DateTime(2119));
                  //   },
                  //   onChanged: (dates) {
                  //     setState(() {
                  //       journeys = dates;
                  //     });
                  //   },
                  //   decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       prefixIcon: Icon(Icons.date_range),
                  //       suffixIcon: FlatButton(onPressed: (){
                  //         setState(() {
                  //           journeys = DateTime.now();
                  //         });
                  //       }, child: Text("Today"))
                  //   ),
                  // ),
                  //date time picker
                  InkWell(
                    onTap:()async{
                      final initialDate = DateTime.now();
                      final newDate = await showDatePicker(
                          context: context,
                          initialDate: initialDate,
                          firstDate: DateTime(DateTime.now().year - 30),
                          lastDate: DateTime(DateTime.now().year + 30));
                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                      });
                      print(date);


                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white10),
                          borderRadius:
                          BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text(
                              date == null
                                  ? 'dd/mm/yy'
                                  : '${date?.day}/${date?.month}/${date?.year}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily:
                                  'Gilroy-Medium',
                                  fontWeight:
                                  FontWeight.w400,
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.color,
                                  letterSpacing: -0.1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )
        ),
        SizedBox(height: 50,),

        Container(
          height: 50,
            width: MediaQuery.of(context).size.width/1.5,
            child: WidgetComponent.buttons("Search Bus",
                textColor : Colors.white,
                bolds: FontWeight.bold,
                elevas: 2.0,
                radius: 20.0,
                padding: EdgeInsets.symmetric(vertical: 10),
                coloring: Colours.magenta,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(_)=>SelectBus()));
                }),
        ),

      ],
    );
  }
}

class PlaneScreen extends StatefulWidget {
  const PlaneScreen({Key? key}) : super(key: key);

  @override
  State<PlaneScreen> createState() => _PlaneScreenState();
}

class _PlaneScreenState extends State<PlaneScreen> {
  TextEditingController fromController = new TextEditingController();
  TextEditingController toController = new TextEditingController();
  DateTime? date;
  var agencies = ['Select Airline','Emirates', 'Ghana Airways','Kotoka ITL'];
  String dropDownValue = 'Select Airline';
  bool oneWay = true;
  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    return Column(

      children: [
        // SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //     child: Text('Where do you want to travel to?', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),)),
        DropdownButton(
          style: TextStyle(color: Colors.black),
          value: dropDownValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: agencies.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropDownValue = newValue!;
            });
          },
        ),
        Card(
          elevation: 2.0,
          child: Padding(padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                WidgetComponent.formField(
                  borders: InputBorder.none,
                  label: "From",
                  prefix: Icon(Icons.location_city),
                  controllers: fromController,
                ),
                WidgetComponent.formField(
                  borders: InputBorder.none,
                  label: "To",
                  prefix: Icon(Icons.location_city),
                  controllers: toController,
                ),
                SizedBox(height: 8.0,),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                if(mounted){
                  setState((){
                    oneWay = true;
                  });
                }
              },
              child: Container(
                width: width/3,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: oneWay?[
                  BoxShadow(spreadRadius: 1, blurRadius: 4, color: Colors.black26)
                  ]:null,
                  color: oneWay? Colors.blueAccent :Colors.white,
                ),
                child: Center(
                  child: Text('One-way', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: oneWay?Colors.white:Colors.black),),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(mounted){
                  setState((){
                    oneWay = false;
                  });
                }
              },
              child: Container(
                width: width/3,
                height: 40,
                decoration: BoxDecoration(
                    color: !oneWay? Colors.blueAccent :Colors.white,
                    boxShadow: !oneWay?[
                      BoxShadow(spreadRadius: 1, blurRadius: 4, color: Colors.black26)
                    ]:null
                ),
                child: Center(
                  child: Text('Return trip', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: !oneWay?Colors.white:Colors.black),),
                ),
              ),
            )
          ],

        ),

        SizedBox(height: 8.0,),

        Card(
            elevation: 2.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text("Journey Date"),
                  ),
                  // DateTimeField(
                  //   format: formats,
                  //   onShowPicker: (context, currentValue) {
                  //     return showDatePicker(
                  //         context: context,
                  //         initialDate: currentValue ?? DateTime.now(),
                  //         firstDate: DateTime(1970), lastDate: DateTime(2119));
                  //   },
                  //   onChanged: (dates) {
                  //     setState(() {
                  //       journeys = dates;
                  //     });
                  //   },
                  //   decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       prefixIcon: Icon(Icons.date_range),
                  //       suffixIcon: FlatButton(onPressed: (){
                  //         setState(() {
                  //           journeys = DateTime.now();
                  //         });
                  //       }, child: Text("Today"))
                  //   ),
                  // ),
                  //date time picker
                  InkWell(
                    onTap:()async{
                      final initialDate = DateTime.now();
                      final newDate = await showDatePicker(
                          context: context,
                          initialDate: initialDate,
                          firstDate: DateTime(DateTime.now().year - 30),
                          lastDate: DateTime(DateTime.now().year + 30));
                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                      });
                      print(date);


                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white10),
                          borderRadius:
                          BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text(
                              date == null
                                  ? 'dd/mm/yy'
                                  : '${date?.day}/${date?.month}/${date?.year}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily:
                                  'Gilroy-Medium',
                                  fontWeight:
                                  FontWeight.w400,
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.color,
                                  letterSpacing: -0.1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )
        ),

        if(!oneWay)...[
          SizedBox(height: 8.0,),

          Card(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text("Return Date"),
                    ),
                    // DateTimeField(
                    //   format: formats,
                    //   onShowPicker: (context, currentValue) {
                    //     return showDatePicker(
                    //         context: context,
                    //         initialDate: currentValue ?? DateTime.now(),
                    //         firstDate: DateTime(1970), lastDate: DateTime(2119));
                    //   },
                    //   onChanged: (dates) {
                    //     setState(() {
                    //       journeys = dates;
                    //     });
                    //   },
                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       prefixIcon: Icon(Icons.date_range),
                    //       suffixIcon: FlatButton(onPressed: (){
                    //         setState(() {
                    //           journeys = DateTime.now();
                    //         });
                    //       }, child: Text("Today"))
                    //   ),
                    // ),
                    //date time picker
                    InkWell(
                      onTap:()async{
                        final initialDate = DateTime.now();
                        final newDate = await showDatePicker(
                            context: context,
                            initialDate: initialDate,
                            firstDate: DateTime(DateTime.now().year - 30),
                            lastDate: DateTime(DateTime.now().year + 30));
                        if (newDate == null) return;
                        setState(() {
                          date = newDate;
                        });
                        print(date);


                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white10),
                            borderRadius:
                            BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text(
                                date == null
                                    ? 'dd/mm/yy'
                                    : '${date?.day}/${date?.month}/${date?.year}',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily:
                                    'Gilroy-Medium',
                                    fontWeight:
                                    FontWeight.w400,
                                    color: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.color,
                                    letterSpacing: -0.1),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
          ),
        ],
        SizedBox(height: 50,),

        Container(
          height: 50,
          width: MediaQuery.of(context).size.width/1.5,
          child: WidgetComponent.buttons("Search Flight",
              textColor : Colors.white,
              bolds: FontWeight.bold,
              elevas: 2.0,
              radius: 20.0,
              padding: EdgeInsets.symmetric(vertical: 10),
              coloring: Colours.magenta,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(_)=>SelectFlight()));
              }),
        ),
        SizedBox(height: 50,),


      ],
    );
  }
}

