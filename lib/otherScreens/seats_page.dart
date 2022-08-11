import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:theo/otherScreens/enter_details.dart';
import '../components/flight_model.dart';

class SeatsGridPage extends StatefulWidget {
  final bool flight;
   SeatsGridPage({required this.flight});

  @override
  _SeatsGridPageState createState() => _SeatsGridPageState();
}

class _SeatsGridPageState extends State<SeatsGridPage> {
  List<int> seatsSelected = [];
  int seatTotal = 50;
  double price = 48.00;
  List unavailableSeats = [1,3,6,9,15,18,20,11,13];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor('#f5f5f5'),
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=> Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Choose your seat"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  // row with the legend
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //selected
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('Selected', style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color,fontWeight: FontWeight.w700,fontSize: 14 ),)
                        ],
                      ),

                      //available
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueAccent,

                              ),
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('Available', style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color,fontWeight: FontWeight.w700,fontSize: 14 ),)
                        ],
                      ),

                      //not available
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: HexColor('#A0A0A0'),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Icon(Icons.close_rounded, color: Colors.white,),
                          ),
                          SizedBox(width: 10,),
                          Text('Unavailable', style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color,fontWeight: FontWeight.w700,fontSize: 14 ),)
                        ],
                      ),
                    ],
                  ),

                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    height: (height/2),
                    width: width,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: seatTotal,
                      itemBuilder:
                          (BuildContext context, int index) {
                        return InkWell(
                            onTap: (){
                              if(!unavailableSeats.contains((index+1)) && !seatsSelected.contains((index+1))){
                                if(mounted){
                                  setState((){
                                    seatsSelected.add(index+1);
                                    print(seatsSelected);
                                  });
                                }

                              }
                              else if(seatsSelected.contains((index+1))){
                                if(mounted){
                                  setState((){
                                    seatsSelected.removeWhere((element) => element == (index+1));
                                    print(seatsSelected);

                                  });
                                }
                              }
                            },
                            child: SeatCard(selectedSeat:seatsSelected,index: index, available: !unavailableSeats.contains((index+1)),));
                      },
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10),
                    ),
                  )
                ],
              ),
              )

            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height/5,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Your Seat', style: TextStyle(color: HexColor('a0a0a0'),fontWeight: FontWeight.w700,fontSize: 16 ),),
                            if(seatsSelected.isNotEmpty)
                              Container(
                                constraints: BoxConstraints(maxWidth: width/2),

                                  child: Text('Seat ${seatsSelected.toString().substring(1, seatsSelected.toString().length - 1)}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16 ),)),


                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Price', style: TextStyle(color: HexColor('a0a0a0'),fontWeight: FontWeight.w700,fontSize: 16 ),),
                            if(seatsSelected.isNotEmpty)
                              Text('GHC ${price*(seatsSelected.length)}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16 ),),


                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(_)=>EnterDetails(flight: widget.flight,)));
                      },
                      child: Container(
                        width: width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent
                        ),
                        child: Center(
                          child: Text('Continue', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16 ),),

                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      ),


    );
  }
}

class SeatCard extends StatefulWidget {
  final int index;
  final List?  selectedSeat;
  final bool available;
  const SeatCard({Key? key, required this.index, required this.available, this.selectedSeat}) : super(key: key);

  @override
  State<SeatCard> createState() => _SeatCardState();
}

class _SeatCardState extends State<SeatCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('${widget.index+1}', style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color,fontWeight: FontWeight.w700,fontSize: 16 ),),
        SizedBox(width: 5,),
        Container(width: 50, height: 50,
          decoration: BoxDecoration(
            color: widget.available?((widget.selectedSeat!.contains((widget.index+1)))?Colors.blueAccent:Colors.white):HexColor('A0A0A0') ,
            borderRadius: BorderRadius.circular(10),
            border: widget.available?Border.all(color: Colors.blueAccent):null,

          ),
          child: !widget.available?Icon(Icons.close_rounded, color: Colors.white,size: 30,):null,
        ),
      ],
    );
  }
}
