import 'package:flutter/material.dart';

import '../components/color.dart';
import '../components/widget_component.dart';

class Help extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HelpState();
  }
}

class HelpState extends State<Help> {

  List helps = ["The Bus is speeding", "The Bus is dirty", "The Bus stinks", "The driver is rude", "Other"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [

          Text("Help us to improve our app", 
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // Card(
          //     child: ListView.builder(
          //     itemCount: helps.length,
          //     itemBuilder: (BuildContext context, int i) {
          //       return InkWell(
          //         child: Text(helps[i],), onTap: (){
          //
          //           },
          //         );
          //       },
          //     ),
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height/3,
            child: ListView.builder(
                  itemCount: helps.length,
                itemBuilder: (BuildContext context, int i){
                    return InkWell(
                      onTap: (){},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Text(helps[i]),
                        ),
                      ),
                    );
                  }
            ),
          ),


          Row(
            children: <Widget>[
              Expanded(
                child: WidgetComponent.buttons("Send",
                    textColor : Colors.white,
                    bolds: FontWeight.bold,
                    elevas: 2.0,
                    radius: 20.0,
                    padding: EdgeInsets.only(top: 8.0),
                    coloring: Colours.magenta,
                    onPressed: (){

                    }),
              )

            ],
          )
        ],
      ),
    );
  }
}